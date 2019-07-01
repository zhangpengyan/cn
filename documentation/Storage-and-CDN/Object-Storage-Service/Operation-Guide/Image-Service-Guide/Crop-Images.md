# 图片裁剪

将图片按要求进行裁剪，可进行居中裁剪及裁剪指定矩形。

参数：

|操作方式|指令含义|参数格式|参数说明|结果说明|
|-|-|-|-|-|
|居中裁剪|crop center|cc/w/h|W裁剪结果宽<br>H裁剪结果高<br>取值范围[1,9999]|在原图范围内居中裁剪，得到宽高比为wxh的最大内接矩形|
|裁剪指定矩形|crop rect|cr/w/h/x/y|W裁剪结果宽<br>H裁剪结果高<br>取值范围[1,9999]<br>X裁剪结果左上角X坐标<br>Y裁剪结果左上角Y坐标<br>取值范围[0,9999]|裁剪左上角在x，y，宽高为w，h的矩形区域，若超出原图范围，到原图边缘为止|

示例：将图片居中裁剪宽高比：300*200

http://s3.cn-north-1.jdcloud-oss.com/downloads/example.jpg?x-oss-process=img/cc/300/200

![居中裁剪](https://github.com/jdcloudcom/cn/blob/edit/image/Object-Storage-Service/OSS-060.jpg)
