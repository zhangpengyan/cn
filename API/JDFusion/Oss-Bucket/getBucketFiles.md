# getBucketFiles


## 描述
根据过滤条件，取得指定OSS存储桶上的文件列表

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/oss_buckets/{name}/files

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |OSS存储桶名称|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|
|**marker**|String|False| |本次查询的起点（文件key值）|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**isTruncated**|Boolean|是否已被截断（表示没有更多数据了）|
|**marker**|String|本次查询的起点（文件key值）|
|**files**|OssFileInfo[]| |
### OssFileInfo
|名称|类型|描述|
|---|---|---|
|**bucketName**|String|存储桶名称|
|**key**|String|文件存储Key值|
|**size**|Double|文件大小（字节）|
|**lastModifiedTime**|String|上次修改时间|
|**storageClass**|String|存储类型|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
|**404**|OSS bucket not found|
