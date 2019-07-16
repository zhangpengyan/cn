# createVpcSubnet


## 描述
根据云提供商创建子网

## 请求方式
POST

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_subnets

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
|**subnet**|CreateSubnet|True| |创建subnet|

### CreateSubnet
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|False| |Subnet的Id|
|**name**|String|False| |子网名称|
|**vpcId**|String|True| |子网所属VPC的Id|
|**cidrBlock**|String|True| |子网网段|
|**description**|String|False| |子网描述信息|
|**az**|String|True| |子网所属可用域Id|
|**createdTime**|String|False| |创建时间|
|**cloudID**|String|False| |所属云提供商ID|

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
