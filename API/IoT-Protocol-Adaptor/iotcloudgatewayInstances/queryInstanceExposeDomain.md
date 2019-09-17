# queryInstanceExposeDomain


## 描述
查询instance绑定的ExposedDomain

## 请求方式
POST

## 请求地址
https://iotcloudgateway.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:queryInstanceExposeDomain

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |regionId|
|**instanceId**|String|True| |实例ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**iotgwd**|String|实例对应下行域名|
|**iotgwu**|String|实例对应上行域名|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
