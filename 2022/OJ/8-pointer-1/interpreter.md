# 内存解释器 (interpreter.c)

## 题目描述

输入一个八位十六进制整数$X$，表示内存当中一个 `int` 类型的数据。请将该内容分别解释为

1. 32位有符号整型
2. 32位无符号整型
3. 32位浮点型 （小数形式）
4. 32位浮点型 （科学记数法）

并分别输出解释之后的数据。

**请勿在代码中出现`[`和`]` 及其替代，否则你会获得0分答案错误**

记得看注解。

## 输入格式

一行，一个$ 8$位$ 16$进制整数$X$，字母大小写见样例。

## 输出格式

四行，分别是解释后的

十进制 $ 32$ 位有符号整型、

十进制 $ 32$ 位无符号整型、

小数形式的 $ 32$ 位浮点型（$\text{IEEE} \ 754$ 标准，保留 $ 6$ 位小数）、

科学记数法的 $ 32$ 位浮点型（$\text{IEEE} \ 754$ 标准，保留 $ 4$ 位有效数字）。

## 备注

不需要思考小端存储的事，不需要考虑浮点数非数的情况。

这是一道简单题，**别想复杂**，想得越复杂，越难做对。

也就是说，代码**不应该超过10行**，不然很可能只能拿部分分……别怪我没提醒。

当然，如果你足够强，可以化简为繁，挑战100行的写法。

## 示例

### 示例输入1

```text
0fedabc9
```

### 示例输出1

```text
267234249
267234249
0.000000
2.344e-29
```

### 示例输入1

```text
f7fffff4
```

### 示例输出1

```text
-134217740
4160749556
-10384586289429419544779343263694848.000000
-1.038e+34
```