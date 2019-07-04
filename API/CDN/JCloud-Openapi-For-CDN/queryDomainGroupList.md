# queryDomainGroupList


## 描述
查询域名组接口

## 请求方式
GET

## 请求地址
https://cdn.jdcloud-api.com/v1/domainGroup


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**shareCache**|String|False| |根据是否共享内存筛选|
|**pageNumber**|Integer|False|1|pageNumber|
|**pageSize**|Integer|False|10|pageSize|
|**primaryDomain**|String|False| |根据主域名模糊查询|
|**domainGroupName**|String|False| |根据域名组模糊查询|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**totalCount**|Integer| |
|**pageSize**|Integer| |
|**pageNumber**|Integer| |
|**domainGroups**|DomainGroupItem[]| |
### DomainGroupItem
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
