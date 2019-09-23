# updateCollectInfo


## 描述
更新采集配置。若传入的实例列表不为空，将覆盖之前的所有实例，而非新增。

## 请求方式
PUT

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/collectinfos/{collectInfoUID}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**collectInfoUID**|String|True| |采集配置 UID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-pin**|String|True| |用户（主、子）账号。base64编码。格式为：base64(subuser-pin) @ base64(owner-pin)。@前后有空格。若不支持主子账号，则不需要@，格式为 base64(owner-pin)|
|**x-jdcloud-erp**|String|False| |x-jdcloud-erp   base64(username)|
|**x-jdcloud-request-id**|String|True| |请求ID|
|**enabled**|Boolean|True| |采集状态，0-禁用，1-启用|
|**resourceType**|String|True| |采集实例类型, 只能是 all/part  当选择all时，传入的实例列表无效|
|**resources**|Resource[]|False| |采集实例列表（存在上限限制20）|
|**logPath**|String|False| |日志路径。当appcode为custom时为必填。目前仅支持对 Linux 云主机上的日志进行采集，路径支持通配符“*”和“？”，文件路径应符合 Linux 的文件路径规则|
|**logFile**|String|False| |日志文件名。当appcode为custom时为必填。日志文件名支持正则表达式。|
|**logFilters**|String[]|False| |过滤器。设置过滤器后可根据用户设定的关键词采集部分日志，如仅采集 Error 的日志。目前最大允许5个。|
|**filterEnabled**|Boolean|False| |过滤器是否启用。当appcode为custom时必填|

### Resource
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**region**|String|True| |资源所属地域|
|**resourceId**|String|True| |资源ID|

## 返回参数
无


## 返回码
|返回码|描述|
|---|---|
|**200**||
|**400**||
|**500**||
