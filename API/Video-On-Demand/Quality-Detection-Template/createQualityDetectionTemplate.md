# createQualityDetectionTemplate


## 描述
创建质检模板

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/qualityDetectionTemplates


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |模板名称。长度不超过128个字符。UTF-8编码。<br>|
|**templateType**|String|True| |模板类型，区分该模板的检测内容。目前只支持 video 。|
|**detections**|String[]|True| |检测项列表。取值范围：<br>  blackScreen - 黑场<br>  pureColor - 纯色<br>  colorCast - 偏色<br>  frozenFrame - 静帧<br>  brightness - 亮度<br>  contrast - 对比度<br>|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|创建质检模板结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**id**|Long|模板ID|
|**name**|String|模板名称。长度不超过128个字符。UTF-8编码。<br>|
|**templateType**|String|模板类型，区分该模板的检测内容。目前只支持 video 。|
|**detections**|String[]|检测项列表。取值范围：<br>  blackScreen - 黑场<br>  pureColor - 纯色<br>  colorCast - 偏色<br>  frozenFrame - 静帧<br>  brightness - 亮度<br>  contrast - 对比度<br>|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**500**|Internal server error|
|**503**|Service unavailable|

## 请求示例
POST
```
https://vod.jdcloud-api.com/v1/QualityDetectionTemplates

```
```
{
    "detections": [
        "blackScreen", 
        "contrast"
    ], 
    "name": "质检模板-001", 
    "templateType": "video"
}
```

## 返回示例
```
{
    "code": 200, 
    "requestId": "bgvmivir54gddpgi764se9f4kfr7ge41"
}
```
