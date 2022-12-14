#  阶乘的和 Ⅰ（factorial.c)

## 题目描述

给定正整数 $n$，计算 $(\sum\limits_{i=1}^ni!)\ \\%\ 10007$ 的值，其中 $i!$ 为 $i$ 的阶乘，$\\% $表示取模。

例如，当 $n = 13$ 时，阶乘的和为 $ 6749977113$，由于 $ 6749977113\ \\%\ 10007=5438$。所以你需要输出 $ 5438$。

## 输入格式

一个正整数 $n$，$ 1\leqslant n\leqslant 25$。

## 输出格式

一个整数，为 $ \left(\sum\limits_{i=1}^ni!\right)\ \\%\ 10007$ 的值

## 备注

提示：

1. $\left(\sum\limits_{i=1}^na_i\right)\ \\%\ m = \sum\limits_{i=1}^n(a_i\ \\%\ m)\ \\%\ m$
2. $\left(\prod\limits_{i=1}^na_i\right)\ \\%\ m=\prod\limits_{i=1}^n(a_i\ \\%\ m)\ \\%\ m$

如果你直接求完所有数的和再取模，肯定会**超出任何整数数据类型的范围**，导致只有$ 50$分。

理解上述两个公式并在程序中表达吧。

---

如果你有时间，不妨看看附加题 [阶乘的和 Ⅱ](https://oj.cpl.icu/contest/5/problem/20)

## 示例

### 示例输入1

3

### 示例输出1

9

### 示例输入2

13

### 示例输出2

5438