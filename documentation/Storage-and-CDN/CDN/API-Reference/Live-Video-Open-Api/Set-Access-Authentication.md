# **设置URL鉴权**

## **1. 描述**

可针对推流域名或者播放域名基于MD5算法鉴权，验证主播或者网民身份的合法性。

## **2. 请求参数**

| **名称**   | **类型** | **是否必填** | **描述**                                                     |
| ---------- | -------- | ------------ | ------------------------------------------------------------ |
| username   | String   | 是           | 京东用户名pin                                                |
| signature  | String   | 是           | 用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)|
| domain     | String   | 是           | 加速域名|
|accessKey | String   | 是           | 秘钥，8-32位字符串  |
|accessKeyType | String   | 是           | 鉴权类型，0表示无鉴权，1表示有鉴权  |
|authLifeTime | String   | 是           | 有效时间，单位是秒 |

## **3. 返回参数**

| **名称**   | **描述** | 
| ---------- | -------- |
| status  | 表示接口请求成功与否，成功用0表示，其他表示失败  | 
| msg  | 提示信息 | 
| data | 返回数据| 
| accessKey | 秘钥，8-32位字符串 | 
|accessKeyType | 鉴权类型，0表示无鉴权，1表示有鉴权| 
|authLifeTime | 有效时间，单位是秒 | 

## **4. 调用示例**

- ### **请求地址**

https://opencdn.jcloud.com/api/live/setAccessAuthentication

- ### **请求示例**

```
{
    "username": "user_test",
    "signature": "ca4c56f85e3582f4d814cc77949c82a7",
    "domain": "test.jcloud.com",
    "accessKey": "123456789",
    " authLifeTime ": " 1533818918 ",
    "accessKeyType": "1"
}
```

- ### **返回示例**

```
{
    "status": 0,
    "msg": "",
    "data": {
        "accessKeyType": 1,
        " authLifeTime ": " 1533818918 ",
        "accessKey": "123456789"
    }
}

```
