# 区间图介绍

区间图是科研绘图中常用到的一种：

![8](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/8.jpg)

使用区间图评估和比较组均值的置信区间，区间图显示了每个组均值的 95% 置信区间。

当样本数量为每组至少 10 个时，区间图效果最佳。

用Python、R、Matlab等等都能进行绘制，如：

# Python

```
import matplotlib.pyplot as plt
import numpy as np

plt.style.use('_mpl-gallery')

# make data:
np.random.seed(1)
x = [2, 4, 6]
y = [3.6, 5, 4.2]
yerr = [0.9, 1.2, 0.5]

# plot:
fig, ax = plt.subplots()

ax.errorbar(x, y, yerr, fmt='o', linewidth=2, capsize=6)

ax.set(xlim=(0, 8), xticks=np.arange(1, 8),
       ylim=(0, 8), yticks=np.arange(1, 8))

plt.show()
```

![](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/20230216202447.png)

# Origin绘制

## 分组绘制

1.把数据复制到Origin

![image-20230216202800792](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216202800792.png)

2.选中BCD列，Plot—Categorical—Grouped Interval Plot

![image-20230216202848944](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216202848944.png)

3.分组选择A列

![image-20230216203027989](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216203027989.png)

4.双击Interval绘制结果，选择颜色和粗细

![image-20230216203114940](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216203114940.png)

调整平均值点的形状与大小

![image-20230216203142706](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216203142706.png)

5.添加美化，如水平线

![image-20230216204027546](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216204027546.png)

6.设置背景填充：

![image-20230216204427079](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216204427079.png)

7.保存制图模板下次使用

![image-20230216204519421](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216204519421.png)

## 直接绘制

1.把数据复制到Origin

![image-20230216204639122](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216204639122.png)

2.选择plot-interval

![image-20230216204710456](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216204710456.png)

3.按上面的方式调节颜色、大小等等。

![image-20230216205004759](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230216205004759.png)

数据和Origin工作空间请后台回复【interval】