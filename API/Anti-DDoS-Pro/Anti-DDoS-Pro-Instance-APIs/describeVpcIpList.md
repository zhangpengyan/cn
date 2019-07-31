# describeVpcIpList


## 描述
查询用户可设置为网站类规则回源 IP 的京东云云内弹性公网 IP 资源

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/describeVpcIpList

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False| |页码, 默认为 1|
|**pageSize**|Integer|False| |分页大小, 默认为 10, 取值范围 [0, 100], 0 表示全量|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |
|**error**|Error| |

### Error
|名称|类型|描述|
|---|---|---|
|**err**|Err| |
### Err
|名称|类型|描述|
|---|---|---|
|**code**|Long|同http code|
|**details**|Object| |
|**message**|String| |
|**status**|String|具体错误|
### Result
|名称|类型|描述|
|---|---|---|
|**dataList**|VpcIpResource[]| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|总数|
|**totalPage**|Integer|总页数|
### VpcIpResource
|名称|类型|描述|
|---|---|---|
|**ip**|String|云内 IP 地址|
|**binded**|Boolean|是否绑定|
|**resourceType**|Integer|公网 IP 类型或绑定资源类型. <br>- 0: 未知类型<br>- 1: 弹性公网 IP(IP 为弹性公网 IP, 绑定资源类型未知)<br>- 10: 弹性公网 IP(IP 为弹性公网 IP, 但未绑定资源)<br>- 11: 弹性公网 IP, 绑定了云主机<br>- 12: 弹性公网 IP, 绑定了负载均衡<br>- 13: 弹性公网 IP, 绑定了原生容器实例<br>- 14: 弹性公网 IP, 绑定了原生容器 Pod<br>- 2: 云物理服务器公网 IP|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
