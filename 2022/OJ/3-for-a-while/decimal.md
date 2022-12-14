# N进制转换 (decimal.c)

## 题目描述

给出一个长度为 $ len$ 的 $ N$ 进制字符串 $ s$（不一定合法） ，请你输出它表示的十进制数字。

若 $ N=2$， 则**合法**二进制字符串只包含 $ 0$ 和 $ 1$，如"1001" 和 "01011" 是合法的二进制串，而 "2010101" 则是不合法的。

若 $ N=16$，则**合法**十六进制字符串包含 $ 0123456789ABCDEF$，其中 $ A$\~$ F$ 分别代表十进制中的 $ 10$\~$ 15$ 。

一个合法的 $N$ 进制串 $s_{len - 1}s_{len - 2} \cdots s_1s_0$ 所表示的十进制数为 $s_0N^0 + s_1N^1 + \cdots + s_{len - 1}N^{len - 1}$ 。

## 输入格式

输入包含两行，

第一行包括两个整数 $len$ 和 $N$，以空格隔开，其中 $ 1 \leq len \leq 30$ ，$ 2 \leq N \leq 16$ ；

第二行为一个长度为 $len$ 的字符串 $s$ ，表示需要转换的 $N$ 进制字符串（**不一定合法**）；

输入数据保证该字符串中只可能含有**26**个大写字母和10个阿拉伯数字。

## 输出格式

若 $N$ 进制字符串合法，输出一个整数，表示其对应的十进制数，输入数据保证该十进制数在`int`范围内；

若 $N$ 进制字符串不合法，输出 "Error"。（即 `printf("Error");` )

## 示例

### 示例输入1

4 2
1001

### 示例输出1

9

### 示例输入2

7 2
2010101

### 示例输出2

Error

### 示例输入3

5 16
1BF52

### 示例输出3

114514