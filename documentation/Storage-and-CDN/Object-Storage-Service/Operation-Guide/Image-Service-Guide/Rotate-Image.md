# 图片旋转

将图片按要求进行旋转。

参数：
所有图片除返回原图外，任何处理前默认按照EXIF信息自动旋转

|操作方式|指令含义|参数格式|参数说明|结果说明|
|-|-|-|-|-|
|图片顺时针旋转角度|Rotation|r/n|r图片顺时针旋转角度<br>取值范围[0,360]|n=0时按exif自动旋转<br>n=360时不做任何旋转，返回原图方向|

示例：将图片顺时针旋转角度60°

http://s3.cn-north-1.jdcloud-oss.com/downloads/example.jpg?x-oss-process=img/r/60

![旋转](https://github.com/jdcloudcom/cn/blob/edit/image/Object-Storage-Service/OSS-059.jpg)
