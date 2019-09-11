# getQualityDetectionTemplate


## 描述
查询质检模板

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/qualityDetectionTemplates/{templateId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**templateId**|Long|True| |模板ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询质检模板信息结果|
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
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

## 请求示例
GET
```
https://vod.jdcloud-api.com/v1/qualityDetectionTemplates/10001

```

## 返回示例
```
{
    "requestId": "bgvmivir54gddpgi764se9f4kfr7ge41", 
    "result": {
        "createTime": "2019-08-26T15:51:32Z", 
        "detections": [
            "blackScreen", 
            "contrast"
        ], 
        "id": 10001, 
        "name": "质检模板-001", 
        "templateType": "video", 
        "updateTime": "2019-08-26T15:51:32Z"
    }
}
```
