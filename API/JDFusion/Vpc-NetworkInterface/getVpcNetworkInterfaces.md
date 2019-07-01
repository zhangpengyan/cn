# getVpcNetworkInterfaces


## 描述
根据云提供商查询对应的网卡资源信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_networkInterfaces

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
|**vmId**|String|False| |云主机id|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**netInterfaces**|NetInterfaceInfo[]| |
### NetInterfaceInfo
|名称|类型|描述|
|---|---|---|
|**id**|String|网卡的Id|
|**name**|String|网卡名称|
|**description**|String|网卡描述信息|
|**vpcId**|String|VPC的Id|
|**type**|String|网卡类型|
|**subnetId**|String|子网id|
|**az**|String|可用区的 ID|
|**associatedPublicIp**|String|弹性网卡关联的公网 IP|
|**privateIpAddress**|String|弹性网卡主私有 IP 地址|
|**macAddress**|String|弹性网卡的 MAC 地址|
|**instanceId**|String|弹性网卡附加的实例 ID|
|**createdTime**|String|创建时间|
|**cloudID**|String|所属云提供商ID|
|**securityGroupIds**|String[]|安全组id列表|
|**privateIps**|PrivateIp[]|内网ip详情列表。|
### PrivateIp
|名称|类型|描述|
|---|---|---|
|**ipAddress**|String|内网IP的地址。|
|**primary**|Boolean|是否为主IP|
|**eipId**|String|弹性IP实例ID。|
|**eipAddress**|String|弹性IP实例地址。|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
