# resizeTTY


## 描述
设置TTY大小

## 请求方式
POST

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/pods/{podId}/containers/{containerName}:resizeTTY

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**podId**|String|True| |Pod ID|
|**containerName**|String|True| |container name|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**height**|Integer|False| |tty row，取值范围：[10, 2000]|
|**width**|Integer|False| |tty column，取值范围：[10, 1000]|
|**execId**|String|False| |tty column，取值范围：[10, 1000]|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
