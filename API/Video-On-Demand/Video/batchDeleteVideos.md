# batchDeleteVideos


## 描述
批量删除视频，调用该接口会同时删除与指定视频相关的所有信息，包括转码任务信息、转码流数据等，同时清除云存储中相关文件资源。

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/videos:batchDelete


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**videoIds**|String[]|True| |视频ID集合|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|批量删除视频结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**okVideoIds**|String[]|删除成功的视频ID集合|
|**notFoundVideoIds**|String[]|未找到的视频ID集合|
|**failedVideoIds**|String[]|删除失败的视频ID集合|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
## 返回示例
```
{
    "requestId": "bgvmivir54gddpgi764se9f4kfr7ge41", 
    "result": {
        "failedVideoIds": [], 
        "notFoundVideoIds": [
            "edfc74ea-be4c-418b-b841-31ddd2b33203"
        ], 
        "okVideoIds": [
            "4fc583b4-d08a-457a-9ce4-8a59c5f474ac"
        ]
    }
}
```
