# describeFileSystem


## 描述
查询文件系统详情

## 请求方式
GET

## 请求地址
https://cfs.jdcloud-api.com/v1/regions/{regionId}/fileSystems/{fileSystemId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**fileSystemId**|String|True| |文件系统ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|文件系统信息|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**fileSystem**|FileSystem| |
### FileSystem
|名称|类型|描述|
|---|---|---|
|**fileSystemId**|String|文件系统ID|
|**name**|String|文件系统名称(参数规则：不可为空，只支持中文、数字、大小写字母、英文下划线“_”及中划线“-”，且不能超过32字符)|
|**description**|String|文件系统描述(参数规则：不能超过256字符)|
|**numberOfMountTargets**|Integer|挂载目标个数|
|**sizeByte**|SizeByte|最近一次统计的文件系统的使用量单位为:Byte|
|**status**|String|文件系统状态(创建中:creating、可用:available、使用中:in-use、删除中:deleting)|
|**createTime**|String|创建时间|
|**dnsName**|String|dns名称|
### SizeByte
|名称|类型|描述|
|---|---|---|
|**timestamp**|String|时间戳|
|**value**|Integer|文件系统使用量，单位为:Byte|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
