# listHeaders


## 描述
查询域名访问头参数列表

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/domains/{domainId}:listHeaders

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Long|True| |域名ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询域名访问头参数列表结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**headers**|GetHeaderResultObject[]|头参数列表|
### GetHeaderResultObject
|名称|类型|描述|
|---|---|---|
|**headerName**|String|头参数名|
|**headerValue**|String|头参数值|
|**headerType**|String|头参数类型，取值范围：req、resp|

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
https://vod.jdcloud-api.com/v1/domains/2:listHeaders

```

## 返回示例
```
{
    "requestId": "edfc74ea-be4c-418b-b841-31ddd2b33203", 
    "result": {
        "headers": [
            {
                "headerName": "Access-Control-Allow-Origin", 
                "headerType": "resp", 
                "headerValue": "*"
            }
        ]
    }
}
```
