## 图片鉴黄

对图片进行鉴黄识别：

|操作方式|指令含义|参数格式|参数说明|结果说明|
|-|-|-|-|-|
|图片分析操作|Analyse|analyse|必选参数|开启图片分析操作|
|图片鉴黄|Porn|p|必选参数|返回json格式监测结果，返回结果各参数说明：<br>lable：取值范围[0,1,2]，鉴黄结果类型:0 色情，1性感，2正常<br>review：取值范围[0或1]，是否需要人工复查:0 不需要，1需要<br>confidence：取值范围[0，1]，鉴黄结果的可靠性，1对应100%确认，0对应完全不确认|

示例：

对图片文件进行监黄识别

图片如下：

http://s3.cn-north-1.jdcloud-oss.com/downloads/example.jpg

![识别](https://github.com/jdcloudcom/cn/blob/edit/image/Object-Storage-Service/OSS-065.jpg)

鉴黄处理：

http://s3.cn-north-1.jdcloud-oss.com/downloads/example.jpg?x-oss-process=img/analyse/p

返回结果：

{"label":2,"review":0,"confidence":1.000000}
