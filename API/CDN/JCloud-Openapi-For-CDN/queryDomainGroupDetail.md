# queryDomainGroupDetail


## 描述
查询域名组详情

## 请求方式
GET

## 请求地址
https://cdn.jdcloud-api.com/v1/domainGroup/{id}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|Long|True| |域名组id|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**domains**|String[]|域名组成员|
|**primaryDomain**|String|主域名|
|**shareCache**|String|是否共享缓存|
|**domainGroupName**|String|域名组名称|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
