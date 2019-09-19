# batchSubmitTranscodeJobs


## 描述
批量提交转码作业

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/transcodeTasks:batchSubmitJobs


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**bulkItems**|SubmitTranscodeJobRequestObject[]|False| | |

### SubmitTranscodeJobRequestObject
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**videoId**|String|False| |视频ID|
|**templateIds**|Number[]|False| |转码模板ID列表|
|**watermarkIds**|Number[]|False| |水印ID列表|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|批量提交转码作业结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**tasks**|SubmittedTranscodeTask[]| |
### SubmittedTranscodeTask
|名称|类型|描述|
|---|---|---|
|**taskId**|Long|任务ID|
|**videoId**|String|视频ID|
|**templateId**|Long|转码模板ID|
|**watermarkIds**|Long[]|水印ID列表|

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
https://vod.jdcloud-api.com/v1/transcodeTasks:batchSubmitJobs

```
```
{
    "bulkItems": [
        {
            "templateIds": [
                1, 
                2
            ], 
            "vidoeId": "343a6194-85ea-49bd-8b43-df1c654f5d79", 
            "watermarkIds": [
                1, 
                2
            ]
        }, 
        {
            "templateIds": [
                1, 
                2
            ], 
            "vidoeId": "1ff72d2b-4da7-4dc0-850c-64825c1ef096", 
            "watermarkIds": [
                1, 
                2
            ]
        }
    ]
}
```

## 返回示例
```
{
    "requestId": "d2e394ff-f7ff-42b5-8544-8866f999507e", 
    "result": {
        "tasks": [
            {
                "taskId": 1, 
                "templateId": 1, 
                "vidoeId": "343a6194-85ea-49bd-8b43-df1c654f5d79", 
                "watermarkIds": [
                    1, 
                    2
                ]
            }, 
            {
                "taskId": 2, 
                "templateId": 2, 
                "vidoeId": "343a6194-85ea-49bd-8b43-df1c654f5d79", 
                "watermarkIds": [
                    1, 
                    2
                ]
            }, 
            {
                "taskId": 3, 
                "templateId": 1, 
                "vidoeId": "1ff72d2b-4da7-4dc0-850c-64825c1ef096", 
                "watermarkIds": [
                    1, 
                    2
                ]
            }, 
            {
                "taskId": 4, 
                "templateId": 2, 
                "vidoeId": "1ff72d2b-4da7-4dc0-850c-64825c1ef096", 
                "watermarkIds": [
                    1, 
                    2
                ]
            }
        ]
    }
}
```
