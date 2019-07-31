# createVideoUploadTask


## 描述
获取视频上传地址和凭证

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/videoUploadTask


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**httpMethod**|String|False| |HTTP 请求方法，取值范围：GET、POST、PUT、DELETE、HEAD、PATCH，默认值为 PUT|
|**title**|String|False| |视频标题|
|**fileName**|String|False| |文件名称|
|**fileSize**|Long|False| |文件大小|
|**coverUrl**|String|False| |封面地址|
|**description**|String|False| |视频描述|
|**categoryId**|Long|False| |分类ID|
|**tags**|String[]|False| |视频标签集合|
|**transcodeTemplateIds**|Long[]|False| |转码模板ID集合|
|**watermarkIds**|Long[]|False| |水印ID集合|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|获取视频上传地址和凭证结果|
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
|**500**|Internal server error|
|**503**|Service unavailable|

## 请求示例
POST
```
https://vod.jdcloud-api.com/v1/videoUploadTask

```
```
{
    "categoryId": 1, 
    "coverUrl": null, 
    "description": "我的三体是神游八方发起的使用Minecraft制作的三体动画", 
    "fileName": "我的三体.mp4", 
    "fileSize": 12495245, 
    "httpMethod": "PUT", 
    "tags": [
        "三体", 
        "动画"
    ], 
    "title": "我的三体", 
    "transcodeTemplateIds": [
        1, 
        2
    ], 
    "watermarkIds": [
        1, 
        2
    ]
}
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
