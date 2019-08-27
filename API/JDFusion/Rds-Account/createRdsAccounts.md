# createRdsAccounts


## 描述
根据给定的信息，创建指定RDS实例的账户

## 请求方式
POST

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/rds_instances/{instId}/accounts

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instId**|String|True| |RDS实例ID|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|True| |云注册信息ID|
|**account**|CreateRDSAccount|True| |创建RDS实例的账号信息|

### CreateRDSAccount
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |账号名|
|**password**|String|True| |密码|

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
|**404**|RDS instance not found|
