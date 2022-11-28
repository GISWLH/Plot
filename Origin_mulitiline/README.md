Origin的优势区间相对于python和R在于数据量大时处理方便

尤其是多维度、多线、多拟合

![15](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/15.jpg)

尝试复现上图

1.首先把20列数据复制过去

![image-20221128103123982](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128103123982.png)

2.全选之后（ctrl+A），然后点Plot——Line

![image-20221128103209089](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128103209089.png)

3.随便选一根线，双击进入属性设置（Origin交互设置很方便）Line style改成By one

![image-20221128103529001](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128103529001.png)

继续改Subplot为虚实交替的实线：

![image-20221128103758329](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128103758329.png)

4.也可以选择更多的颜色色卡：

![image-20221128103647930](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128103647930.png)

5.这里改线的粗细为2

![image-20221128103903419](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128103903419.png)

6.接下来尝试突出显示重要的线（如平均值等等），选择一条直线，双击进入属性，点击Independent把这条线独立出去

![image-20221128104038625](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128104038625.png)

如图所示，我对两条线做了独立的修改

![image-20221128104207464](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128104207464.png)

7.现在对比目标图与结果图，还需要添加上框和右框。并且X轴起始值不是2000，都需要修改：

![image-20221128104351104](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128104351104.png)

![image-20221128104415992](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128104415992.png)

8.在空白处右键，点击New Layer——Top X & Right Y

![image-20221128104605982](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128104605982.png)

9.左上角【1】处右键，点击axis

![image-20221128104703882](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128104703882.png)

改From to和Minor Ticks（都是为了美观，具体可以微调）

![image-20221128104907196](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128104907196.png)

左下角切换图层2后，把Tick Labels里的Top和Right的显示全关了。

![image-20221128105049702](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128105049702.png)

10.为了美观可以把Grid打开

![image-20221128105355252](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128105355252.png)

11.右键图例——Properties，修改字体和大小。我这里修改了格式化输出，使黑线和红线图例在最前面

![image-20221128105551070](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128105551070.png)

12.接下来修改细节，如拖动一个正方形过去，修改属性，设置透明度和颜色

![image-20221128105753012](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128105753012.png)

13.最后把图例的方框去掉

![image-20221128110256860](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/image-20221128110256860.png)

14.图就画好了![timeseries](https://imagecollection.oss-cn-beijing.aliyuncs.com/img/timeseries.png)