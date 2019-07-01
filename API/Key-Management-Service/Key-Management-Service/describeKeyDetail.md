# describeKeyDetail


## 描述
获取版本详情

## 请求方式
GET

## 请求地址
https://kms.jdcloud-api.com/v1/key/{keyId}:describeKeyDetail

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**keyId**|String|True| |密钥ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码；默认为1|
|**pageSize**|Integer|False|10|分页大小；默认为10；取值范围[10, 100]|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**keyDetail**|KeyDetail| |
### KeyDetail
|名称|类型|描述|
|---|---|---|
|**keyId**|String|KeyID|
|**keyName**|String|Key名称|
|**keyVersionCount**|Integer|Key版本的个数|
|**keyVersionList**|KeyVersionItem[]|Key版本详情的列表|
|**rotationCycle**|Integer|轮换周期|
### KeyVersionItem
|名称|类型|描述|
|---|---|---|
|**createTime**|String|创建时间，采用ISO8601标准，格式为: YYYY-MM-DDTHH:mm:ssZ|
|**deleteTime**|String|计划删除的时间，采用ISO8601标准，格式为: YYYY-MM-DDTHH:mm:ssZ|
|**keyStatus**|Integer|Key当前状态: 0:已启用、1:已禁用、2:计划删除|
|**keyVersion**|String|版本号|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|Not found|
