# deviceControl


## 描述
下发设备控制指令

## 请求方式
POST

## 请求地址
https://iotcloudgateway.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:deviceControl

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |regionId|
|**instanceId**|String|True| |实例ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**devicecmd**|DeviceControlSpec|True| |iotcloudgateway实例下发设备控制指令|

### DeviceControlSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**request_id**|String|True| |请求ID|
|**peers**|String|True| |设备列表|
|**br_msg**|String|True| |设备指令串base64|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
