# describeAuthorizationTokens


## 描述
<p>批量查询令牌。</p> 
<p>暂时不支持分页和过滤条件。</p>


## 请求方式
GET

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/registries/{registryName}/tokens

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**registryName**|String|True| |注册表名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**filters**|Filter[]|False| |token - 令牌 ID，支持多个<br>|
|**pageNumber**|Integer|False| |页码；默认为1|
|**pageSize**|Integer|False| |分页大小；默认为20；取值范围[10, 100]|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**authorizationTokens**|AuthorizationData[]| |
|**totalCount**|Number| |
### AuthorizationData
|名称|类型|描述|
|---|---|---|
|**authorizationToken**|String|基于base64编码的字符串，包含指定JCR registry的授权信息。解码后可用于docker login。|
|**loginCmdLine**|String|用户直接使用的docker login 命令行|
|**expiresAt**|String|Unix 时钟，记录authorization token的过期时间。默认Authorization tokens有效期为12小时。|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
