# 链表

## 题目描述

实现一个循环链表，初始时链表有 $n$ 个结点，第 $i$ 个结点值为 $i$，且按照如下方式连接在一起（$n=4$ 时，其他 $n$ 类似）

```mermaid
1 --> 2
^     |
|     V
4 <-- 3
```

你有一个指针指向第一个结点，链表支持以下操作：

* Forward m：向前移动 m 步
* Backward m：向后移动 m 步
* Insert p：向当前指向的结点后面新增一个结点，结点值为 p
* Remove：删除当前指向的结点并让指针指向下一结点（数据保证删除后链表不为空）
* Print：打印当前指向的结点

## 输入格式

输入包含多行，第一行为一个正整数 $n$ 和一个正整数 $T$，表示操作数量（$ 1\leqslant n,\ T\leqslant 114514$）

接下来 $T$ 行，每行的格式如下

* Forward m：其中（$ 0\leqslant m\leqslant 1919810$），表示将指针前移 m 个结点
* Backward m：其中（$ 0\leqslant m\leqslant 1919810$），表示将指针后移 m 个结点
* Insert m：其中（m 在 int 范围内），表示插入一个值为 m 的结点
* Remove：表示删除当前指向的结点并指向下一结点
* Print：打印当前结点的值

## 输出格式

对于每次 Print，打印一行，为当前结点的值

## 脚注

**如果你得到了时间超限，那有可能是 Forward 和 Backward 导致的，请优化你的代码**

## 样例

### 样例输入

4 7
Forward 1
Backward 0
Print
Remove
Insert 114514
Forward 1
Print

### 样例输出

2
114514
