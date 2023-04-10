# Origin如何绘制带误差棒的散点图？

## 引言

![48db18d6808f9ac10133007a27edc0c](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/48db18d6808f9ac10133007a27edc0c.png)

![image-20230410111359076](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410111359076.png)

以上两张图可以叫做带误差的散点图，都带有误差线，但是不同的是，两张图的x轴不一样，一个是连续``continues``，另一个是``label``标签的。

下面尝试用Origin复现这两张图，首先看第二个简单的。

在复现之前，您的Origin版本最好是最新的2022，强烈建议更新，因为绘图方式更迭是很快的，Origin每个版本都新增了很多种绘图方式。

## Label误差散点图

* 首先打开``data.xlsx``的``sheet2``，将数据复制到Origin工作空间

![image-20230410111718938](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410111718938.png)

* 全选所有数据，选择``Plot>Statistical: Box Overlap``

![image-20230410112154406](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410112154406.png)

* 在随便双击一个箱体后，在``Group``选项卡上，将``Symbol Fill Color``和``Border Color``设置为``Increment By One``。要获得填充颜色和边框颜色之间的美观配色，从``Color Chooser``中选择颜色饱和度较低色卡。

![image-20230410112402122](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410112402122.png)

* 转到``Connect Lines``选项卡，启用``Connect Mean``和``Connect Percentiles (5% and 95%)``，然后选择连接线的颜色。

![image-20230410113231249](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410113231249.png)

* 对图绘进行综合修饰，添加格网，修改刻度和标签，字体字号等等：

![image-20230410113358989](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410113358989.png)

## x轴连续的散点误差

这种情况比较麻烦，因为误差棒是手动添加的，此外还要添加线性拟合线。

* 首先打开``data.xlsx``的``sheet1``，将数据复制到Origin工作空间

* 全选数据，绘图类型为``Plot>Basic 2D: Scatter``
* 添加一栏数据，并设置为``Y Error``

![image-20230410113804921](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410113804921.png)

* 对散点进行拟合，操作方式如下：

![image-20230410103558217](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410103558217.png)

* 右键绘图中的图层1，选择``Layer Content``

![image-20230410113910413](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410113910413.png)

* 把刚才的拟合结果添加进去

![image-20230410103820263](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410103820263.png)

* 查看拟合的斜率、截距、R2和p值

![image-20230410104044314](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410104044314.png)

* 在图中手动输入上述的值

![](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410104604542.png)

* 因为X轴连续，只能添加几个局部的误差棒，手动计算后，在表格的最后几行添加``（x，kx+b，error）``，其中``kx+b``是刚才计算的斜率和截距，``error``是自己局部计算的误差
* 在数据上再添加一列原始Y，绘制点，以突出这些拟合点：

![image-20230410104850983](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410104850983.png)

* 相同的方式打开``Layer Content``把刚刚的``Point``和``error``加上，设置类型为``Scatter``和``Error Bar``

![image-20230410104913225](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410104913225.png)

* 结果如图

![image-20230410104948423](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410104948423.png)

* 对图像进行综合修饰，添加一个外框线，修改刻度和标签，字体字号等等：

![image-20230410105156972](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410105156972.png)

![image-20230410114419684](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230410114419684.png)

上述数据和工作空间，可以后台回复【散点误差线】领取