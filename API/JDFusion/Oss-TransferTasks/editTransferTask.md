# editTransferTask


## 描述
根据指定ID修改任务

## 请求方式
PUT

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/oss_transferTasks/{id}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |任务ID|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**task**|TransferTaskInfo|False| | |

### TransferTaskInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |任务名称|
|**srcAddress**|TaskAddressInfo|False| | |
|**dstAddress**|TaskAddressInfo|False| | |
### TaskAddressInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**storageType**|String|False| |任务类型:源地址中支持 s3file, aliyunfile，目标现在只支持s3file|
|**accessKey**|String|False| |源地址的accesskey|
|**secretKey**|String|False| |源地址的securitykey|
|**endpoint**|String|False| |源地址的Endpoint|
|**bucket**|String|False| |源地址的Bucket|
|**prefix**|String|False| |源地址的Prefix，不能以/开头|
|**cloudID**|String|False| |云信息ID|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|修改成功|
|**400**|无效参数|
|**404**|任务不存在|
|**409**|任务冲突，任务运行中|
