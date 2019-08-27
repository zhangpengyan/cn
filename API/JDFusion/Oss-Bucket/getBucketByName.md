# getBucketByName


## 描述
根据云提供商查询对应的OSS存储桶信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/oss_buckets/{name}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |OSS存储桶名称|
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
|**bucket**|OssBucketDetailInfo| |
### OssBucketDetailInfo
|名称|类型|描述|
|---|---|---|
|**name**|String|存储桶名称|
|**acl**|String|存储桶权限|
|**intranetEndpoint**|String|内网endpoint|
|**extranetEndpoint**|String|外网endpoint|
|**creationDate**|String|创建时间|
|**cloudID**|String|云信息|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
|**404**|OSS bucket not found|
