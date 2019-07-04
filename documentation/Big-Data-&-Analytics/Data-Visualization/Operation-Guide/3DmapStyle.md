##### 4.1 3D边界地图（中国/世界）

3D地图类组件配置包括：全局设置、区域设置、数据图层设置（散点、3D柱图、飞线、热力）、光线特效设计、图表尺寸和位置。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/40e68e274f2360952dc2cb32d0c148ef.png)


###### 4.1.1 3D边界地图-全局样式设置

地图类组件的全局设置主要包括：地图区域设置（例如：选择某个省）、默认地图区块颜色，地图中心点、地图缩放等级。在3D是情况下还包括地图的上下倾斜角度和左右旋转角度。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/a73e615eaf695e368e5280cb443ba50e.png)


###### 4.1.2 3D边界地图-区域样式设置

您可以对地图的每个区域特别设置颜色等。您即可以通过颜色表示您重点关注的地区，也可以通过配置颜色等达到个性化的视觉效果。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/9556a61274f0b51ff89fcd395c11d457.png)


###### 4.1.3 3D边界地图-散点层样式设置

散点层支持多系列的数据绑定，数据系列的配置方法与基础图表数据系列配置方式一致。

您可以在散点层中设置散点形状，并通过散点类型来区分业务数据。目前系统支持：三角、原型、针形等共7种形状。

在散点层中通过设置文本标注，您可以将数据映射到散点层。您还可以通过JS编程方式自定义您的标注。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/97b637e48005aed910e0ab4547b673a4.png)


###### 4.1.4 3D边界地图-柱图层样式设置

柱图层支持多系列的数据绑定，数据系列的配置方法与基础图表数据系列配置方式一致。

您可以个性化的设置每个数据系列中柱子的形状，包括：粗细、颜色、倒角圆润度。和散点层一样，您可以通过柱子的形状、颜色来表示不同的业务含义。

在柱图层中，您也可以像散点层一样设置文本标注 。

在柱图层中，您还可以开启数据映射功能，一旦开启该功能，您不仅可以通过柱子高度表示数据大小还可以通过颜色来表示。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/053ceb938f0ef6a96826443869791d7d.png)


###### 4.1.5 3D边界地图-飞线层样式设置

飞线层支持多系列的数据绑定，数据系列的配置方法与基础图表数据系列配置方式一致。

您可以个性化的设置每个数据系列中飞线的形状，包括：飞线宽度、颜色、飞线尾迹特效。和散点层一样，您可以通过这些属性来表示不同的业务含义。

在飞线层中，您还可开启光线叠加效果，此时叠加的数据越多，飞线亮度越高。

在飞线层中，您仍然可以开启数据映射功能，一旦开启该功能，您可以通过颜色来表示飞线所表示的业务数据。例如：您可以通过颜色来表示北京发往上海的交易量大小。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/dc40454ea737d1eb49d1b2498a9e5aae.png)


###### 4.1.6 3D边界地图-区域热力层样式设置

区域热力仅支持单个数据系列，您可以设置数据与颜色的映射关系。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/859c422b1d040c12b255aa2f4b2d379b.png)


###### 4.1.7 3D边界地图-光线和后期特效叠加

您可以通过光影设置达到更炫酷的展示效果。您可以调节主光源、环境光、高光、景深等特效。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/819b235d2a66db0073409e42b3ac17a4.png)


下图为光源特效的对比图：左测为开启光源的效果，右侧为关闭的效果。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/7555d4bde7e4e9094c40999ae4cab325.png)


###### 4.1.8 3D地图数据设置

地图中每一种数据图层都需要单独绑定数据。系统支持的数据源类型与基础统计图表一致,包括：Json文件、API及关系型数据库。

在散点层的数据绑定时，您需要为每一个数据设置（name,lon,lat.s）4个值。name
用于表示散点的业务名称、lon/lat是数据的经纬度、S用于区分不同的数据系列。其中name
和S字段为可选字段。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/a7a6407c7424291280ee2cced7413558.png)


在柱图层的数据绑定时，您需要为每一个数据设置（lon,lat,name,value,s）5个值。lon/lat是数据的经纬度、name是业务数据的名称，value用于将柱子的高度映射为业务数值、S用于区分不同的数据系列。其中name
和S字段为可选字段。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/1c4cf25008724f938758d8d731345146.png)


在飞线层的数据绑定时，您需要为每一个数据设置（from,to,value,s）4个值。From/to
是飞线的起止点,起止点需要您再通过lon/lat绑定、value用于将飞线的颜色映射为业务数值、S用于区分不同的数据系列。其中value
和S字段为可选字段。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/b92e40055d47b6411a7af2fc2fd827f3.png)


在热力层的数据绑定时，您需要为每一个数据设置（name,value）2个值。与其他数据图层设置不同，热力层需要您绑定地图区域名称例如北京市、河北省，value用于将飞线的颜色映射为业务数值、S用于区分不同的数据系列。其中value
和S字段为可选字段。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/baedf6313a387eda4b9f335cb99c2169.png)
