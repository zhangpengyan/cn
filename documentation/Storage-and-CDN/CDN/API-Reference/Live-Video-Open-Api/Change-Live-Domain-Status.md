# **服务状态变更**

## **1. 描述**

对已经创建的域名更改服务状态，包括停止、运行、删除（停止stop；启动start；delete 删除）

## **2. 请求参数**

| **名称**  | **类型** | **是否必填** | **描述**                                                     |
| --------- | -------- | ------------ | ------------------------------------------------------------ |
| username  | String   | 是           | 京东用户名pin                                                |
| signature | String   | 是           | 用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61) |
| domain    | String   | 是           | 加速域名                                                     |

## **3. 返回参数**

| **名称** | **描述**                                                  |
| -------- | --------------------------------------------------------- |
| status   | 结果状态，表示接口请求成功与否，成功用0表示，其他表示失败 |
| msg      | 提示信息，如发送任务失败的原因等                          |
| data     | 返回数据                                                  |

## **4. 调用示例**

- ### **请求地址**

停止域名接口地址：https://opencdn.jcloud.com/api/live/stopDomain

启动域名接口地址：https://opencdn.jcloud.com/api/live/startDomain

删除域名接口地址：https://opencdn.jcloud.com/api/live/deleteDomain

- ### **请求示例**

```
{
    "username":"test_user",
    "signature":"7a9beb5119e1cb439208e444193d39ec",
    "domain":"www.b.com"
}
 
```

- ### **返回示例**

```
{
    "status": 0,
    "msg": "启动成功",
    "data": null
}

```
