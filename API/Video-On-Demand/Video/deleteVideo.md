# deleteVideo


## 描述
删除视频，调用该接口会同时删除与指定视频相关的所有信息，包括转码任务信息、转码流数据等，同时清除云存储中相关文件资源。

## 请求方式
DELETE

## 请求地址
https://vod.jdcloud-api.com/v1/videos/{videoId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**videoId**|String|True| |视频ID|

## 请求参数
无


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
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

## 请求示例
DELETE
```
https://vod.jdcloud-api.com/v1/videos/4fc583b4-d08a-457a-9ce4-8a59c5f474ac

```

