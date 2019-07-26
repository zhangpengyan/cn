# deleteHeader


## 描述
删除域名访问头参数

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/domains/{domainId}:deleteHeader

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Long|True| |域名ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**headerName**|String|True| |头参数名。当前支持的访问头参数取值范围：<br>  Content-Disposition<br>  Content-Language<br>  Expires<br>  Access-Control-Allow-Origin<br>  Access-Control-Allow-Methods<br>  Access-Control-Max-Age<br>  Access-Control-Expose-Headers<br>|
|**headerType**|String|True| |头参数类型，取值范围：req、resp|


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
https://vod.jdcloud-api.com/v1/domains/2:deleteHeader

```
```
{
    "headerName": "Access-Control-Allow-Origin", 
    "headerType": "resp"
}
```

