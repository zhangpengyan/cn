# getVpcById


## 描述
根据云提供商查询对应的VPC资源信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_vpcs/{id}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |VPC ID|
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
|**vpc**|VpcInfoDetail| |
### VpcInfoDetail
|名称|类型|描述|
|---|---|---|
|**id**|String|Vpc的Id|
|**name**|String|私有网络名称|
|**cidrBlock**|String|地址范围|
|**description**|String|VPC 描述|
|**createdTime**|String|创建时间|
|**cloudID**|String|所属云提供商ID|
|**subnets**|SubnetInfo[]|私有网络包含的子网列表|
|**routeTableIds**|String[]|路由表ID集合|
### SubnetInfo
|名称|类型|描述|
|---|---|---|
|**id**|String|Subnet的Id|
|**vpcId**|String|子网所属VPC的Id|
|**subnetName**|String|子网名称|
|**cidrBlock**|String|子网网段|
|**availableIpCount**|Integer|子网可用ip数量|
|**description**|String|子网描述信息|
|**endIp**|String|子网的结束地址|
|**routeTableId**|String|子网关联的路由表Id|
|**startIp**|String|子网的起始地址|
|**cloudID**|String|所属云提供商ID|
|**az**|String|可用区|
|**createdTime**|String|子网创建时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
|**404**|not found|
