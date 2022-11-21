# 三角形 (triangle.c)

## 题目描述

给出一个整数 $n\ (1 \leq n \le 10)$ ，请按以下的规律打印出三角形图案（详见样例）

## 输入格式

一个整数 $n$

## 输出格式

所求的三角形图案。

**注意输出'\\0'和' '（空格）的区别**

## 备注

~~数据规模太小，甚至可以打表~~

多用**自定测试**，本地跑看不出问题的！行末多空格不会对结果造成影响。

---

提示：

* 在往期作业 “回文字符串 2.0” 中，我们让大家不要执着于把两位的字符串塞进字符数组里面去，而这题中**反其道而行之**可能是更好的方法。即，想象一张足够大的画布（二维数组），然后利用一个递归函数 `paint(...)` 去不断在这张画布上画出三角形。
* 思考一：“足够大”是多大？能否根据 $n$ **精确**计算这张画布的大小。
* 思考二：考虑一个 $n = 1$ 的基本问题，即画出` /\ ('\n')/__\`基本图形，当 $n \neq 1$ 时，画出的图案可以看做在画布的若干适当位置解决 $n = 1$ 的基本问题（即画出上述图形）。
* 思考三：接思考二，如何找到那些“适当位置”？当 $n$ 很大时，能否利用规模为 $n$ 和 规模为 $n - 1$ 的问题的关系分解问题，最终将所有问题都划归到 $n = 1$ 的基本问题解决？
* 思考四：如何使用递归函数实现以上过程？现给出一个参考的函数定义 `void paint(int n, int x, int y)` ，其中 $(x, y)$ 表示一个坐标（或可以理解为二维数组的一个下标），请结合以上思考考虑这些参数的具体含义并完成本题。

## 示例

### 示例输入1

```text
1
```

### 示例输出1

```text
 /\
/__\
```

### 示例输入2

```text
2
```

### 示例输出2

```text
   /\
  /__\
 /\  /\
/__\/__\
```

### 示例输入3

```text
3
```

### 示例输出3

```text
       /\
      /__\
     /\  /\
    /__\/__\
   /\      /\
  /__\    /__\
 /\  /\  /\  /\
/__\/__\/__\/__\
```