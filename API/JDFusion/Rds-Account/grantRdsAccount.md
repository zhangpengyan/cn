# grantRdsAccount


## 描述
给RDS账号分配数据库权限

## 请求方式
PUT

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/rds_instances/{instId}/accounts/{accountName}:grant

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instId**|String|True| |RDS实例ID|
|**accountName**|String|True| |账号名称|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**dbPrivilegeInfo**|DbPrivilegeInfo|True| |RDS账号对数据库的权限信息|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|

### DbPrivilegeInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**dbName**|String|True| |数据库名|
|**privilege**|String|True| |权限，RO:只读，RW:读写|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**204**|OK|
|**404**|RDS instance not found or RDS accountName not found|
