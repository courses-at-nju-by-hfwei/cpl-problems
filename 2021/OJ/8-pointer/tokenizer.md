# 不太简单的词法分析器(tokenizer.c)

## 题目描述

### 这题建议放最后一个做 拿到87分就可以跑路了

**12.08更新：本题推荐的思路是，用 scanf("%s", ) 来逐词读入->读入->处理->用一个字符串保存输出。对于分号，本题的测试数据输入只可能有两个词夹一个分号、词尾分号、整个词只有一个分号的情况。**

```c
while (scanf("%s", s) != EOF) {
  char *position = strchr(s, ';');   // if there's no ';' in s, it returns NULL.
  if (position == NULL) process(s);
  else {
    process(s 中分号前的部分);
    在输出末尾加个换行;
    process(s 中分号后的部分);
  }
}
```

用 scanf 的好处之二是，你根本就不用考虑输入中的任何空格或换行。

如果你没思路可以按这个思路写；如果你一直87，de不出bug，也可以按这个思路重写。*肯定比先整体读完，再分割的短到不知道哪里去了。*

**助教出这道题的时候手抖删库造成作业延误，你们千万不能变成他那样**

~原名：简简单单词法分析器（助教出得心态崩了）~

蚂蚁蚂蚁做 OJ 每天都会遇到新的 Compile Error，他希望你帮他报仇：OJ 给你一段代码，你给它判 Compile Error。这一次，终于轮到你了！

为了编译程序，我们第一步是要分析程序的每一个单词，把字符串序列转换为单词序列。

设定一种 y 语言，以分号 ';' 作为语句的分界，以空格作为单词的分界。其单词具有如下几种形式：

1、保留字 (reserved)。设定有16种，分别是 const, int, float, double, long, static, void, char, extern, return, break, enum, struct, typedef, union, goto

2、整数 (integer)。负号不算在内

3、浮点数 (float)。负号不算在内。形如 1. 和 .1 的也算是浮点数

4、运算符 (operator)。设定11种，分别是 +, -, *, /, =, ==, !=, >=, <=, >, <

5、变量 (variable)。由字母、数字、下划线组成，但不能以数字开头

要求：每条语句输出一行，给出语句的分析结果；

一条语句的分析结果中，各成分以空格隔开。

如果存在不符合约定的成分，则输出"Compile Error"。

不符合约定的成分例子比较多，比如：

```cpp
1..1   // 浮点数不能有两个小数点
-1   // 约定中整数不含负号
2a   // 变量开头不是数字
a || b   // 约定中没有 || 运算符
```

## 输入格式

不定长的字符串，小于 4096 字节，表示一段程序。

**句子成分的长度均只受总长度限制。想想整数！想想浮点数！**

## 输出格式

多行，每行分析一条语句。

如果整个程序中有不符合约定的地方，仅输出 "Compile Error"。

## 脚注

为了保通过率，助教会逐渐放多一点测试用例。适当关注。

## 样例

### 样例输入

const int a = 1;float b = a + 1.1;
const int a = 1 ; float b = a + 1.1;

### 样例输出

reserved reserved variable operator integer
reserved variable operator variable operator float
reserved reserved variable operator integer
reserved variable operator variable operator float

### 样例输入

int a = 1;
int b = true || false;

### 样例输出

Compile Error

### 样例输入

1 2 3 4 5;

### 样例输出

integer integer integer integer integer

### 样例输入

char ch; return true; return 0;

### 样例输出

reserved variable
reserved variable
reserved integer

### 样例输入

b = 2a + b;

### 样例输出

Compile Error

### 样例输入

double d = 34.324823748923642234234823764827346234239472398709825729386752439085610198236740584635092843;

### 样例输出

reserved variable operator float

### 样例输入

char a = 0;
break;
extern const long int a;
static struct _c b;
return 0;

### 样例输出

reserved variable operator integer
reserved
reserved reserved reserved reserved variable
reserved reserved variable variable
reserved integer

### 样例输入

1..0;

### 样例输出

Compile Error

### 样例输入

1 + 1 - 1 * 1 / 1 = 1 == 1 != 1 >= 1 <= 1 > 1 < 1;

### 样例输出

integer operator integer operator integer operator integer operator integer operator integer operator integer operator integer operator integer operator integer operator integer operator integer
