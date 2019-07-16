# getRdsDatabaseByInstIdAndDbName


## 描述
根据过滤条件，取得指定RDS实例上的数据库信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/rds_instances/{instId}/databases/{dbName}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instId**|String|True| |RDS实例ID|
|**dbName**|String|True| |数据库名称|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**db**|RdsDBInfo| |
### RdsDBInfo
|名称|类型|描述|
|---|---|---|
|**name**|String|数据库名称|
|**status**|String|数据库状态|
|**characterSetName**|String|字符集|
|**accountPrivileges**|RdsDBAccessPrivilege[]| |
|**cloudID**|String|所属云提供商ID|
### RdsDBAccessPrivilege
|名称|类型|描述|
|---|---|---|
|**accountName**|String|账号名称|
|**privilege**|String|账号对数据库所具有的权限|
|**cloudID**|String|所属云提供商ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
|**404**|instance not found, or database name not found|
