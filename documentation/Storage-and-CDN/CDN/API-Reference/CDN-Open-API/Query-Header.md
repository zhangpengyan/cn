# **查询header设置**

## **1. 描述**

查询Header请求头和响应头设置的参数与值，Header头分为请求头和响应头，请求头指回源时CDN携带的请求参数；响应头指CDN返回给网民的参数

## **2. 请求参数**

| **名称**   | **类型** | **是否必填** | **描述**                                                     |
| ---------- | -------- | ------------ | ------------------------------------------------------------ |
| username   | String   | 是           | 京东用户名pin                                                |
| signature  | String   | 是           | 用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61) |
| domain     | String   | 是           | 加速域名|

## **3. 返回参数**

| **名称**   | **描述** | 
| ---------- | -------- |
| status  | 表示接口请求成功与否，成功用0表示，其他表示失败  | 
| msg  | 提示信息 | 
| data | 返回数据| 
| headerType| 只能取值req(请求头)/resp(响应头) | 
| headerName |header头参数名称 | 
|headerValue|取值| 

## **4. 调用示例**
- ### **请求地址**
post方式

https://opencdn.jcloud.com/api/queryHttpHeaderConfig

- ### **请求示例**

```
https://opencdn.jcloud.com/api/queryHttpHeaderConfig
{
    "username" :"use_test",
    "signature" :"1e28b8b4a1feddcacce74fa8b7131499",
    "domain":"www.a.com"
 }
```
- ### **返回示例**

```
•json格式
{
    "status": 0,
    "msg": "成功",
    "data": {
        "headerContext": [
            {
                "headerName": "cache-control",//header头名称
                "headerType": "resp",
                "headerValue": "no-cache"
            },
            {
                "headerName": "Content-Type",
                "headerType": "resp",
                "headerValue": "web"
            }
        ]
    }
}
```
