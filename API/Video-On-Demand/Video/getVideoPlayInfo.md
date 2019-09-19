# getVideoPlayInfo


## 描述
获取视频播放信息

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/videos/{videoId}:getPlayInfo

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**videoId**|String|True| |视频ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|获取视频播放信息结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**baseInfo**|VideoBaseInfo|视频基础信息|
|**playInfoList**|VideoPlayInfo[]|视频播放信息列表|
### VideoPlayInfo
|名称|类型|描述|
|---|---|---|
|**taskId**|String|生成播放信息的转码任务ID|
|**definition**|String|清晰度规格标记。取值范围：<br>  SD - 标清<br>  HD - 高清<br>  FHD - 超清<br>  2K<br>  4K<br>|
|**mediaType**|Integer|媒体类型|
|**status**|String|播放信息状态，目前只有正常状态(normal)|
|**url**|String|CDN地址，原始地址或者鉴权地址|
|**size**|Long| |
|**duration**|Long|视频时长|
|**bitrate**|Long|码率|
|**codec**|String|编码格式|
|**format**|String|封装格式|
|**width**|Integer|视频宽度|
|**height**|Integer|视频高度|
|**fps**|String|视频帧率|
|**createTime**|String| |
|**updateTime**|String| |
### VideoBaseInfo
|名称|类型|描述|
|---|---|---|
|**videoId**|String|视频ID|
|**videoName**|String|视频名称|
|**description**|String|视频描述|
|**categoryId**|Long| |
|**categoryName**|String|分类名称|
|**tags**|String|标签|
|**duration**|Long|视频时长|
|**coverUrl**|String|封面地址|

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
https://vod.jdcloud-api.com/v1/videos/4fc583b4-d08a-457a-9ce4-8a59c5f474ac:getPlayInfo

```

## 返回示例
```
{
    "code": 200, 
    "requestId": "bkpp00iunavp370wuuur7tk4tw8hqnga", 
    "result": {
        "baseInfo": {
            "coverImgUrl": "https://s3.cn-north-1.jcloudcs.com/vod-storage-72757/img/2019/3044119/1/img1.jpg", 
            "tag": "[]", 
            "videoId": "0b2a55f8-233a-4169-8c0d-b441d693fb86", 
            "videoName": "src_i-100_720p"
        }, 
        "playInfoList": [
            {
                "bitrate": 1489895, 
                "codec": "avc1", 
                "createTime": "2019-07-19T08:26:20Z", 
                "definition": "HD", 
                "duration": 217200, 
                "format": "mp4", 
                "fps": "25.000", 
                "height": 720, 
                "mediaType": 0, 
                "size": 40513620, 
                "status": 2, 
                "taskId": 3045989, 
                "updateTime": "2019-07-19T08:26:20Z", 
                "url": "https://72757-playvod.jdcloud.com/1563528722/ff23b0202a4c59512034cd94d95aef0c/vod/product/3045989/7/0b2a55f8-233a-4169-8c0d-b441d693fb86.mp4", 
                "width": 1280
            }
        ]
    }
}
```
