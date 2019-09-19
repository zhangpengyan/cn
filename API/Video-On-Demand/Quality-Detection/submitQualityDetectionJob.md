# submitQualityDetectionJob


## 描述
提交质检作业

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/qualityDetectionJobs:submit


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**mediaId**|String|False| |媒资ID|
|**templateIds**|Long[]|False| |质检模板ID列表|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


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
https://vod.jdcloud-api.com/v1/qualityDetectionJobs:submitJob

```
```
{
    "mediaId": "343a6194-85ea-49bd-8b43-df1c654f5d79", 
    "templateIds": [
        10001, 
        10002
    ]
}
```

## 返回示例
```
{
    "code": 200, 
    "requestId": "d2e394ff-f7ff-42b5-8544-8866f999507e"
}
```
