# startTransferTask


## 描述
根据指定ID启动任务

## 请求方式
PUT

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/oss_transferTasks/{id}:start

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |用户ID|
|**regionId**|String|True| |地域ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**204**|启动成功|
|**404**|任务不存在|
|**409**|任务冲突，任务已经停止|
