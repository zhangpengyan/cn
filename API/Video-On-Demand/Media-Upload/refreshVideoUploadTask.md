# refreshVideoUploadTask


## 描述
刷新视频上传地址和凭证

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/videoUploadTask:refresh


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**videoId**|String|True| |视频地址|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|刷新视频上传地址和凭证结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**videoId**|String|视频ID|
|**uploadUrl**|String|视频上传地址|

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
https://vod.jdcloud-api.com/v1/videoUploadTask?videoId=edfc74ea-be4c-418b-b841-31ddd2b33203

```

## 返回示例
```
{
    "code": 200, 
    "requestId": "edfc74ea-be4c-418b-b841-31ddd2b33203", 
    "result": {
        "uploadUrl": "http://s3.cn-ite-1.jcloudcs.com/vod-storage-jdcloudmttest2/source/2018/20181211/835/a6934140-13ce-4685-b8f0-4da6464a2908.mp4?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20181211T023445Z&X-Amz-SignedHeaders=host&X-Amz-Expires=299&X-Amz-Credential=986C710A6A1FD2F7220D71D3DF68FF71%2F20181211%2Fcn-ite-1%2Fs3%2Faws4_request&X-Amz-Signature=17ebe021aed33f6d684ef69b2e5fad993a3f5165017689824e43a639f0818ff9", 
        "videoId": "d36e092b-b860-4ceb-94db-68dff87dd02a"
    }
}
```
