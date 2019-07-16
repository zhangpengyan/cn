# 人脸检测

对图片中人脸信息进行识别

参数：

|操作方式|指令含义|参数格式|参数说明|结果说明|
|-|-|-|-|-|
|图片分析操作|Analyse|analyse|必选参数|开启图片分析操作|
|人脸检测|Face|f/1|必选参数|返回json格式每个监测到的脸矩形坐标，图片左上角为原点|
|人脸检测|Face|f/2|必选参数|返回最大脸的裁剪图，图片格式与输入图片相同|
|人脸检测|Face|f/3/str|3必选参数<br>Str可选参数，人脸框颜色，_开头<br>取值范围[_000000,_FFFFFF]，默认_FFFFFF|返回所有检测到的人脸图中用自定义颜色_RRGGBB（或RGB）的矩形标出|

示例：

将图片文件内人脸进行检测并返回人脸矩形坐标：

http://s3.cn-north-1.jdcloud-oss.com/downloads/lena.jpg?x-oss-process=img/analyse/f/1

返回结果：
```
{"number":1,"faceList":[{"rect":[176,185,218,218]}]}
```
