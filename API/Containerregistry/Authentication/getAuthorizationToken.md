# getAuthorizationToken


## 描述
<p>申请12小时有效期的令牌。 使用<code>docker</code> CLI push和pull镜像。</p>
<p><code>authorizationToken</code>为每个registry返回一个base64编码的字符串，解码后<code>docker login</code>命令
可完成指定registry的鉴权。JCR CLI提供<code>jcr get-login</code>进行认证处理。</p>


## 请求方式
POST

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/registries/{registryName}:getAuthorizationToken

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**registryName**|String|True| |注册表名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**expiredAfterHours**|Integer|False| |issue新token的过期时间, 可选参数为新生成令牌的过期时间，最大值为24小时，最小值为1小时，为空则默认为12小时过期时间。<br>|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**authorizationToken**|String| |
|**loginCmdLine**|String| |
|**expiresAt**|String| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
