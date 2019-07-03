# queryInstance


## 描述
查询可续费实例

## 请求方式
POST

## 请求地址
https://renewal.jdcloud-api.com/v2/regions/{regionId}/instances

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**queryInstanceParam**|QueryInstanceParam|True| | |

### QueryInstanceParam
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**appCode**|String|True| |业务线|
|**serviceCode**|String|True| |产品线|
|**pageNumber**|Integer|False| |当前页码|
|**pageSize**|Integer|False| |每页条数|
|**renewStatus**|Integer|False| |资源续费状态 0:手动续费资源 1:全部资源 2:自动续费资源,默认全部|
|**expireTime**|String|False| |到期时间 0:已过期,n:n天内到期,-1:全部,-2:未到期,默认全部|
|**instanceName**|String|False| |资源名称|
|**instanceId**|String|False| |资源ID|
|**ipAddress**|String|False| |主机绑定的内网ip地址|
|**billingType**|String|False| |资源计费类型 1:按配置,3:包年包月,默认不筛选|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**listQueries**|ListQuery[]|列表详情|
|**totalCount**|Integer|查询总数|
### ListQuery
|名称|类型|描述|
|---|---|---|
|**expireTime**|String|到期时间|
|**serviceCode**|String|产品线|
|**lastTime**|Integer|倒计时|
|**resourceName**|String|资源名称|
|**resourceId**|String|资源ID|
|**dataCenter**|String|地域|
|**billingType**|Integer|计费类型|
|**autoRenew**|Integer|是否开通自动续费(0:未开通,1:已开通)|
|**associateResource**|Integer|1:关联包年包月资源一并自动续费 2：关联包年包月资源不自动续费|
|**renewTime**|Integer|续费周期|
|**databaseType**|String|数据库类型|
|**remark**|String|特殊需求|
|**relationList**|RelationResource[]|绑定资源列表|
### RelationResource
|名称|类型|描述|
|---|---|---|
|**resourceId**|String|资源ID|
|**resourceName**|String|资源名称|
|**serviceCode**|String|产品线|
|**billingType**|Integer|计费类型|
|**expireTime**|String|到期时间|
|**dataCenter**|String|地域|
|**autoRenew**|Integer|是否开通自动续费(0:未开通,1:已开通)|
|**lastTime**|Integer|倒计时|
|**remark**|String|关联资源特殊需求|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|Not found|
|**500**|Internal server error|
