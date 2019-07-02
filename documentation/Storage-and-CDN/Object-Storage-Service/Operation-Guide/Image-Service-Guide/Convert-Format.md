# 格式转换

将图片要求进行转换格式，可指定渐进显示、图片质量。

|操作方式|指令含义|参数格式|参数说明|结果说明|
|-|-|-|-|-|
|转换图片格式|Format|fmt/str|Str结果图片格式<br>取值范围[jpg，png，webp，bmp，gif]|jpg将原图保存成jpg格式，如果原图是png、webp、bmp存在透明通道，默认会把透明填充成白色|
|指定jpg格式图片是否支持渐进显示|Progressive|p|可选参数<br>p对应支持Progressive模式<br>不指定p对应非Progressive模式|Jpg格式图片是否在网速较慢时提供由模糊到清晰的渐进显示功能，对应为Progressive模式<br>同时大部分场景文件大小略有降低，图片处理时间略增加|
|指定jpg，webp格式图片质量|Quality|q/n|N结果图片的质量上限<br>取值范围[0,100]|图片结果画质=MIN(原始画质，指定画质)<br>Webp原始画质固定为85|
|强制指定jpg，webp格式图片质量|Quality force|qf/n|N结果图片的质量<br>取值范围[0,100]|图片结果画质强制为制定画质|
|获取原始图片|Original|o|可选参数<br>o对应返回原始图片|忽略其他处理参数|

示例：将example.jpg转换图片格式为png格式

http://s3.cn-north-1.jdcloud-oss.com/downloads/example.jpg?x-oss-process=img/fmt/png

![格式转换](https://github.com/jdcloudcom/cn/blob/edit/image/Object-Storage-Service/OSS-061.png)
