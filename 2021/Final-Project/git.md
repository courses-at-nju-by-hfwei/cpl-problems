# GIT--

## 题目描述

题面请看PDF文件：Git-All in 1.pdf

题目已完全完工，有6个样例和14个测试点

前5个测试样例以及自动测试样例脚本已经打包成了压缩文件，可以在C-PL群内下载git-test.zip得到

第6个测试样例包含了中量规模数据和全部命令类型

输入复制地址：

<https://paste.ubuntu.com/p/8JP6qY2pCy/>

标程输出复制地址：

<https://paste.ubuntu.com/p/MRCy2wkcmn/>

由于放在了Ubuntu Paste上，我也不知道什么时候会木搭，请尽快复制到本地食用

已发布测试点为子任务：1 2 3 4 5 6 7 8 9 10 11 12 13 14

Foot Note补充了时间超限自查的模板代码。

勘误：Git-All in 1.pdf 中，合并命令（merge）下的第3行中的 "GeetFS" 改为 "git--"

## 输入格式

测试点 包含命令类型     测试规模

1  read+write      超微量

2  read+write      微量

3  read+write      中量

4  write+ls      超微量

5  write+unlink+ls     超微量

6  read+write+unlink+ls     微量

7  read+write+unlink+ls     中量

8  read+write+unlink+ls+commit+checkout  微量

9
read+write+unlink+ls+commit+checkout  中量

10  read+write+unlink+ls+commit+checkout+merge 微量

11  read+write+unlink+ls+commit+checkout+merge 中量

12  read+write+unlink+ls+commit+checkout+merge 中量

13  read+write+unlink+ls+commit+checkout+merge 海量

14  read+write+unlink+ls+commit+checkout+merge 海量

## 输出格式

见PDF

## 脚注

似乎有许多同学存在时间超限的问题，为了帮助大家在调试时更好的看到自己程序运行的时间，小蓝鲨提供了如下模板，提供给有需要的同学用于时间超限自查。

```

#include <stdio.h>
/*其他头文件
...
..
*/
#include <time.h>
#define ll long long

int main(){
#ifndef ONLINE_JUDGE // 只有在本地需要提示程序运行时间、通过文件输入输出
    freopen("input.txt", "r", stdin); //输入写入 "input.txt" 文件中
    freopen("output.txt", "w", stdout);//输出到 "output.txt" 文件中
    ll _begin_time = clock(); //记录开始时间
#endif
  
    //  solve the problem


#ifndef ONLINE_JUDGE
    ll _end_time = clock(); //记录结束时间
    printf("time = %lld ms\n", _end_time - _begin_time); //输出程序所用的时间
#endif
    return 0;
}
```

使用样例说明：

假设小蓝鲨需要完成一个排序任务，并想在本地调试时检查自己的程序运行时间，那么小蓝鲨写出了以下代码：

```
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define ll long long

int a[1001];
int n;

int main(){
#ifndef ONLINE_JUDGE
    freopen("input.txt", "r", stdin);
    freopen("output.txt", "w", stdout);
    ll _begin_time = clock();
#endif
    scanf("%d",&n);
    for(int i=1;i<=n;i++){
        scanf("%d",&a[i]);
    }
    for(int i=1;i<n;i++)
        for(int j=i+1;j<=n;j++){
            if(a[i]>a[j]){
                int x = a[j];
                a[j]=a[i];
                a[i]=x;
            }
        }
    for(int i=1;i<=n;i++)
        printf("%d%c",a[i]," \n"[i==n]);
#ifndef ONLINE_JUDGE
    ll _end_time = clock();
    printf("time = %ld ms\n", _end_time - _begin_time);
#endif

    return 0;
}


```

在本地调试时，小蓝鲨将

```mermaid
15
2 4 6 8 10 1 3 5 7 9 11 15 14 12 13
```

写入到“intput.txt”文件中, 本地编译运行后生成"output.txt"文件，内容为

```mermaid
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
time = 426 ms

```

在OJ评测中，对于这组输入，此程序返回结果为

`1 2 3 4 5 6 7 8 9 10 11 12 13 14 15`

## 样例输入

2
write file1 1 10
BlueSharks
ls

## 样例输出

1 file1 file1

## 样例输入

12
write file1 1 10
BlueSharks
write file2 1 9
BlueWings
read file1 5 5
ls
read file2 0 15
unlink file1
ls
read file2 3 5
unlink file2
ls
write file2 1 4
Grey
read file2 0 15

## 样例输出

Shark
2 file1 file2
.BlueWings.....
1 file2 file2
ueWin
0
.Grey..........

## 样例输入

22
write file1 3 2
ab
commit cmt1
write file2 2 4
cdef
read file1 0 10
ls
unlink file1
commit cmt2
ls
checkout cmt1
read file1 0 10
write file1 6 2
gh
write file3 2 3
ijk
commit cmt3
ls
checkout cmt2
ls
merge cmt3 cmt4
ls
read file3 0 10
checkout cmt3
write file3 5 3
lmn
read file3 0 10

## 样例输出

...ab.....
2 file1 file2
1 file2 file2
...ab.....
2 file1 file3
1 file2 file2
3 file1 file3
..ijk.....
..ijklmn..
