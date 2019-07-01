# execCreate


## 描述
创建 exec


## 请求方式
POST

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/pods/{podId}/containers/{containerName}:execCreate

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**podId**|String|True| |Pod ID|
|**containerName**|String|True| |container name|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**command**|String[]|False| |执行的命令|
|**tty**|Boolean|False| |执行命令是否分配tty。默认不分配|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**execId**|String|退出码|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
