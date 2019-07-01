# unregistCloudInfo


## 描述
获取指定云信息

## 请求方式
DELETE

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/cloud_info/{cloudId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**cloudId**|String|True| |云信息ID|
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
|**204**|OK|
|**404**|User not found|
