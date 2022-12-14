# 最短路径 (obstacle.c)

## 题目描述

二维平面上有一只小蚂蚁。小蚂蚁初始在 A 点（坐标$(x_A, y_A)$），它想要移动到 B 点（$（x_B, y_B）$）。

小蚂蚁的移动方式非常独特，在每一步中，它只能选择以下四种移动方式之一：

* `U` ：从 $(x, y)$ 移动到 $(x, y + 1)$ ；
* `D` ：从 $(x, y)$ 移动到 $(x, y - 1)$ ；
* `L` ：从 $(x, y)$ 移动到 $(x - 1, y)$ ；
* `R` ：从 $(x, y)$ 移动到 $(x + 1, y)$ ；

平面上还有一点 C （坐标 $(x_C, y_C)$）被大坏蛋占领了，小蚂蚁在移动的过程中不能经过 C 点。小蚂蚁想要用最少的步数到达目标位置，请你帮助小蚂蚁计算最少的步数并规划一条可行的路线。

## 输入格式

输入包含一行 6 个整数，分别为 $x_A, y_A, x_B, y_B, x_C, y_C$ 。

## 输出格式

输出包含两行，第一行为一个整数 $n$ ，表示最小步数；第二行输出一个包含 $n$ 个字符、由 `UDLR` 组成的字符串，表示一条可行的路径。

可能有多条符合条件的路径，可以输出任意一条。

为了使同学们能得到更高的分数，Tilnel 酱给 OJ 施加了一些魔法，如果你计算出了正确的步数却没能正确输出路径，将获得一个 <font color=#ffc107>部分正确</font> 并得到该测试点 $ 75 $% 的分数。

## 备注

$ 0 \leq |x_A|, |y_A|, |x_B|, |y_B|, |x_C|, |y_C| \leq 10^9, 0 \leq |x_A - x_B|, |y_A - y_B| \leq 10^5$ ，保证输入的坐标都为整数，且 A 、B 、C 三个点的坐标两两不相等。

### Hint

OJ 按通过的测试用例给分，所以即使没有全面考虑所有的情况，也有可能拿到高分，甚至接近满分。快来试试吧。

如果你认为自己真的需要帮助，可以点击“详情”展开提示。

<details>

##### Hint 1

如果没有障碍物，起点和终点的方位关系有几种情况？对应的最少步数是多少？最短路径又有多少种？

##### Hint 2

考虑向你在 Hint 1 中找到的最短路径（们）中加入一个障碍物，什么情况下会对答案产生影响，如果产生影响，步数和路径会怎样变化？

##### Hint 3

如何“合并同类项”，把你的想法整理成 2 ~ 3 种不同的情况？

</details>

## 示例

### 示例输入1

1 1 2 2 3 3

### 示例输出1

2
UR

### 示例输入2

6 7 -1 -2 0 0

### 示例输出2

16
LLDLLLLLDDDDDDDD