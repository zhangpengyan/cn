# getVpcEipById


## 描述
根据云提供商查询对应的公网IP资源信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_eips/{id}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |公网IP ID|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-nonce**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-date**|String|True| |获取方式请参考签名算法指导文档|
|**authorization**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**eipAddress**|EipAddress| |
### EipAddress
|名称|类型|描述|
|---|---|---|
|**cloudID**|String|云注册信息ID|
|**ipAddress**|String|公网IP地址|
|**id**|String|公网IP ID|
|**status**|String|状态|
|**instanceType**|String|当前绑定的实例类型|
|**instanceId**|String|当前绑定的实例ID|
|**bandwidth**|String|EIP的带宽峰值，单位为Mbps|
|**allocationTime**|String|EIP的创建时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
|**404**|公网IP not found|
