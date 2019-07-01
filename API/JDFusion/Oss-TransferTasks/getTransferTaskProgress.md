# getTransferTaskProgress


## 描述
根据指定任务id查询迁移进度

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/oss_transferTasks/{id}/progress

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |任务ID|
|**regionId**|String|True| |地域ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**task**|TransferTaskProgressInfo| |
### TransferTaskProgressInfo
|名称|类型|描述|
|---|---|---|
|**id**|String|任务ID|
|**status**|String|运行状态|
|**timeStart**|String|启动时间|
|**succeedFileCount**|String|迁移成功文件个数|
|**failedFileCount**|String|迁移失败文件个数|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|任务不存在|
