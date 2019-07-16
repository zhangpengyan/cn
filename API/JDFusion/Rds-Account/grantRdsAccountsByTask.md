# grantRdsAccountsByTask


## 描述
通过异步任务，给RDS账号分配数据库权限

## 请求方式
PUT

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/rds_instances/{instId}/accounts/{accountName}:grantByTask

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instId**|String|True| |RDS实例ID|
|**accountName**|String|True| |账号名称|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**info**|DbPrivilegeInfo|True| |RDS账号对数据库的权限信息|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|

### DbPrivilegeInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**dbName**|String|True| |数据库名|
|**privilege**|String|True| |权限，RO:只读，RW:读写|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**cloud**|ResourceTFInfo| |
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
|**202**|ok|
|**404**|RDS instance not found or RDS accountName not found|
