# queryDomainsNotInGroup


## 描述
查询未分组域名

## 请求方式
GET

## 请求地址
https://cdn.jdcloud-api.com/v1/domainGroup:notInGroup


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
|**domains**|String[]| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
