##### 4.2 2D边界地图（中国/世界）

2D地图类组件配置包括：全局设置、区域设置、数据图层设置（涟漪层、飞线层、区域热力层、点热力层）及图表尺寸和位置。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/a6e1777695446b8fd260696755f8dd19.png)


###### 4.2.1 2D边界地图-全局样式设置

2D地图的全局设置用于确认地图的区域（例如某个省份、城市地图）、边界线样式、默认区域颜色及区域标签。此外您还通过拖拽的方式调整地图的大小和位置，也可以通过修改地图中心及地图缩放等级精确调整。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/b6aefc5bc52208c6835b3dbbe536a731.png)


###### 4.2.2  2D边界地图-交互样式设置

交互样式仅当您在交互设置中启动了地图下钻交互才能生效。交互样式用于设置地图区域被选中时的颜色。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/ef6e611498ae8920291cc3653df62fcc.png)


###### 4.2.3 2D边界地图-区域样式设置

区域设置用于您个性化设置地图的样式。您可以设置区域的颜色、区域边界的颜色及边界宽度。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/809d9b5d90a235758047737225477720.png)


###### 4.2.4 2D边界地图-涟漪层样式

数据涟漪层具有丰富的表现形式。你可以设置涟漪的形状（例如圆形、方形、三角等共7种）、绘制方式（填充、边线）、涟漪颜色、波纹大小及波纹动画等。下图为通过调整涟漪形状、绘制方式、颜色
属性后的效果。

此外涟漪层支持多系列的数据展示。您可以在同一张地图上展示多个业务指标

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/ec47d4f6fc8d4fe2dc77b605f4d855eb.png)


###### 4.2.5 2D边界地图-飞线层样式

飞线层多用于表示业务数据的流向。您可以调整每一根飞线的起止标、飞线颜色/宽度
及尾迹特效。

数据飞线层也支持多系列的数据展示。您可以在同一张地图上展示多个业务的流向。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/7d5512108b27900872f52c0c39af230f.png)



###### 4.2.6 2D边界地图-区域热力样式

您可以在区域热力层上将地图颜色与业务数据进行映射。区域热力层仅支持单系列的数据展示。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/9906bf888b405dad754c76e4860ce6ff.png)



###### 4.2.7 2D边界地图-点热力层样式

您可以在点热力层上将地图颜色与业务数据进行映射。与区域热力层不同，点热力不受限于地图区域边界，仅取决于所绑定数据的经纬度。

在点热力层中，您可以通过调整热力点的模糊半径和热力半径从而更精细的表示业务数据。点热力层支持多单系列的数据展示，您可以通过颜色来区分不同的业务数据。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/32e43dee6505e802eb617335a0b5175b.png)



###### 4.2.8 2D边界地图-数据设置

在涟漪层的数据设置中，您需要设置（lon,lat,value,s,name），其中lon,lat是业务数据的经纬度，value
是业务数据的指标值（例如：100笔订单），Name字段是业务名称标记，S是业务数据类型。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/e5db4d4711f36d9afa4ba448dd4e1bec.png)



在飞线层的数据设置中，您需要设置（from,to,value,s），其中from/to是业务数据流向的起止点（此外您还需要设置起止点经纬度），value
可以用于表示该流向的数据指标（例如：北京发往上海的物流量），S是业务数据类型。S与Value
都为可选值。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/db4d904ba8066c13bffb98812c61d91d.png)



在区域热力的数据设置中，您需要设置（name,value,s）,其中name字段是业务数据区域名称（例如：北京市）,value
是业务数据的热度值。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/2f2ade52e6dded29812942cf96705d92.png)



在点热力的数据设置，您需要设置为每一个数据的（lon,lat,value,s）,其中lon,lat是业务数据的经纬度,value
是业务数据的热度值，S是业务数据类型。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/de424d7616e68c58e66f27bf602afe5c.png)
