# resizeTTY


## 描述
调整TTY大小


## 请求方式
POST

## 请求地址
https://nativecontainer.jdcloud-api.com/v1/regions/{regionId}/containers/{containerId}:resizeTTY

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**containerId**|String|True| |Container ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**height**|Integer|True| |tty row|
|**width**|Integer|True| |tty column|
|**execId**|String|False| |exec ID|


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
