# getVpcSecurityGroups


## 描述
根据云提供商查询对应的安全组资源信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_securityGroups

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
|**securityGroups**|SecurityGroupInfo[]| |
### SecurityGroupInfo
|名称|类型|描述|
|---|---|---|
|**cloudID**|String|注册云信息ID|
|**id**|String|安全组 id|
|**name**|String|目标安全组名称|
|**description**|String|安全组描述信息|
|**vpcId**|String|VPC id|
|**createdTime**|String|创建时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
