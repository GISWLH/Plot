山脊图（Ridgeline Plot / Joy Plot），或称为山峦图等等，其本质上是密度图（density plot）。山脊图用于可视化一个类别的多个组的分布。每个类别或类别的组都会产生相互重叠的密度曲线，从而创建一个漂亮的图绘。

Joyplot 得名于 1979 年 Joy Division 的专辑封面 Unknown Pleasue：

![Unknown Pleasures album font](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/876677.jpg)

山脊图一般由共享X轴的多组彼此重叠的填充折线图组成，主要用于对不同组数据间的分布情况进行比较，是近年来比较新的图绘类型，在一些顶级期刊中经常看到，比如

Science：

![image-20230225112552465](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230225112552465.png)

Grinberg, N., Joseph, K., Friedland, L., Swire-Thompson, B., & Lazer, D. (2019). Fake news on Twitter during the 2016 US presidential election. *Science*, *363*(6425), 374-378.

如Nature Geoscience用山脊图表示不同植被的根系长度：

![image-20230225114504388](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230225114504388.png)

Stocker, B. D., Tumber-Dávila, S. J., Konings, A. G., Anderson, M. C., Hain, C., & Jackson, R. B. (2023). Global patterns of water storage in the rooting zones of vegetation. *Nature Geoscience*, 1-7.

山脊图广泛用于在一个类别中有大量类或组的情况。它能使复杂混乱的数据变得整洁美观，山脊图在 y 轴上有类或组，而在 x 轴上有数字特征。对于水文学者，山脊图尤其适用于展示气温、降水等具有明显时间分异性的参数：

![img](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/unnamed-chunk-5-1.png)

http://r-graph-gallery.com/294-basic-ridgeline-plot.html#color

山脊图其本质来自于密度图，而密度图来自于直方图。但是直方图有个缺点，设置的分割距离不同，直方图的表现不同。间隔过大时容易丢失信息，图形的分布与间隔有密切关系。于是，在直方图的基础上出现了密度图（density plot）或者叫核密度估计图（Kernel Density Estimation, KDE），能更顺滑地表示图形信息，

比如下图的顶刊Earth-Science Reviews，将多个直方图绘成一个密度图进行比较：

![What water color parameters could be mapped using MODIS land refl](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/What%20water%20color%20parameters%20could%20be%20mapped%20using%20MODIS%20land%20refl.png)

Cao, Z., Shen, M., Kutser, T., Liu, M., Qi, T., Ma, J., ... & Duan, H. (2022). What water color parameters could be mapped using MODIS land reflectance products: A global evaluation over coastal and inland waters. *Earth-Science Reviews*, 104154.

下面分别用R、Python和Origin进行山脊图的绘制，总有一款适合你：

## R语言

需要安装ggridges包，以diamonds数据集为例，观察不同颜色的depth：

与ggplot完全相同，叠加在ggplot图层语言下，并设置颜色等关键字：

```
#install.packages("ggridges")
library(ggridges)
library(ggplot2)

# Sample data
df <- diamonds[1:100, c("color", "depth")]

ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges(fill = "lightblue", alpha = 0.5) 
  
ggplot(df, aes(x = depth, y = color, fill = color)) +
  geom_density_ridges()
```

![未标题-1](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/%E6%9C%AA%E6%A0%87%E9%A2%98-1.png)

还可以添加分位数等相关信息：

通过`stat(quantile)`和`fill`设置`calc_ecdf`，`geom = "density_ridges_gradient"`每个分位数将填充不同的颜色。请注意，如果您设置了`quantile_lines = TRUE`每个分位数的垂直线，则会绘制这些垂直线。``scale_fill_brewer``用于填充浅蓝色

```
ggplot(df, aes(x = depth, y = color, fill = stat(quantile))) +
  stat_density_ridges(quantile_lines = FALSE,
                      calc_ecdf = TRUE,
                      geom = "density_ridges_gradient") +
  scale_fill_brewer(name = "")
```

![image-20230225155020598](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230225155020598.png)

## python

python也有绘制山脊图的库，如joypy

这里用最常用的matplotlib + seaborn完成，只需要两行代码：

用``FacetGrid``来初始化对象，将数据集映射到多个轴上；用`hue` 参数表示第三个变量的水平。非常类似于``ggplot``中的``aes``和``color``

``FacetGrid.map()``可以通过调用或将一个或多个绘图函数应用于每个子集，再执行更改轴标签、使用不同刻度或添加图例等操作。非常类似于``ggplot``中的``geom_point``之类的后续图层语言。

```
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Create the data
rs = np.random.RandomState(1979)
x = rs.randn(500)
g = np.tile(list("ABCDEFGHIJ"), 50)
df = pd.DataFrame(dict(x=x, g=g))
m = df.g.map(ord)
df["x"] += m

g = sns.FacetGrid(df, row="g", hue="g", aspect=9, height=1.2)
g.map(sns.kdeplot, "x")
plt.show()
```

![image-20230225162825459](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230225162825459.png)

对图绘进行修饰：

```
sns.set_theme(style="white", rc={"axes.facecolor": (0, 0, 0, 0)})
# Initialize the FacetGrid object
pal = sns.cubehelix_palette(10, rot=-.25, light=.7)
g = sns.FacetGrid(df, row="g", hue="g", aspect=15, height=.5, palette=pal)

# Draw the densities in a few steps
g.map(sns.kdeplot, "x",
      bw_adjust=.5, clip_on=False,
      fill=True, alpha=1, linewidth=1.5)
g.map(sns.kdeplot, "x", clip_on=False, color="w", lw=2, bw_adjust=.5)

# passing color=None to refline() uses the hue mapping
g.refline(y=0, linewidth=2, linestyle="-", color=None, clip_on=False)

# Define and use a simple function to label the plot in axes coordinates
def label(x, color, label):
    ax = plt.gca()
    ax.text(0, .2, label, fontweight="bold", color=color,
            ha="left", va="center", transform=ax.transAxes)

g.map(label, "x")

# Set the subplots to overlap
g.figure.subplots_adjust(hspace=-.25)

# Remove axes details that don't play well with overlap
g.set_titles("")
g.set(yticks=[], ylabel="")
g.despine(bottom=True, left=True)
plt.show()
```

![image-20230225162856270](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230225162856270.png)

## Origin

不会写代码？没关系，Origin的效果也非常出色：

1.首先把数据复制到Origin的Table里，选中D(Y) - Q(Y)，点击菜单栏的Plot > Statistical: Ridgeline Chart

![image-20230225164915136](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230225164915136.png)

2.双击绘制的图形，在"Pattern" 一栏下, 设定 "Fill Color" 为"Y-Value:Color Mapping" 

![image-20230225165137162](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230225165137162.png)

3.在"Colormap"中调整相应颜色和色块分级：

![image-20230225165511317](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230225165511317.png)

4.最后在菜单栏"Insert"一个"Color Scale"，结果如图：

![image-20230225165740280](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230225165740280.png)

 **注：**上述数据代码、Origin工作空间后台回复【HF050】

以上便是本期图绘的诚意分享啦，希望能对大家的科研工作有所帮助，欢迎大家持续关注我们！