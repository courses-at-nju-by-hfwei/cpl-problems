# Julian

## 题目描述

儒略日 （ Julian Day ）是在儒略周期内以连续的日数计算时间的计时法，主要是天文学家在使用。

儒略日数（ Julian Day Number ，JDN ）的计算是从格林威治标准时间的中午开始，包含一个整天的时间，起点的时间（ 0 日）回溯至儒略历的西元前 4713 年 1 月 1 日中午 12 点。例如，2000 年 1 月 1 日的 12:00 是儒略日 2,451,545 。

给出公历中的年、月、日表示（$year, month, day$），儒略日数（$JDN$）可用如下公式计算：

$a = \lfloor \frac{14 - month}{12} \rfloor$

$y = year + 4800 - a$

$m = month + 12a - 3$

$JDN = day + \lfloor \frac{153m + 2}{5} \rfloor + 365y + \lfloor \frac{y}{4} \rfloor - \lfloor \frac{y}{100} \rfloor + \lfloor \frac{y}{400} \rfloor - 32045$

给出公历中的一个年、月、日，请你写一个程序计算儒略日数。

## 输入格式

一行三个整数 $year, month, day$，用空格分隔。

## 输出格式

一行一个整数 $JDN$ ，即所求答案。

## 备注

保证输入数据为公历 1900 年 1 月 1 日 到 2599 年 12 月 31 日之间的某一个合法日期。

$\lfloor x \rfloor$ 表示 对 $x$ 向下取整，比如 $\lfloor 3.2 \rfloor = 3, \lfloor 1.0 \rfloor = 1$。

## 示例

### 示例输入1

2000 1 1

### 示例输出1

2451545

### 示例输入2

2002 9 30

### 示例输出2

2452548