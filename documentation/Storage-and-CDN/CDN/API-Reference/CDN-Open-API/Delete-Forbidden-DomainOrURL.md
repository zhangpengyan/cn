# **删除封禁信息**
### 1. 描述

删除封禁信息(deleteForbiddenInfo)

### 2. 请求参数

| **名称**      | **类型** | **是否必填** | **描述**                          |
| ----------- | ------ | -------- | ------------------------------- |
| username      | String | 是        | 京东用户名pin                          |
| signature  | String | 是        | 用户签名    Signature签名：用于认证的签名信息,签名算法: 日期(格式为 yyyymmdd)，username和用户名秘钥相加的字符串的md5值。签名示例：比如当前日期2016-10-23，用户pin: jcloud_00 ,用户秘钥SecretKey ：e7a31b1c5ea0efa9aa2f29c6559f7d61那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)                |
| forbiddenType   | String | 是        | 只能是domain或者url中的一种 |
| domain      | String | 是        | 封禁域名 |
| forbiddenUrl   | String | 否        |只有url封禁删除时，此参数是必填项，每次只能删除封禁一个URL，如需删除多个，则需请求多次，url必须以/开头  |

### 3. 返回参数

| **名称**         | **描述**               |
| -------------- | -------------------- |
| status      | 结果状态                 |
| msg | 提示信息                   |
| data        | 域名                 |


### 4. 调用示例

- #### 请求地址
http://opencdn.jcloud.com/api/deleteForbiddenInfo

- #### 请求示例
##### curl请求示例：
```
curl -X POST \
  http://opencdn.jcloud.com/api/deleteForbiddenInfo \
  -H 'Content-Type: application/json' \
  -d '{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain":"www.a.com",
    "forbiddenType":"domain"
 }
'
```


* json格式

```
{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain":"www.a.com",
    "forbiddenType":"domain"
 }
 ```

- #### 返回示例

* json格式

```
{
    "status": 0,
    "msg": "成功",
    "data": "www.a.com"
}

```
