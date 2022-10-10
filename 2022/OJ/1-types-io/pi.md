# Pi

## 题目描述

调用 C 语言中的数学函数库，分别用以下两种近似方式计算圆周率:

* [Machin Formula @ wiki](https://en.wikipedia.org/wiki/Approximations_of_%CF%80#Machin-like_formula)

  * $\Large\dfrac{\pi}{4} = 4 arctan\dfrac{1}{5} - arctan\dfrac{1}{239}$
* [Formula @ wiki](https://en.wikipedia.org/wiki/Approximations_of_%CF%80#Miscellaneous_approximations)

  * $\Large\pi=\dfrac{ln(640320^3 + 744)}{\sqrt{163}}$

要求:

* 每个结果占一行
* 小数点后均保留 15 位
  * 精度要求为 `double`
* 必须通过调用数学函数计算结果
  * 指定使用 `atan()`, `log()`, `sqrt()` 函数， **不要使用 atan2()**
  * 写在注释里假装调用了是不行哒，嘎嘎嘎

## 输入格式

无

## 输出格式

两行，每行一个小数

注意由于本题输出的是定值，所以无需考虑样例