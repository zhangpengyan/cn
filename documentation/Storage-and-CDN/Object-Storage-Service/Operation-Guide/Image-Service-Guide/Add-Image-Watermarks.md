# 图片水印

将图片格式的水印打在图片文件上。

使用方式：每个wmi触发一次打图片水印操作，后面跟下面列表中w开头参数设置各参数值，当出现第一个不是列表中参数的控制符或无后续参数时，触发实际打水印操作，未设置的可选参数使用默认值，每次打水印后各参数初始化为默认值。

|操作方式|指令含义|参数格式|参数说明|结果说明|
|-|-|-|-|-|
|开启图片水印操作|Watermark image|wmi|必选参数<br>每打一张水印图，对应一组命令|开启打一张图片水印操作处理|
|指定水印图片文件key|Watermark key|wk/str64|必选参数<br>str64=base64(bucket:object)|水印图片本地key，读取已上传到公有云的水印图片|
|指定水印位置|Watermark position|wp/n|可选参数<br>N水印在图片的位置<br>取值范围[1,9] ，默认1|位置对应关系, 左上角到右下角按行依次排列<br>1 2 3<br>4 5 6<br>7 8 9|
|指定水印位置x偏移量|Watermark<br>dx|wdx/n|可选参数<br>N水印相对默认位置的横方向偏移像素数<br>取值范围[-9999, 9999]，默认0|水印相对于默认位置的横方向偏移像素数，到图片边界为止|
|指定水印位置y偏移量|Watermark<br>dy|wdy/n|可选参数<br>N水印相对默认位置的纵方向偏移像素数<br>取值范围[-9999, 9999]，默认0|水印相对于默认位置的纵方向偏移像素数，到图片边界为止|
|水印图片透明度|Watermark<br>dissolve|wd/n|可选参数<br>N水印图片透明度<br>取值范围[0, 100]，默认100|0为水印全透明，等价于不打水印|
|水印图片缩放尺度|Watermark<br>scale|ws/n|可选参数<br>N水印图片相对于原图片面积比例<br>取值范围[0, 1000]，默认30|水印图片相对于原图片面积比例(千分之几)|

示例：

将logo.png作为图片水印文件打在example.png上，并将水印图片缩放尺寸设为100：

http://s3.cn-north-1.jdcloud-oss.com/downloads/example.jpg?x-oss-process=img/wmi/wk/ZG93bmxvYWRzOmxvZ28ucG5n/ws/100

![图片水印](https://github.com/jdcloudcom/cn/blob/edit/image/Object-Storage-Service/OSS-062.jpg)
