# batchUpdateVideos


## 描述
批量修改视频信息

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/videos:batchUpdate


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**bulkItems**|BatchUpdateVideosBulkItem[]|True| |批量更新视频的条目集合|

### BatchUpdateVideosBulkItem
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**videoId**|String|False| |视频ID|
|**name**|String|False| |视频名称|
|**categoryId**|Number|False| |分类ID|
|**tags**|String[]|False| |视频标签|
|**coverUrl**|String|False| |封面图地址|
|**description**|String|False| |视频描述信息|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|批量修改视频信息结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**okVideoIds**|String[]|更新成功的视频ID列表|
|**notFoundVideoIds**|String[]|未找到的视频ID列表|
|**failedVideoIds**|String[]|更新失败的视频ID列表|

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
        "failedVidelIds": [], 
        "notFoundVideoIds": [], 
        "okVideoIds": [
            "4fc583b4-d08a-457a-9ce4-8a59c5f474ac"
        ]
    }
}
```
