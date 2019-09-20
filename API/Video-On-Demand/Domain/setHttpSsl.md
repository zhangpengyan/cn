# setHttpSsl


## 描述
设置CDN域名SSL配置

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/domains/{domainId}:setHttpSsl

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Long|True| |域名ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**source**|String|False| |证书来源。取值范围：default|
|**title**|String|False| |证书标题|
|**sslCert**|String|False| |证书内容|
|**sslKey**|String|False| |证书私钥|
|**jumpType**|String|False| |跳转类型。取值范围：<br>default - 采用回源域名的默认协议<br>http - 强制采用http协议回源<br>https - 强制采用https协议回源<br>|
|**enabled**|Boolean|False| |SSL配置启用状态|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

## 请求示例
POST
```
https://vod.jdcloud-api.com/v1/domains/2:setHttpSsl

```
```
{
    "enabled": true, 
    "jumpType": "https", 
    "source": "default", 
    "sslCert": "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----", 
    "sslKey": "-----BEGIN RSA PRIVATE KEY----- ...  -----END RSA PRIVATE KEY-----", 
    "title": "测试证书"
}
```

