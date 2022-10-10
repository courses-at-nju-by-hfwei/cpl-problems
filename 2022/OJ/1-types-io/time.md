# Time

## 题目描述

为了节约存储大小，需要把输入的日期改为目标格式输出 ~~都什么年代了还在用传统时间表示法？~~

举例:

- 输入: November 17 1968 Sunday 6 6 6
- 输出: Sun Nov 17 06:06:06 1968

## 输入格式

`month day year weekday hour minute second`

**其中 $0 \leqslant year \leqslant 9999$**

保证是公元后的合法日期

## 输出格式

`Www Mmm dd hh:mm:ss yyyy`

- `Www`: 3-letter abbreviated day of the week
- `Mmm`: 3-letter abbreviated month name
- `dd`: 2-digit day of the month
- `hh`: 2-digit hour
- `mm`: 2-digit minute
- `ss`: 2-digit second
- `yyyy`: 4-digit year

位数不足的，在前面补0.

## 备注

**小心数据范围**

## 示例

### 示例输入1

November 17 1968 Sunday 6 6 6


### 示例输出1

Sun Nov 17 06:06:06 1968

### 示例输入2
September 29 22 Friday 12 0 0
### 示例输出2
Fri Sep 29 12:00:00 0022