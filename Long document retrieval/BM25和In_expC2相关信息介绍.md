# BM25和In_expC2相关信息介绍

## 一、BM25相关信息介绍

**(1) BM25**是信息索引领域用来计算query与文档相似度得分的经典算法。不同于TF-IDF，**BM25的公式主要由三个部分组成**：

1. query中每个单词t与文档d之间的相关性

2. 单词t与query之间的相似性

3. 每个单词的权重

**(2) BM25的一般公式：**

![[公式]](https://www.zhihu.com/equation?tex=Score%28Q%2Cd%29+%3D+%5Csum_i%5En%7BW_i+R%28q_i%2C+d%29%7D)

其中Q表示一条query,q~i~ 表示query中的单词。d表示某个搜索文档。W~i~表示单词权重。

**(3) 单词与文档的相关性**

BM25的设计依据一个重要的发现：词频和相关性之间的关系是非线性的，也就是说，每个词对于文档的相关性分数不会超过一个特定的阈值，当词出现的次数达到一个阈值后，其影响就不在线性增加了，而这个阈值会跟文档本身有关。因此，在刻画单词与文档相似性时，BM25是这样设计的：

![[公式]](https://www.zhihu.com/equation?tex=S%28q_i%2C+d%29+%3D+%5Cfrac%7B%28k_1%2B1%29tf_%7Btd%7D%7D%7BK%2Btf_%7Btd%7D%7D+)

![[公式]](https://www.zhihu.com/equation?tex=K+%3D+k_1%281-b%2Bb%2A%5Cfrac%7BL_d%7D%7BL_%7Bave%7D%7D%29)

其中，tf~td~ 是单词t在文档d中的词频,L~d~是文档d的长度,L~ave~ 是所有文档的平均长度，变量 k~1~是一个正的参数，用来标准化文章词频的范围，当 k~1~=0时 ，就是一个二元模型（binary model）（没有词频），一个更大的值对应使用更原始的词频信息。b是另一个可调参数（0<b<1)，他是用决定使用文档长度来表示信息量的范围：当b为1，是完全使用文档长度来权衡词的权重，当b为0表示不使用文档长度。

**(4) 单词与查询的相关性** 

当query很长时，我们还需要刻画单词与query的之间的权重。对于短的query，这一项不是必须的。

![[公式]](https://www.zhihu.com/equation?tex=S%28q_i%2C+Q%29%3D%5Cfrac%7B%28k_3%2B1%29tf_%7Btq%7D%7D%7Bk_3%2Btf_%7Btq%7D%7D)

这里 tf~tq~表示单词t在query中的词频，k~3~是一个可调正参数，来矫正query中的词频范围。

因此，BM25最终的公式为：

![img](https://pic3.zhimg.com/80/v2-f8a6bbcfa4ac58752d533cbc408cc9d6_720w.png)

经过试验，上面三个可调参数，k~1~ 和 k~3~ 可取1.2~2，b取0.75

## 二、In_expC2相关信息介绍

检索模型BM25是基于概率检索框架的排序函数，而In_expC2也是基于概率检索框架的排序函数,但它是基于DFR (Divergence From Randomness)的排序函数。DFR模型是最早的信息检索模型之一，而In_expC2模型正是在DFR模型的基础上发展得来的。
