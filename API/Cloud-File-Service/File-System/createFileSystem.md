# createFileSystem


## 描述
- 创建一个新的文件系统，为这个文件系统分配一个Id


## 请求方式
POST

## 请求地址
https://cfs.jdcloud-api.com/v1/regions/{regionId}/fileSystems

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |文件系统名称|
|**description**|String|True| |文件系统描述|
|**clientToken**|String|True| |幂等性参数(只支持数字、大小写字母，且不能超过64字符)|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|结果集|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**fileSystemId**|String|文件系统 ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**429**|Quota exceeded|
|**500**|Internal server error|
|**503**|Service unavailable|
