#### 6. 交互组件配置

数据大屏中支持页签交互和地图下钻交互。其中地图下钻功能参见上文。

目前系统支持的样式设置包括：默认（没有事件触发时）样式、鼠标悬浮样式、鼠标选中样式。您需要为每一个鼠标状态分别设置页签字体颜色、背景色。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/20dc29e9197ca283bbd154eff9502660.png)



您需要为每一个页签创建一条数据。参见下图。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/5686ffb8b1ee8d7032eab2f15aa0771c.png)



TAB页签作为交互操作的控制器，页签在捕获鼠标事件后，需要您首先创建一个变量才能将TAB页签的值传递到其它组件。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/5686ffb8b1ee8d7032eab2f15aa0771c.png)



在下图所示的数据大屏中，TAB页签用于切换地图数据图层的切换。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/85e3780f977367476abf68c735522bd5.png)



涟漪层数据绑定如下：

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/c8dd4400d56aacddd50dfd5a958c1aa2.png)



点热力层的数据绑定如下：

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/8af3db9b22072f4a4e4057109266a29b.png)



下图为TAB页签切换地图数据图层的效果。

![](https://github.com/jdcloudcom/cn/blob/edit/image/Data-Visualization/media/01b4f7cc706ef95c4003802addcbf61b.png)
