# getContainerLogs


## 描述
查询单个容器日志


## 请求方式
GET

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/pods/{podId}/containers/{containerName}:getContainerLogs

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**podId**|String|True| |Pod ID|
|**containerName**|String|True| |container name|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**tailLines**|Integer|False| |返回日志文件中倒数 tailLines 行，如不指定，默认从容器启动时或 sinceSeconds 指定的时间读取。<br>|
|**sinceSeconds**|Integer|False| |返回相对于当前时间之前sinceSeconds之内的日志。<br>|
|**limitBytes**|Integer|False| |限制返回的日志文件内容字节数，取值范围 [1-4]KB，最大 4KB.<br>|
|**startTime**|String|False| |日志时间上限，不传表示不限时间<br>|
|**endTime**|String|False| |日志时间下限，不传表示不限时间<br>|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**logs**|Logs| |
### Logs
|名称|类型|描述|
|---|---|---|
|**content**|String|容器日志内容，最多返回4KB|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
