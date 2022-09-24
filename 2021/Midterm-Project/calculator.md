# 超超超级计算器

## 题目描述

本项目要求实现一个表达式求值工具, 要求每次可以输入赋值语句(如 `a = 233`）或者表达式(如 `a + 114514`）, 并对于表达式输出它的值. 对于表达式或赋值语句本身的错误, 请输出 `Error`. 以下是一种可接受的例子

```
输入: 1 + 2
输出: 3
输入: a = 6
输入: a + 3
输出: 9
输入: 1 + 2 )
输出: Error
```

### 数学表达式求值

给你一个表达式的字符串

```
"5 + 4 * 3 / 2 - 1"
```

你如何求出它的值? 表达式求值是一个很经典的问题, 以至于有很多方法来解决它. 我们在所需知识和难度两方面做了权衡, 在这里使用如下方法来解决表达式求值的问题:

1. 首先识别出表达式中的单元
2. 根据表达式的归纳定义进行递归求值

#### 词法分析

在[不太简单的词法分析器(tokenizer.c)](http://172.26.41.176:5000/contest/13/problem/83)中, 你应该已经实现过一个简易的词法分析器, 而在这个项目中, 我们有以下几种token

1. 变量(variable): 由字母、数字、下划线组成, 但不能以数字开头
2. 整数(integer): 负号不算在内
3. 运算符(operator):`+, -, *, /, (, )`

但是在[不太简单的词法分析器(tokenizer.c)](http://172.26.41.176:5000/contest/13/problem/83)中, 你只需要记录token的类型, 而此处则需要记录token的信息以供下一步运算, 所以你可以利用如下的结构体保存token的内容(仅作建议, 不强制)

```
typedef struct token {
  int type;
  char str[32];
} Token;
```

#### 递归求值

把表达式中的token识别出来之后, 我们把它们存在一个数组里, 接下来就可以进行下一步的运算, 举个例子

```
"4 +3*(2- 1)"
```

的token表达式即为

```
+-----+-----+-----+-----+-----+-----+-----+-----+-----+
| NUM | '+' | NUM | '*' | '(' | NUM | '-' | NUM | ')' |
| "4" |     | "3" |     |     | "2" |     | "1" |     |
+-----+-----+-----+-----+-----+-----+-----+-----+-----+
```

根据表达式的归纳定义特性, 我们可以很方便地使用递归来进行求值.

首先我们给出算术表达式的归纳定义:

```
<expr> ::= <integer>    # 一个数是表达式
| <variable>          # 一个变量也是表达式
| "(" <expr> ")"     # 在表达式两边加个括号也是表达式
| <expr> "+" <expr>  # 两个表达式相加也是表达式
| <expr> "-" <expr>  # 接下来你全懂了
| <expr> "*" <expr>
| <expr> "/" <expr>
```

上面这种表示方法就是大名鼎鼎的[BNF](https://en.wikipedia.org/wiki/Backus–Naur_form), 任何一本正规的程序设计语言教程都会使用BNF来给出这种程序设计语言的语法.

为了在token表达式中指示一个子表达式, 我们可以使用两个整数 `l`和 `r`来指示这个子表达式的开始位置和结束位置. 这样我们就可以很容易把求值函数的框架写出来了:

```
eval(l, r) {
  if (l > r) {
    /* Wrong expression */
  }
  else if (l == r) {
    /* Single token.
     * For now this token should be a number or variable.
     * Return the value of the number or variable.
    */
  }
  else if (check_parentheses(l, r) == 1) {
    /* The expression is surrounded by a matched pair of parentheses.
     * If that is the case, just throw away the parentheses.
    */
    return eval(l + 1, r - 1);
  }
  else {
    /* We should do more things here. */
  }
}
```

其中 `check_parentheses()`函数用于判断

1. 表达式是否被一对匹配的括号包围着
2. 表达式的左右括号是否匹配

如果不匹配, 这个表达式肯定是不符合语法的, 也就不需要继续进行求值了.

我们举一些例子来说明 `check_parentheses()`函数的功能:

```
"( 2 - 1 )"             // true
"( 4 + 3 * ( 2 - 1 ) )"   // true
"4 + 3 * ( 2 - 1 )"     // false, the whole expression is not surrounded by a matched
// pair of parentheses
"( 4 + 3 ) ) * ( ( 2 - 1 )" // false, bad expression
"( 4 + 3 ) * ( 2 - 1 )"   // false, the leftmost '(' and the rightmost ')' are not matched
```

上面的框架已经考虑了BNF中算术表达式的开头三种定义, 接下来我们来考虑剩下的情况(即上述伪代码中最后一个 `else`中的内容). 一个问题是, 给出一个最左边和最右边不同时是括号的长表达式, 我们要怎么正确地将它分裂成两个子表达式?

我们定义"主运算符"为表达式人工求值时, 最后一步进行运行的运算符, 它指示了表达式的类型(例如当一个表达式的最后一步是减法运算时, 它本质上是一个减法表达式).

要正确地对一个长表达式进行分裂, 就是要找到它的主运算符. 我们继续使用上面的例子来探讨这个问题:

```
"4 + 3 * ( 2 - 1 )"
/*********************/
case 1:
      "+"
   /      \
"4"     "3 * ( 2 - 1 )"

case 2:
        "*"
     /       \
"4 + 3"     "( 2 - 1 )"

case 3:
             "-"
           /     \
"4 + 3 * ( 2"     "1 )"
```

上面列出了3种可能的分裂, 注意到我们不可能在非运算符的token处进行分裂, 否则分裂得到的结果均不是合法的表达式.

根据主运算符的定义, 我们很容易发现, 只有第一种分裂才是正确的. 这其实也符合我们人工求值的过程: 先算 `4`和 `3 * ( 2 - 1 )`, 最后把它们的结果相加. 第二种分裂违反了算术运算的优先级, 它会导致加法比乘法更早进行. 第三种分裂破坏了括号的平衡, 分裂得到的结果均不是合法的表达式.

通过上面这个简单的例子, 我们就可以总结出如何在一个token表达式中寻找主运算符了:

1. 非运算符的token不是主运算符.
2. 出现在一对括号中的token不是主运算符. 注意到这里不会出现有括号包围整个表达式的情况, 因为这种情况已经在`check_parentheses()`相应的if块中被处理了.
3. 主运算符的优先级在表达式中是最低的. 这是因为主运算符是最后一步才进行的运算符.

当有多个运算符的优先级都是最低时, 根据结合性, 最后被结合的运算符才是主运算符. 一个例子是 `1 + 2 + 3`, 它的主运算符应该是右边的 `+`.
要找出主运算符, 只需要将token表达式全部扫描一遍, 就可以按照上述方法唯一确定主运算符.

找到了正确的主运算符之后, 事情就变得很简单了: 先对分裂出来的两个子表达式进行递归求值, 然后再根据主运算符的类型对两个子表达式的值进行运算即可. 于是完整的求值函数如下:

```
eval(l, r) {
  if (l > r) {
    /* Wrong expression */
  }
  else if (l == r) {
    /* Single token.
     * For now this token should be a number or variable.
     * Return the value of the number or variable.
    */
  }
  else if (check_parentheses(l, r) == 1) {
     /* The expression is surrounded by a matched pair of parentheses.
      * If that is the case, just throw away the parentheses.
      */
    return eval(l + 1, r - 1);
  }
  else {
    op = the position of 主运算符 in the token expression;
    val1 = eval(l, op - 1);
    val2 = eval(op + 1, r);

    switch (op_type) {
      case '+': return val1 + val2;
      case '-': /* ... */
      case '*': /* ... */
      case '/': /* ... */
      default: assert(0);
    }
  }
}
```

#### 实现带有负数的算术表达式的求值 (选做)

在上述实现中, 我们并没有考虑负数的问题, 例如

```
"1 + -1"
"--1"    /* 我们不实现自减运算, 这里应该解释成 -(-1) = 1 */
```

它们会被判定为不合法的表达式. 为了实现负数的功能, 你需要考虑两个问题:

1. 负号和减号都是-, 如何区分它们?
2. 负号是个单目运算符, 分裂的时候需要注意什么?

#### 浮点数支持（选做）

如果要支持浮点数, 你无法简单地用一个 `int eval(int l, int r)` 来进行求值, 因为你不知道当前是整数还是浮点数, 那么你可能需要(仅作建议, 不强制)

```
typedef struct value {
  union {
    double a;
    int b;
  }val;
  enum NumberType{
    DOUBLE, INT
  }tp;
}Value;

Value eval(int l, int r);
```

关于 `union`和 `enum`, 你可能需要自行查看教材

至于类型转换, 就需要你自己实现了

### 变量赋值

我们称变量赋值语句为 `<assignment>`, 那么

```
<assignment> ::= <variable> "=" <expr>
```

首先, 我们需要检查 `<variable>` 即变量名的合法性, 如果不合法需要报错.

然后我们可以用一个结构体, 记录下变量和对应的值, 从而来记录现在有的所有的赋值, 如(仅作建议, 不强制)

```
typedef struct assignment {
  char nam[15];
  int val;
} Assignment;
```

那么你就可以开一个 `Assignment` 类型的数组, 把所有的赋值关系存下来

当你在 `eval`中遇到需要查询一个变量的值的时候, 就只需要在这个数组里找到符合的, 然后返回对应的值

#### 连续变量赋值(选做)

我们可以发现上边的赋值语句并不支持形如 `a = b = c = 233` 的赋值语句, 我们称这种赋值语句为连续赋值语句

那么,

```
<assignment> ::= <variable> "=" <expr>
| <variable> "=" <assignment>
```

实现连续变量赋值的方法有很多, 相信你能自己实现捏

### 声明

本文档参考并引用了 [南京大学 计算机科学与技术系 计算机系统基础 课程实验 2020](https://nju-projectn.github.io/ics-pa-gitbook/ics2020/1.5.html), 且遵守[署名-非商业性使用-相同方式共享 3.0 中国大陆 (CC BY-NC-SA 3.0 CN)](https://creativecommons.org/licenses/by-nc-sa/3.0/cn/)

## 输入格式

每次输入输入一个表达式或赋值语句，保证运算结果在`int` / `double` 范围内，保证不同token之间一定有空格

## 输出格式

对于不合法的表达式或赋值语句，输出`Error`

对于合法表达式输出表达式的值（小数保留`6`位）

对于合法赋值语句不输出

## 脚注

## 样例输入

1+2

## 样例输出

3
