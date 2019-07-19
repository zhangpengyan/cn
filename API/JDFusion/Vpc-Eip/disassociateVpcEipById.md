# disassociateVpcEipById


## 描述
解绑公网IP

## 请求方式
PUT

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_eips/{id}:disassociate

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |公网IP ID|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|True| |云注册信息ID|
|**x-jdcloud-nonce**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-date**|String|True| |获取方式请参考签名算法指导文档|
|**authorization**|String|True| |获取方式请参考签名算法指导文档|
|**unassociate**|UnassociateEipAddress|True| |解绑公网IP|

### UnassociateEipAddress
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceId**|String|False| |云产品的实例ID|
|**instanceType**|String|False| |要解绑的资源类型|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**204**|OK|
|**404**|eip not found|
