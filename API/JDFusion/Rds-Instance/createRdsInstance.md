# createRdsInstance


## 描述
根据给定的信息，创建RDS实例

## 请求方式
POST

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/rds_instances

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|True| |云注册信息ID|
|**instance**|CreateRDSInstance|True| |创建RDS实例|

### CreateRDSInstance
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|False| |RDS实例ID|
|**name**|String|False| |RDS实例名称|
|**payType**|String|True| |计费信息,prepaid\postpaid|
|**azs**|String[]|False| |可用区ID|
|**engine**|String|True| |实例引擎类型|
|**status**|String|False| |实例状态|
|**instanceType**|String|False| |实例类型|
|**cloudID**|String|False| |所属云提供商ID|
|**engineVersion**|String|True| |数据库版本号|
|**instanceClass**|String|True| |实例规格|
|**storageGB**|Integer|True| |磁盘大小，单位GB|
|**vpcId**|String|True| |VPC ID|
|**subnetId**|String|True| |子网ID|
|**createTime**|String|False| |创建时间|

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
|**202**|ACCEPTED|
