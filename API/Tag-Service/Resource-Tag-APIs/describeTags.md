# describeTags


## 描述
你可以通过该接口查询所有的标签<br/>



## 请求方式
POST

## 请求地址
https://resource-tag.jdcloud-api.com/v1/regions/{regionId}/describeTags

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

说明：查询cdn的资源时，url中regionId需指定为cn-all。查询所有地域的标签时，url中regionId需指定为all-region。

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**tagKeysVo**|TagsReqVo|True| |标签参数|

### TagsReqVo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**serviceCodes**|String[]|False| |产品线名称列表<br>标签系统支持的产品线名称如下<br>- vm               disk        sqlserver  es          mongodb               ip<br>- memcached        redis       drds       rds         database              db_ro<br>- percona          percona_ro  mariadb    mariadb_ro  pg                    cdn<br>- nativecontainer  pod         zfs        jqs         kubernetesNodegroup   jcq<br>|
|**kind**|String|False|all|搜索类型, 取值为all和cost <br/><br>all: 表示搜索全部类型的标签, 默认值, 可不传<br>cost: 表示只搜索具有费用属性的标签<br>|
|**tagFilters**|TagFilter[]|False| |标签过滤列表|
### TagFilter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**key**|String|False| |标签键|
|**values**|String[]|False| |标签值列表|
|**operator**|String|False|eq|操作选项, 默认为eq, 表示精确匹配|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|响应结果对象|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|TagsResVo|获取标签结果详情|
### TagsResVo
|名称|类型|描述|
|---|---|---|
|**pin**|String|用户pin|
|**region**|String|地域名称|
|**tags**|Tag[]|标签数组|
### Tag
|名称|类型|描述|
|---|---|---|
|**key**|String|标签键|
|**value**|String|标签值|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
