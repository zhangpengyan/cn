# getVpcSubnets


## 描述
根据云提供商查询对应的subnet资源信息

## 请求方式
GET

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
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**subnets**|SubnetDesInfo[]| |
### SubnetDesInfo
|名称|类型|描述|
|---|---|---|
|**id**|String|Subnet的Id|
|**name**|String|子网名称|
|**vpcId**|String|子网所属VPC的Id|
|**cidrBlock**|String|子网网段|
|**description**|String|子网描述信息|
|**az**|String|子网所属可用域Id|
|**createdTime**|String|创建时间|
|**cloudID**|String|所属云提供商ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
