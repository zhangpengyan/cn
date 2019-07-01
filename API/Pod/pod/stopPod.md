# stopPod


## 描述
停止处于运行状态的单个实例，处于任务执行中的 pod 无法启动。


## 请求方式
POST

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/pods/{podId}:stopPod

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**podId**|String|True| |Pod ID|

## 请求参数
无


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
