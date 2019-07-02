# checkRegistryName


## 描述
查询指定注册表名称是否已经存在以及是否符合命名规范。


## 请求方式
POST

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/registries:checkRegistryName

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**registryName**|String|True| |待验证的注册表名。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**code**|Integer|表示用户指定的注册表是否通过校验， 0 通过 1 名称为空 2 不符合规范 3 重名|
|**reason**|String|code字段非零时，给出详细原因。|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
