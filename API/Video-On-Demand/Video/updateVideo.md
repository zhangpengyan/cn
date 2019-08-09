# updateVideo


## 描述
修改视频信息

## 请求方式
PUT

## 请求地址
https://vod.jdcloud-api.com/v1/videos/{videoId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**videoId**|String|True| |视频ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |视频名称|
|**categoryId**|Number|False| |分类ID|
|**tags**|String[]|False| |标签|
|**coverUrl**|String|False| |封面地址|
|**description**|String|False| |视频描述信息|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|修改视频信息结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**id**|String|视频ID|
|**name**|String|视频名称|
|**description**|String|视频描述|
|**coverUrl**|String|封面图地址|
|**status**|String|视频状态。取值范围：<br>  transcoding - 转码中<br>  transcode_failed - 转码失败<br>  normal - 正常<br>  uploaded - 上传完成（未转码）<br>|
|**fileSize**|Long|文件大小，单位为 Byte|
|**checksum**|String|文件MD5校验和|
|**duration**|Long|视频时长|
|**tags**|String[]|标签集合|
|**categoryId**|Long|分类ID|
|**categoryName**|String|分类名称|
|**snapshots**|Snapshot[]|转码截图|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|
### Snapshot
|名称|类型|描述|
|---|---|---|
|**imgId**|Long|截图ID|
|**imgUrl**|String|截图URL|
|**width**|Integer|截图宽度|
|**height**|Integer|截图高度|

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
PUT
```
https://vod.jdcloud-api.com/v1/videos/4fc583b4-d08a-457a-9ce4-8a59c5f474ac

```
```
{
    "categoryId": 10, 
    "coverUrl": "http://s3.cn-ite-1.jcloudcs.com/vod-storage-vvjdcloud/img/2019/7349/1/img6.jpg", 
    "description": "我的三体", 
    "name": "我的三体", 
    "tags": [
        "Minecraft", 
        "科幻", 
        "刘慈欣"
    ]
}
```

## 返回示例
```
{
    "requestId": "bgvmivir54gddpgi764se9f4kfr7ge41", 
    "result": {
        "categoryId": 10, 
        "categoryName": "动画", 
        "checksum": "5149538c84c8e3a2c46acf29ad463328", 
        "coverUrl": "http://s3.cn-ite-1.jcloudcs.com/vod-storage-vvjdcloud/img/2019/7349/1/img6.jpg", 
        "createTime": "2019-03-29T11:44:18Z", 
        "description": "我的三体", 
        "duration": 10, 
        "fileSize": 5510872, 
        "id": "4fc583b4-d08a-457a-9ce4-8a59c5f474ac", 
        "name": "我的三体", 
        "snapshots": [
            {
                "height": "100", 
                "imgId": "1", 
                "imgUrl": "http://s3.cn-ite-1.jcloudcs.com/vod-storage-vvjdcloud/img/2019/7349/1/img6.jpg", 
                "width": "300"
            }
        ], 
        "status": "uploaded", 
        "tags": [
            "Minecraft", 
            "科幻", 
            "刘慈欣"
        ], 
        "updateTime": "2019-03-29T11:45:51Z"
    }
}
```
