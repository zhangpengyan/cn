# **查询封禁列表**
### 1. 描述

查询封禁列表 (queryForbiddenInfoList)

### 2. 请求参数

| **名称**      | **类型** | **是否必填** | **描述**                          |
| ----------- | ------ | -------- | ------------------------------- |
| username      | String | 是        | 京东用户名pin                          |
| signature  | String | 是        | 用户签名    Signature签名：用于认证的签名信息,签名算法: 日期(格式为 yyyymmdd)，username和用户名秘钥相加的字符串的md5值。签名示例：比如当前日期2016-10-23，用户pin: jcloud_00 ,用户秘钥SecretKey ：e7a31b1c5ea0efa9aa2f29c6559f7d61那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)                    |
| domain      | String | 否        | 封禁域名 |
| url      | String | 否        | 封禁url |
| pageNumber   | int | 否        | 查询分页页码，不传默认为1 |
| pageSize   | int | 否        | 查询分页条数，不传默认10条 |

### 3. 返回参数

| **名称**         | **描述**               |
| -------------- | -------------------- |
| status      | 结果状态                 |
| msg | 提示信息                   |
| data | 返回数据                   |


### 4. 调用示例

- #### 请求地址
http://opencdn.jcloud.com/api/queryForbiddenInfoList

- #### 请求示例
##### curl请求示例：
```
curl -X POST \
  http://opencdn.jcloud.com/api/queryForbiddenInfoList \
  -H 'Content-Type: application/json' \
  -d '{
    "username": "test_user",
    "signature": "d00f58f89e8cd55dc080aec0d8051845",
    "pageNumber": "1",
    "pageSize": "10",
    "url": "",
    "domain": ""
}'
```


* json格式

```
{
    "username": "test_user",
    "signature": "d00f58f89e8cd55dc080aec0d8051845",
    "pageNumber": "1",
    "pageSize": "10",
    "url": "",
    "domain": ""
}
 ```

- #### 返回示例

* json格式

```
{
	"status": 0,
	"msg": "成功",
	"data": {
		"total": 2,
		"forbiddenList": [{
			"forbiddenDomain": "www.a.com",
			"forbiddenInfoId": 1,
			"forbiddenPreson": "test_user",
			"forbiddenType": "domain",
			"linkOther": "n",
			"reason": "test"
		},
		{
			"forbiddenDomain": "www.a.com",
			"forbiddenInfoId": 2,
			"forbiddenPreson": "test_user",
			"forbiddenType": "url",
			"forbiddenUrl": "/test1/test4.txt",
			"linkOther": "n",
			"reason": "test1"
		}]
	}
}

```
