# 超级鸡尾酒(wine.c)

## 题目描述

成了新世界的卡密以后，水龙gg来到了夜之城的特色景点：大*转转转酒吧

水龙gg本想对酒保说"Three measures of Gordon’s, one of vodka, half a measure of Kina Lillet. Shake it very well until it’s ice-cold, then add a large thin slice of lemon peel.",但他觉得这不够[cyberpunk](https://zh.wikipedia.org/wiki/%E8%B5%9B%E5%8D%9A%E6%9C%8B%E5%85%8B),于是他要求酒保来一杯最贵的超级鸡尾酒（希望酒吧不会爆炸）

现在，你是这个酒吧的酒保，你有$n$种基础酒，每种酒每毫升价值$v_i$，每种酒最多加$w_i$毫升，鸡尾酒酒杯容量L毫升，请你调出最贵的鸡尾酒，来好好揩一下水龙gg靠刷天外油画获得的油水

## 输入格式

第一行两个数n,L,n表示酒的数量,L表示鸡尾酒酒杯的容量

第二行n个数表示每种基础酒每毫升的价值

第三行n个数表示每种基础酒**最多加**多少毫升

保证所有数据都是整数，n<=10000

**不保证第二第三行中的数据两两互不相同**

## 输出格式

一个数，表示最贵的鸡尾酒调配法对应的价值

## 脚注

##### 样例说明

第一种酒加4毫升，第二种酒加2毫升，第三种酒加4毫升，此时这杯酒价值最大

##### 简单提示

优先加入每毫升最贵的鸡尾酒，加入到不能加为止(杯子满了或这个酒无法再加了)，然后加入每毫升第二贵的酒，以此类推……

##### 进阶提示

首先肯定是对每种酒的每毫升价值排序，但是排序的时候我们怎么知道他到底是几号酒呢？（我们需要知道他是几号酒来查询他最多能加多少）

接下来以大家学过的插入排序（**建议大家先看看那题的标程**）为例：

考虑在原数组(a[1000])之外有一个新的数组为标号的数组，比如是idx[1000]，我们插入第i号酒的时候，比如我们找到了pos这个位置插入，接下来我们要把a数组中下标pos之后的所有数字往后挪一位的时候，我们把idx数组下标pos之后的数字也往后挪一位，再令idx[pos]=i,。

思考上述过程，这样价值为a[i]的酒的编号idx[i]就被得到了

**当然，思路不局限于上述做法(如果复用插入排序的代码，在插入排序部分只需要加两行，不要想复杂了**)

接下来往酒杯里加酒的过程，只需要按排序之后的结果尽可能往酒杯里加酒就行了

## 样例

### 样例输入

3 10
5 8 2
4 2 12

### 样例输出

44