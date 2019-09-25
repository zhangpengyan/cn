# queryKeypair


## 描述
查询密钥对详情

## 请求方式
GET

## 请求地址
https://cps.jdcloud-api.com/v1/regions/{regionId}/keypairs/{keypairId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeRegiones）获取云物理服务器支持的地域|
|**keypairId**|String|True| |密钥对ID|

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
|**server**|Keypair|密钥对详细信息|
### Keypair
|名称|类型|描述|
|---|---|---|
|**keypairId**|String|密钥对id|
|**region**|String|地域|
|**name**|String|密钥对名称|
|**publicKey**|String|公钥|
|**fingerPrint**|String|指纹|
|**createTime**|String|创建时间|
|**updateTime**|String|更新时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Bad request|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
