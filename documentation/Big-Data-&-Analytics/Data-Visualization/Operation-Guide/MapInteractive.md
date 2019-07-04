##### 4.3 2D/3D边界地图-交互设置

2D/3D边界地图均支持下钻，您在交互设置中点击开启按钮，那么预览/发布状态下的地图将会实现下钻功能。此外您还可以个性化设置下钻后地图的中心点、缩放等级。如下示例中：左测为地图下钻前数据大屏，右侧为点击某个区域后的数据大屏。

在2D/3D边界地图下钻事件中，您可以通过点击鼠标逐级下钻地图（最小下钻粒度为区县级）；如果您需要返回上一层，点击地图区域的空白区就可以返回。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/de7fcd3bc3d64c8b12f4ee149ba20b45.png)



![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/5f9ab4d2703fe2243a55172d71aadd2f.png)


如果您希望地图下钻后其他图表能随之联动，那么您需要将图表中的区域设置为变量，并将其他图表的SQL与这个变量进行绑定。例如：在下图中，如果您希望地图下钻后右侧折线图数据随之联动。那么您需要在折线图SQL中绑定地图区域变量area。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/37cb4b90956177849834ab00e8f0b24f.png)
