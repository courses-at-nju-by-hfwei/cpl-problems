# 必做题（behaviors.c）

## 题目描述

下面的行为，如果 ant-hengxin 做的对，则输出 YES 并换行，否则输出 NO 并换行

1. ant-hengxin 复制了 StackOverflow/CSDN 上的代码提交到 OJ 网站上并且 AC 了；
2. ant-hengxin 在作业截止之前把自己的 AC 代码上传到了 github 的公开仓库；
3. DDL 马上就要到了，ant-hengxin 的题做不完了，他就算空着不做也绝不抄袭；
4. ant-hengxin 需要一个输入长度为 $n$ 的字符串，他这么写：

   ```c
   int n;
   scanf("%d", &n);
   char str[n + 2];
   scanf("%s", str);
   // other codes
   ```
5. ant-hengxin 需要开一个 $ 10^8$ 长度的 double 数组，他这么写：

   ```c
   int main(void) {
       double array[100000008];
       // other codes
   }
   ```
6. ant-hengxin 需要为长度为 $ 10^3$ 的字符串开数组，他这么写：

   ```c
   char str[1000];
   ```
7. ant-hengxin 需要开一个 $ 10^5$ 的 int 数组，他这么写：

   ```C
   int nums[10005];
   ```
8. ant-hengxin 帮 shuilongzhihun debug，他找不出来哪里有问题，于是复制了 shuilongzhihun 的代码，改动了一点，并用自己的账号交了一发；
9. ant-hengxin 帮 Tilnel debug，他找不出来哪里有问题，于是直接把自己的代码丢给 Tilnel；
10. ant-hengxin 在群里问：“F 题运行错误是怎么回事？”；
11. ant-hengxin 在群里问：“D 题 73 分是怎么回事？”；
12. ant-hengxin 直接贴了一段代码，并且问 “我本地都是对的，为啥 OJ 说我这个错了啊？”。

## 输入格式

无

## 输出格式

对每个行为输出一行 YES 或 NO，表示 ant-hengxin 做的 对或不对。

## 备注

**请认真思考每个行为究竟对在哪，错在哪。**

如果你通过了这题，那么说明你已经了解了“如何正确提问”、“基本的学术诚信”以及一些关于 OJ 和编码的常见问题。

所以如果某一次你违反了学术诚信，那么“我不知道不能这么做”的解释也就无效了。

如果你选择不做这一题，那可能会倒扣分。