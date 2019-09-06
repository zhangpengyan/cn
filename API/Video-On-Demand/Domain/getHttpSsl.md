# getHttpSsl


## 描述
查询CDN域名SSL配置

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/domains/{domainId}:getHttpSsl

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Long|True| |域名ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询CDN域名SSL配置结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**source**|String|证书来源。取值范围：default|
|**title**|String|证书标题|
|**sslCert**|String|证书内容|
|**sslKey**|String|证书私钥|
|**jumpType**|String|跳转类型。取值范围：<br>default - 采用回源域名的默认协议<br>http - 强制采用http协议回源<br>https - 强制采用https协议回源<br>|
|**enabled**|Boolean|SSL配置启用状态|

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
GET
```
https://vod.jdcloud-api.com/v1/domains/2:getHttpSsl

```

## 返回示例
```
{
    "code": 200, 
    "requestId": "b81638b2-93a2-4541-97d7-db01a8f56aa9", 
    "result": {
        "enabled": false, 
        "jumpType": "https", 
        "source": "default", 
        "sslCert": "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----", 
        "sslKey": "-----BEGIN RSA PRIVATE KEY----- ... -----END RSA PRIVATE KEY-----", 
        "title": "测试证书"
    }
}
```
