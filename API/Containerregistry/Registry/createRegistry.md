# createRegistry


## 描述
通过参数创建注册表。


## 请求方式
POST

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/registries

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**registryName**|String|True| |用户定义的registry名称。<br> DNS兼容registry名称规则如下：<br> <br> 不可为空，且不能超过32字符 <br> 以小写字母开始和结尾，支持使用小写字母、数字、中划线(-)<br>|
|**description**|String|False| |注册表描述，<a href="https://www.jdcloud.com/help/detail/3870/isCatalog/1">参考公共参数规范</a>。<br>|


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
