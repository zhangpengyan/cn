# **设置和删除header**

## **1. 描述**

设置/删除Header请求头和响应头，Header头分为请求头和响应头，请求头指回源时CDN携带的请求参数；响应头指CDN返回给网民的参数

## **2. 请求参数**

| **名称**   | **类型** | **是否必填** | **描述**                                                     |
| ---------- | -------- | ------------ | ------------------------------------------------------------ |
| username   | String   | 是           | 京东用户名pin                                                |
| signature  | String   | 是           |  用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)  |
| domain     | String   | 是           | 加速域名|
| headerType | String   | 是           | 只能取值req(请求头)/resp(响应头)|
| headerName | String   | 是           | header头参数名称 |
| headerValue| String   | 是           | 取值 |

## **3. 返回参数**

| **名称**   | **描述** | 
| ---------- | -------- |
| status  | 表示接口请求成功与否，成功用0表示，其他表示失败  | 
| msg  | 提示信息 | 
| data | 返回数据| 

## **4. 调用示例**

- ### **请求地址**
post方式

设置header接口地址：https://opencdn.jcloud.com/api/setHttpHeader

删除header接口地址：https://opencdn.jcloud.com/api/deleteHttpHeader

- ### **请求示例**

```
https://opencdn.jcloud.com/api/setHttpHeader
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain":"www.a.com",
    "headerType" :"resp",
    "headerName":"Cache-Control",
    "headerValue":'no-cache'
 }
```

- ### **返回示例**

```
* json格式
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```

# **批量设置header**

## **1. 描述**

批量设置Header请求头和响应头，Header头分为请求头和响应头，请求头指回源时CDN携带的请求参数；响应头指CDN返回给网民的参数（暂不支持批量删除header接口）

## **2. 请求参数**

| **名称**   | **类型** | **是否必填** | **描述**                                                     |
| ---------- | -------- | ------------ | ------------------------------------------------------------ |
| username   | String   | 是           | 京东用户名pin                                                |
| signature  | String   | 是           |  用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)  |
| domain     | String   | 是           | 加速域名|
| headerContext | [] | 是   |json字符串数组,[{“headerType”:“resp”,“headerName”:“Server”,“headerValue”:“user CDN Server”}];</br>参数说明</br>headerType:只能取值req(请求头)/resp(响应头);headerName:参数名称;headerValue：取值|

## **3. 返回参数**

| **名称**   | **描述** | 
| ---------- | -------- |
| status  | 表示接口请求成功与否，成功用0表示，其他表示失败  | 
| msg  | 提示信息 | 
| data | 返回数据| 

## **4.请求示例**

- ### **请求地址**
post方式

https://opencdn.jcloud.com/api/batchSetHttpHeader

- ### **请求示例**

```
https://opencdn.jcloud.com/api/batchSetHttpHeader
{
    "username" :"use_test",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain":"www.a.com",
    "headerContext" :[{'headerType':'resp','headerName':'Server','headerValue':'user CDN Server'},{'headerType':'req','headerName':'Cache-Control','headerValue':'no-cache'}]
 }
```

- ### **返回说明**

```
json格式
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com" 
}
```
