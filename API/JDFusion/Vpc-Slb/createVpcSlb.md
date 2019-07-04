# createVpcSlb


## 描述
根据云提供商创建负载均衡

## 请求方式
POST

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_slbs

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-nonce**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-date**|String|True| |获取方式请参考签名算法指导文档|
|**authorization**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-fusion-cloudid**|String|True| |云注册信息ID|
|**slb**|SlbInfo|True| |创建SLB|

### SlbInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**cloudID**|String|False| |所属云ID|
|**id**|String|False| |负载均衡实例ID。|
|**name**|String|False| |负载均衡实例的名称。|
|**status**|String|False| |负载均衡实例状态|
|**ipAddress**|String|False| |负载均衡实例的服务地址。|
|**addressType**|String|False| |负载均衡实例的网络类型。|
|**subnetId**|String|False| |私网负载均衡实例的交换机ID。|
|**vpc**|String|False| |私网负载均衡实例的专有网络ID。|
|**networkType**|String|False| |私网负载均衡实例的网络类型|
|**azs**|String[]|False| |可用区域。|
|**createdTime**|String|False| |创建时间|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**task**|ResourceTFInfo| |
### ResourceTFInfo
|名称|类型|描述|
|---|---|---|
|**uuid**|String|uuid|
|**body**|String|请求体|
|**status**|String|状态|
|**result**|String|执行结果|
|**createdTime**|String|创建时间|
|**updateTime**|String|更新时间|
|**provider**|String|cloud provider|
|**cloudId**|String|cloud ID|
|**userId**|String|user ID|

## 返回码
|返回码|描述|
|---|---|
|**201**|CREATED|
