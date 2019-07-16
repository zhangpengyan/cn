# revokeRdsAccount


## 描述
撤销RDS账号在指定数据库的所有权限

## 请求方式
DELETE

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/rds_instances/{instId}/accounts/{accountName}/databases/{dbName}:revoke

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instId**|String|True| |RDS实例ID|
|**accountName**|String|True| |账号名称|
|**dbName**|String|True| |数据库名称|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**204**|OK|
|**404**|RDS instance not found, RDS accountName not found or RDS dbName not found|
