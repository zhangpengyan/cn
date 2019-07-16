# getTransferTaskById


## 描述
根据指定ID获取任务信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/oss_transferTasks/{id}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |用户ID|
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
|**task**|TransferTaskInfoWithID| |
### TransferTaskInfoWithID
|名称|类型|描述|
|---|---|---|
|**id**|String|任务ID|
|**name**|String|任务名称|
|**srcAddress**|TaskAddressInfo| |
|**dstAddress**|TaskAddressInfo| |
### TaskAddressInfo
|名称|类型|描述|
|---|---|---|
|**storageType**|String|任务类型:源地址中支持 s3file, aliyunfile，目标现在只支持s3file|
|**accessKey**|String|源地址的accesskey|
|**secretKey**|String|源地址的securitykey|
|**endpoint**|String|源地址的Endpoint|
|**bucket**|String|源地址的Bucket|
|**prefix**|String|源地址的Prefix，不能以/开头|
|**cloudID**|String|云信息ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
