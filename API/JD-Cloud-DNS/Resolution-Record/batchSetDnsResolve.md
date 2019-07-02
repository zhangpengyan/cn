# batchSetDnsResolve


## 描述
同一个主域名下，批量新增、更新导入解析记录<br>
如果解析记录的ID为0，是新增解析记录，如果不为0，则是更新解析记录。


## 请求方式
POST

## 请求地址
https://clouddnsservice.jdcloud-api.com/v1/regions/{regionId}/BatchSetDnsResolve

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**req**|BatchSetDNS[]|True| |需要设置的解析记录列表|

### BatchSetDNS
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Integer|True| |解析记录对应的域名的ID。一次请求里面应该是相同的domainId。|
|**hostRecord**|String|True| |主机记录|
|**hostValue**|String|True| |解析记录的值|
|**id**|Integer|True| |解析记录的ID, 如果是新增请填0，如果是更新，请使用searchRR接口查询解析记录ID。|
|**jcloudRes**|Boolean|False| |是否是京东云资源|
|**mxPriority**|Integer|False| |优先级，只存在于MX, SRV解析记录类型|
|**port**|Integer|False| |端口，只存在于SRV解析记录类型|
|**ttl**|Integer|True| |解析记录的生存时间|
|**type**|String|True| |解析的类型|
|**viewValue**|Integer|True| |解析线路的ID，请调用getViewTree接口获取解析线路的ID。|
|**weight**|Integer|False| |解析记录的权重|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|此次请求的ID|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**data**|String[]|对应每条设置的解析列表的结果|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
