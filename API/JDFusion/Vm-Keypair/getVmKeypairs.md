# getVmKeypairs


## 描述
根据云提供商查询对应的密钥对资源信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vm_keypairs

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-nonce**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-date**|String|True| |获取方式请参考签名算法指导文档|
|**authorization**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**keypairs**|KeypairInfo[]| |
### KeypairInfo
|名称|类型|描述|
|---|---|---|
|**name**|String|密钥名称|
|**keyFingerprint**|String|密钥指纹|
|**cloudID**|String|云注册信息ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
