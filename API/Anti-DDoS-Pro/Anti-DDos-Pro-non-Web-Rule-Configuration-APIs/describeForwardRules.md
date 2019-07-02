# describeForwardRules


## 描述
查询某个实例下的非网站转发配置

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/forwardRules

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 Id|
|**instanceId**|Long|True| |高防实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False| |页码, 默认为1|
|**pageSize**|Integer|False| |分页大小, 默认为10, 取值范围[10, 100]|
|**searchType**|String|False| |查询类型名称, domain:源站域名, ip:源站 IP, port: 转发端口, originPort: 源站端口|
|**searchValue**|String|False| |查询类型值|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |
|**error**|Error| |

### Error
|名称|类型|描述|
|---|---|---|
|**code**|Integer|请求错误状态码|
|**status**|String|请求错误状态码|
|**message**|String|请求错误提示|
### Result
|名称|类型|描述|
|---|---|---|
|**dataList**|ForwardRule[]| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|总数|
|**totalPage**|Integer|总页数|
### ForwardRule
|名称|类型|描述|
|---|---|---|
|**id**|Long|规则id|
|**instanceId**|Long|实例id|
|**protocol**|String|TCP或UDP|
|**cname**|String|规则的cname|
|**originType**|String|回源类型: ip或者domain|
|**port**|Integer|端口号|
|**algorithm**|String|转发规则<br>- wrr 带权重的轮询<br>- wlc 加权最小连接<br>- rr  不带权重的轮询<br>- sh  源地址hash<br>|
|**originAddr**|OriginAddrItem[]| |
|**onlineAddr**|String[]|备用的回源地址列表|
|**originDomain**|String|回源域名|
|**originPort**|Integer|回源端口号|
|**status**|Integer|0防御状态，1回源状态|
### OriginAddrItem
|名称|类型|描述|
|---|---|---|
|**ip**|String|回源ip|
|**weight**|Integer|权重|
|**inJdCloud**|Boolean|是否为京东云内公网ip|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
