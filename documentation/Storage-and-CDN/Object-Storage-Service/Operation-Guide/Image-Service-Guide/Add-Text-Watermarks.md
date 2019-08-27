# 文字水印

将文字格式的水印打在图片文件上。

使用方式：每个wmt触发一次打图片水印操作，后面跟下面列表中w开头参数设置各参数值，当出现第一个不是列表中参数的控制符或无后续参数时，触发实际打水印操作，未设置的可选参数使用默认值，每次打水印后各参数初始化为默认值。

|操作方式|指令含义|参数格式|参数说明|结果说明|
|-|-|-|-|-|
|开启文字水印操作|Watermark text|wmt|必选参数<br>每打一个文字水印，对应一组命令|开启一个文字水印操作处理|
|指定水印文字内容|Watermark text|wt/str64|必选参数<br>str64=base64(utf8格式文本)|最长16个汉字|
|指定水印文字字体|Watermark font|wf/str64|可选参数<br>str64文字水印字体名<br>默认Simsun|暂时仅支持Simsun|
|指定水印文字颜色|Watermark color|wc/str|可选参数<br>Str背景填充颜色，_开头<br>取值范围[_000000,_FFFFFF]，默认_FFFFFF|文字水印字体颜色，对应RRGGBB（也支持RGB）|
|指定水印位置|Watermark position|wp/n|可选参数<br>N水印在图片的位置<br>取值范围[1,9] ，默认1|位置对应关系, 左上角到右下角按行依次排列<br>1 2 3<br>4 5 6<br>7 8 9|
|指定水印位置x偏移量|Watermark dx|wdx/n|可选参数<br>N水印相对默认位置的横方向偏移像素数<br>取值范围[-9999, 9999]，默认0|水印相对于默认位置的横方向偏移像素数，到图片边界为止|
|指定水印位置y偏移量|Watermark dy|wdy/n|可选参数<br>N水印相对默认位置的纵方向偏移像素数<br>取值范围[-9999, 9999]，默认0|水印相对于默认位置的纵方向偏移像素数，到图片边界为止|
|水印文字字体大小|Watermark scale|ws/n|可选参数<br>N水印图片相对于原图片面积比例<br>取值范围[0, 1000]，默认30|水印文字相对于原图片面积比例(千分之几) ，默认30|
|水印文字字体延左下角旋转角度|Watermark Rotate|wr/n|可选参数<br>N绕字符左下角顺时针旋转角度<br>取值范围[0, 360]，默认0||

示例：

将图片文件加文字水印“京东云”：

http://s3.cn-north-1.jdcloud-oss.com/downloads/example.jpg?x-oss-process=img/wmt/wt/5Lqs5Lic5LqR

![文字水印](https://github.com/jdcloudcom/cn/blob/edit/image/Object-Storage-Service/OSS-063.jpg)
