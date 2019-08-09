# deleteVideoStreams


## 描述
删除视频转码流

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/videos/{videoId}:deleteStreams

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**videoId**|String|True| |视频ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**taskIds**|Long[]|True| | |


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|删除视频转码流|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**okTaskIds**|Number[]|删除成功的转码任务ID列表|
|**notFoundTaskIds**|Number[]|未找到的转码任务ID列表|
|**failedTaskIds**|Number[]|删除失败的转码任务ID列表|

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
POST
```
https://vod.jdcloud-api.com/v1/videos/f74a601a-6abc-46a6-9739-f53e9dfe041f:deleteStreams

```
```
{
    "taskIds": [
        3043282
    ]
}
```

## 返回示例
```
{
    "code": 200, 
    "requestId": "bkpp35strh9u48t6jmtgqmgfewwbtqve", 
    "result": {
        "failedTaskIds": [], 
        "notFoundTaskIds": [], 
        "okTaskIds": [
            "3043282"
        ]
    }
}
```
