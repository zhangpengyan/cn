##### 3.2 饼图/指标占比图

当您需要指标占比类数据表现时，您可以选择水位图、圆环图、指标图、饼图及仪表盘。这几类图形都存在丰富的图形表现能力，除了数据表现外还叠加了装饰组件。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/c82e0f81d8a4b01d8b87ec841de237f4.png)


###### 3.2.1 水位图

水位图样式设计包括外框装饰及数据区。目前系统支持5种边框。您可以通过修改外边框的形状、颜色、宽度等属性从而达到不同的视觉效果。数据区主要包括文本和水波纹样式设置。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/b3eb0085dbb117aad1f53a7bdcb8cf9e.png)


水位图仅需要您绑定一个变量，系统自动将该值转换为百分比且对末尾进行四舍五入取整。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/bcec775e09ab48672b176c911ef16a2d.png)


###### 3.2.2 百分比条形图

百分比条形图样式设计包括外框装饰、指示线、数据区。您可以在外框样式中修改数据条的颜色及其背景色。指示线用于标记数据，您可以修改每一段线段的长度及线段间的圆滑度。数据系列样式中，您可以为每一条数据设置圆环的内外半径。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/2ef2c862b61f41db5fadff435f6234b7.png)


百分比条形图需要您绑定3个变量（X，Y，S），其中X为每一个数据条的业务指标，Y为对应的指标值，S用于您将数据绑定到数据系列中。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/a56fdafc32e4ac65fd8351f6540b03dd.png)


###### 3.2.3 指标占比图

指标占比图的样式设计包括外框装饰和数据区。您可以在外框样式中修改颜色宽度以及外框的起止角度。在数据区，您可以修改数据条的颜色以及数据指标的字体、颜色等。在创作大屏过程中您还可以将多个指标占比图拼成圆环图。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/f257135572e0a830d7cc391bb9172402.png)


指标占比图您只需要绑定指标值（Y）。如果您还需要设置业务指标名称，那么您可以在样式中设置。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/20593e6699f3c0f60e2ae2286095882c.png)


###### 3.2.4 百分比拼图

百分比饼图属于基本饼图，您可以设置数据指标的名称、颜色等。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/5a45edf69b3d372912db6d2c9d91dc76.png)


百分比饼图的数据绑定需要您设置（X，Y）,其中X为指标名称，Y为指标值。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/53b5c35905df5d0eb898ca8e98ef7898.png)


###### 3.2.5 仪表盘

仪表盘是特殊的占比图。它以绝对数值的方式展示数据。在仪表盘样式配置中分为两部分盘面的样式及数据区的设置。其中盘面的设置包括：边框、刻度线、分割线以及指针。数据区的设置主要包括：指标及指标值的字体、颜色、位置等。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/e22d396a17b256df71aae04c1fb368ff.png)


仪表盘的数据设置包括两个值（name,value），其中name 为指标项，value为指标值。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/0ab9fc0a7a705ce8616216eca8177ce4.png)
