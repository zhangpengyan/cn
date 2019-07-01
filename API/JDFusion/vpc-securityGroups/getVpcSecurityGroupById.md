# getVpcSecurityGroupById


## 描述
查询指定的安全组资源信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_securityGroups/{id}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |SecurityGroup ID|
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
|**securityGroup**|SecurityGroupDetail| |
### SecurityGroupDetail
|名称|类型|描述|
|---|---|---|
|**cloudID**|String|注册云信息ID|
|**id**|String|安全组 id|
|**name**|String|目标安全组名称|
|**description**|String|安全组描述信息|
|**vpcId**|String|VPC id|
|**createdTime**|String|创建时间|
|**permissions**|PermissionType[]|安全组权限规则集合|
### PermissionType
|名称|类型|描述|
|---|---|---|
|**cloudID**|String|云注册信息ID|
|**ipProtocol**|String|IP协议|
|**portRange**|String|端口范围|
|**description**|String|描述信息|
|**sourceCidrIp**|String|源IP地址段，用于入方向授权|
|**sourceGroupId**|String|源安全组，用于入方向授权|
|**sourceGroupOwnerAccount**|String|源安全组所属阿里云账户Id|
|**destCidrIp**|String|目标IP地址段，用于出方向授权|
|**destGroupId**|String|目标安全组，用于出方向授权|
|**destGroupOwnerAccount**|String|目标安全组所属阿里云账户Id|
|**policy**|String|授权策略|
|**nicType**|String|网络类型|
|**priority**|String|规则优先级|
|**direction**|String|授权方向|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
|**404**|not found|
