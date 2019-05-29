# **缓存策略变更**

## **1. 描述**

缓存策略变更 (changeCache/{status})

## **2. 请求参数**

| **名称**  | **类型** | **是否必填** | **描述**                                                     |
| --------- | -------- | ------------ | ------------------------------------------------------------ |
| username  | String   | 是           | 京东用户名pin                                                |
| signature | String   | 是           | 用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)  |
| domain    | String   | 是           | 加速域名                                                     |
| cacheType | String   | 否           | 缓存方式：0表示不缓存，1表示自定义。 默认是自定义缓存        |
| weight    | String   | 是           | 权重，权重不能重复，权重相同的只能创建一条                   |
| content   | String   | 是           | 缓存策略内容                                                 |
| ttl       | int      | 是           | 过期时间，时间秒                                             |
| configid   | int      | 否         |  调用update和delete时请求参数必须要configid,缓存配置id                                        |

## **3. 返回参数**

| **名称** | **描述**                                                  |
| -------- | --------------------------------------------------------- |
| status   | 结果状态，表示接口请求成功与否，成功用0表示，其他表示失败 |
| msg      | 提示信息                                                  |
| data     | 返回数据                                                  |

 

## **4. 调用示例**

- ### **请求地址**

设置缓存配置：https://opencdn.jcloud.com/api/changeCache/add
变更缓存配置：https://opencdn.jcloud.com/api/changeCache/update
删除缓存配置：https://opencdn.jcloud.com/api/changeCache/delete

- ### **请求示例**

curl请求示例：

```
 curl -H “Content-type: application/json” -X POST -d ‘{“username”:“test_user”,“signature”:“914a3f412fd9bc1eec14bb5eb104d253”,“domain” :“www.a.com”, “weight” :“1”, “ttl” :“7200”, “content” :“.jpg”}’ http://opencdn.jcloud.com/api/changeCache/add
```

* json格式

```
https://opencdn.jcloud.com/api/changeCache/add
{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "weight" :"1",
    "ttl" :"7200",
    "content" :".jpg"
 }
```

- ### **返回示例**

* json格式

```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domain": "www.a.com",
        "configId": "12310"
    }
}
```
