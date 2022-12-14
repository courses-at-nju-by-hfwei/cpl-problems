# 扫雷1.0 (mines.c)

## 题目描述

经典游戏扫雷中，给出一张 $n\times n$ 的地图，每个格子上给出了周围 $ 8$ 个格子 (边角为 $ 5$ 或 $ 3$ 个) 存在的地雷数量，玩家需要根据这个信息猜测出某个格子上是否有地雷。

现在给出一张 $ n\times n $ 的地图，上面标示了某处是否有地雷，请你为没有地雷的位置填上相应的数字。

## 输入格式

第一行为一个 $n $ $(n\le 100)$，表示地图大小为 $n\times n$；

接下来 $n$ 行表示地图，用 `'o'` 表示没有地雷，`'*'` 表示有地雷。

## 输出格式

$ n$ 的地图，图中 `'*'` 表示地雷，其余位置标记上周围的地雷数目 ($ 0$ ~ $ 8$)。

## 备注

如果你觉得**统计周围地雷数量**实现起来比较复杂，可以观察下面一段演示代码，该代码在 `count` 变量中统计了 `(i, j)` 位置上下左右 `'?'` 的数量

```c
int vectors[4][2] = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}};

int count = 0;
for (int k = 0; k < 4; ++k) {
    int newI = i + vectors[k][0];
    int newJ = j + vectors[k][1];
    if (arr[newI][newJ] == '?') {
        count++;
    }
}
```

你可以通过修改 `vectors` 变量和 `if` 语句的条件来完成统计周围所有地雷数量的任务。（注意边界！）

---

减难度之前的扫雷2.0可能会在日后与大家相遇，难度呃呃。。。

## 示例

### 示例输入1

4
o*oo
*ooo
ooo*
oo*o


### 示例输出1

2*10
*221
122*
01*2
