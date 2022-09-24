# 0-1 比特翻转 (flip.c)

## 题目描述

考虑一个长度为 $n$ 的 01 比特序列，各比特编号为 $1, 2, 3, \cdots, n$。

序列初始为全 $0$ ，现对其进行如下 $n$ 次（$n = 1, 2, \cdots, i, \cdots,n$）操作：

第 $i$ 次操作会翻转编号为 $i$ 的倍数的比特： $1$ 变成 $0$，$0$ 变成 $1$。

第 $n$ 次操作结束后，请输出最后为 $1$ 的比特的编号。

### 限制与约定

对于 80% 的数据，$n \leq 2000$。

对于所有的数据，$n \leq 10^5$。

### 提示

如果你的程序获得了 TLE 的结果并得到了 80 分，不妨思考一下怎样才能减少循环运行的次数。

## 输入格式

输入为一行一个整数 $n$ ，表示序列的长度。

## 输出格式

输出一共包含一行，可能包含多个整数。

从小到大输出所有最后为 $1$ 的比特的编号。

## 脚注

### Another Hint

仔细看看输出，你能发现什么规律吗？

## 样例

### 样例输入

5

### 样例输出

1 4