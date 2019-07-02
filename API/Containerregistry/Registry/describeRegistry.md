# describeRegistry


## 描述
查询指定用户下某个 registry 详情。


## 请求方式
GET

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/registries/{registryName}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**registryName**|String|True| |注册表名称|

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
|**registry**|Registry| |
### Registry
|名称|类型|描述|
|---|---|---|
|**name**|String|注册表名称，<a href="https://www.jdcloud.com/help/detail/3870/isCatalog/1">参考公共参数规范</a>。|
|**registryUri**|String|registry endporint url|
|**description**|String|注册表描述，<a href="https://www.jdcloud.com/help/detail/3870/isCatalog/1">参考公共参数规范</a>。|
|**totalSpaceUsedMB**|Double|regsitry 使用的总存储空间 单位 (MB)|
|**createTime**|String|registry 的创建时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
