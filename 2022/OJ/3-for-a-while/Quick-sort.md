# 魔法阵(Quick-sort.c)

## 题目描述

### 题目背景

原本有一些背景，现在在`ddl`前被魔法阵消除了，并且魔法为你带来了更多提示

### 题目描述

在本题中你需要用程序**严格实现**下面的算法：

假设待排序的数组为 $a_0, a_1, \ldots, a_{n-1}$ ，本趟排序开始前，首先需要选定一个“中间值” $pivot$ ，期望在本趟排序完成之后将所有 $< pivot$ 的数放到数组的左侧，而所有 $\geq pivot$ 的数放到数组的右侧。为了方便，通常取 $pivot = a_{k-1}$ ，即从数组中取一个数。在本题中，**保证 $pivot$ 在数组中仅出现一次 ，这个算法实现的是：算法执行完成后 $pivot$ 右侧的数均 $> pivot$ ，而其左侧的数均 $<pivot$** 。

排序过程中，首先使用两个变量 $l$ 和 $r$ ，$l$ 按 $ 0, 1, 2, \ldots, n-1$ 的顺序从左向右遍历数组下标，初始为 $ 0$ ，而 $ r$ 按 $ n-1, n - 2, n - 3, \ldots, 0$ 的顺序从右向左遍历下标，初始为 $ n-1$。排序过程如下：

1. $l$ 从当前位置向右遍历，直到 $ l ==r$ 或遇到一个 $ \gt pivot$ 的数。（如果你之前写的是$\ge$也无所谓，因为$pivot$的值仅出现一次）
2. $ r$ 从当前位置向左遍历，直到 $l == r  $ 或遇到一个 $< pivot$ 的数。
3. 如果 $l$ 和 $r$ 不相等 ，则交换 $a_l$ 和 $a_r$ 的值。
4. 如果 $l$ 和 $ r$ 不相等，继续从步骤 1 开始往下执行，直到 $l$ 与 $r$ 相等为止。

在 $l$ 和 $r$ 相遇以后，当前的数组 $a$ 仍可能不满足本题中的要求。为满足要求，还需对 $a$ 中的两个元素进行至多一次交换，不妨来看看样例2，当 $l$ 已经找到一个大于等于 $pivot$ 的数，但 $r$ 并未找到一个小于 $pivot$ 的数就已经与 $l$ 相等了的时侯，在 $pivot$ 的左边仍然有一个大于等于它的数，这时就需要将 $l$ 这个位置上的数与 $pivot$ 对应位置的数相交换。

请注意：为实现本题的目的有多种正确的实现，**如果你不严格按照上述给出的方法编写代码，将很可能拿不到本题的分数。**

你可能还想问：如何才能找到 $pivot$ 现在在哪个位置呢？

同样有多种做法，不过用不同的实现不会影响你的得分（只要你的实现确实是正确的），这里给出最简单的做法：

既然 $pivot$ 的值在数组中仅出现一次，在算法开始之前记录下它的值，然后在循环结束后再遍历一遍数组，看看和它相等的数在哪个位置就可以了

## 输入格式

第一行为两个整数 $n$ 和 $k$，以空格隔开，分别表示序列的长度和被选为中间值的数在序列是第几个数，即 $pivot = a_{k-1}$（序列从0开始编号），保证 $ 1\le n\le 1000000， 1\le k \le n$，第 $k$ 个数在序列中只出现一次。

第二行，$n$ 个整数，以空格隔开，表示待排序的数列，保证在 `int` 范围内。

## 输出格式

共一行 $n$ 个整数，以空格隔开，表示经过题目描述的算法排序后的序列。

## 备注

本题的算法原型是快速排序的分区交换算法。

做完了题目，你可能仍有疑惑：快速排序为什么是正确的？在这里我们给出一个形象的理解方式（不是证明）：在一趟排序之后，我们保证了存在某个下标 $p$ ，使得 $a[0: p]$ 和 $a[p + 1 : n-1]$ 两个区间中任何两个数有序，如果我们进行很多趟，每趟都选取合适的区间 ，直到数组中的每一个 $a[i : i]$ 和 $a[i + 1: i + 1]$ 都有序，那么排序就完成了。

多位助教一致认为，无论如何，有关快速排序的性质（如正确性、时间、稳定性等问题）都不是一个在面向 0 基础的第四节课的作业中应该思考的问题，请同学们不必纠结，随着学习深入自会对这些问题有更深刻的理解。助教在答疑时也只会点到即止（事实上，有些太过于高深的问题助教也搞不清楚 qaq）。

## 示例

### 示例输入1

7 5
1 9 1 9 8 1 0

### 示例输出1

1 0 1 1 8 9 9

### 示例输入2

5 3
1 6 5 7 8

### 示例输出2

1 5 6 7 8