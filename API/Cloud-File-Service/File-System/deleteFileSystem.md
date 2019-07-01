# deleteFileSystem


## 描述
-   删除一个文件系统，一旦删除，该文件系统将不存在，也无法访问已删除的文件系统里的任何内容。


## 请求方式
DELETE

## 请求地址
https://cfs.jdcloud-api.com/v1/regions/{regionId}/fileSystems/{fileSystemId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**fileSystemId**|String|True| |文件系统ID|

## 请求参数
无


## 返回参数
无


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
