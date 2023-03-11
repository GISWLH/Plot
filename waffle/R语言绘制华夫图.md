华夫图（Waffle Chart）是一种较新的绘图形式，以矩形方格的形式呈现数据的可视化方式。它的外形类似于华夫饼干，因此得名。

华夫图通常用于显示相对比例数据。在华夫图中，每个小方格代表数据的一个单位，而每个大方格则可以代表一个固定的数量。使用颜色来区分不同的数据类别也是常见的做法。

如下图IPCC AR6中就用华夫图表现【各要素对海平面上升】的贡献

![835c83382d1e45d3840f7ba923d39e8b](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/835c83382d1e45d3840f7ba923d39e8b.png)



华夫图可以非常清晰地表达数据的相对大小关系，因此通常用于比较不同类别之间的数量或比例。

**它可以作为一种替代柱状图或饼图的方式，更加清晰、直观地展示数据。**

## R语言绘制

使用waffle包来绘制：

```
#install.packages('waffle')
library(waffle)
```

```waffle(parts, rows = 10, keep = TRUE, xlab = NULL, title = NULL, colors = NA, size = 2, flip = FALSE, reverse = FALSE, equal = TRUE, pad = 0, use_glyph = FALSE, glyph_size = 12, legend_pos = "right")```

各参数含义如下：

* parts 用于图表的值的命名向量
* rows 块的行数
* size 块的大小
* flip 是否翻转排序
* reverse 是否转置

parts可以是普通向量：

```
parts <- c(80, 30, 20, 10)
waffle(parts, rows = 8)
```

![image-20230311203642541](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230311203642541.png)

parts可以是命名向量：

```
vec <- c(1, 1, 2, 5, 1)
names(vec) <- c("Antarctic", "Greenland", "Glaciers", "Ocean", "Water")
#x <- c(Antarctic = 1, Greenland = 1, Glaciers = 2, Ocean = 5, Water = 1)

waffle(vec, rows = 3,  reverse = TRUE, 
color=c('#6270a6', '#40afe2', '#9fb1b1', '#f59e90', '#b2d88c')) 
```

![image-20230311203739228](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230311203739228.png)

```
parts <- c(`Un-breached\nUS Population` = (318 - 11 - 79), `Premera` = 11, `Anthem` = 79)
waffle(
  parts, rows = 8, size = 1, 
  colors = c("#969696", "#1879bf", "#009bda"), legend_pos = "bottom"
)
```

![image-20230311203802333](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230311203802333.png)

尝试复现纽约时报的一张原图：

![](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/20230311194557.png)

```
savings <- c(
  `Mortgage\n($84,911)` = 84911, `Auto and\ntuition loans\n($14,414)` = 14414,
  `Home equity loans\n($10,062)` = 10062, `Credit Cards\n($8,565)` = 8565
)

waffle(
  savings / 392, rows = 7, size = 0.5, legend_pos = "bottom",
  colors = c("#c7d4b6", "#a3aabd", "#a0d0de", "#97b5cf")
)
```

![image-20230311203847970](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/image-20230311203847970.png)

## PPT绘制

使用PPT的矩形进行组合堆叠

有个小技巧，先创建好模板。再通过**“组合”**，批量复制。再通过格式化，点击创建好的标准色块，使用格式刷工具，组合多个方块后批量进行上色：

![](https://imagecollection.oss-cn-beijing.aliyuncs.com/legion/20230311204010.png)