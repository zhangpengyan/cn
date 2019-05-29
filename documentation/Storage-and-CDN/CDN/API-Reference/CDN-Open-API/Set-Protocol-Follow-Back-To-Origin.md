# **设置协议跟随回源**

## **1. 描述**

配置协议跟随回源后，回源站使用的协议和网民请求资源的协议一致，即当网民使用http协议请求资源时，CDN回源站使用http协议获取资源；如网民使用https协议请求资源时，CDN回源站使用https协议获取资源。

## **2. 请求参数**

| **名称**   | **类型** | **是否必填** | **描述**                                                     |
| ---------- | -------- | ------------ | ------------------------------------------------------------ |
| username   | String   | 是           | 京东用户名pin                                                |
| signature  | String   | 是           | 用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)  |
| domain     | String   | 是           | 加速域名，目前只支持单个域名的设置|
| value  | String   | 是           |是否打开协议跟随回源配置；“off”为关闭，“on”为打开  |


## **3. 返回参数data中说明**

| **名称** | **描述**                                                   |
| -------- | ---------------------------------------------------------- |
| status   | 结果状态，0表示成功，其他表示失败                          |
| msg      | 提示信息                                                   |
| data     | 返回数据                                                   |


## **4. 调用示例**

 **请求地址**

设置协议跟随回源地址： https://opencdn.jdcloud.com/api/setFollowSourceProtocol

 **请求示例**

* json格式

```
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com",
    "value" :"on"
 }
```

**返回示例**

```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domain": "www.a.com",
        "requestId": "144791ff-3d4b-4850-a7d1-75907006290a",
        "followProtocolStatus": "on"
    }
}

```


# **查询协议跟随回源**

## **1. 描述**

查询域名配置该功能的状态

## **2. 请求参数**

| **名称**   | **类型** | **是否必填** | **描述**                                                     |
| ---------- | -------- | ------------ | ------------------------------------------------------------ |
| username   | String   | 是           | 京东用户名pin                                                |
| signature  | String   | 是           | 用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)  |
| domain     | String   | 是           | 加速域名，目前只支持单个域名的查询|


## **3. 返回参数data中说明**

| **名称** | **描述**                                                   |
| -------- | ---------------------------------------------------------- |
| status   | 结果状态，0表示成功，其他表示失败                          |
| msg      | 提示信息                                                   |
| data     | 返回数据                                                   |
| domain  | 查询的加速域名                         |
| requestId  | 请求的唯一标识                 |
| followProtocolStatus | 协议跟随回源的状态，“off”为关闭，“on”为打开        |

## **4. 调用示例**

 **请求地址**

查询协议跟随回源地址： https://opencdn.jcloud.com/api/queryFollowSourceProtocol

 **请求示例**

* json格式

```
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com"
 }
```

**返回示例**

```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domain": "www.a.com",
        "requestId": "144791ff-3d4b-4850-a7d1-75907006290a",
        "followProtocolStatus": "on"
    }
}


```
