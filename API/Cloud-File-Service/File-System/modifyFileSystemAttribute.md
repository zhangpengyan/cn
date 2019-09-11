# modifyFileSystemAttribute


## 描述
修改文件系统属性(name 和 description 必须要指定一个)

## 请求方式
PATCH

## 请求地址
https://cfs.jdcloud-api.com/v1/regions/{regionId}/fileSystems/{fileSystemId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**fileSystemId**|String|True| |文件系统ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |文件系统名称(参数规则：不可为空，只支持中文、数字、大小写字母、英文下划线“_”及中划线“-”，且不能超过32字符)|
|**description**|String|False| |文件系统描述(参数规则：不能超过256字符)|


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
