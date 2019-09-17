# 操作描述方式

操作有service name和具体操作名称组成，操作名称即为各产品线的Open API的接口名称，各产品线service name请参考[支持IAM的服务](https://docs.jdcloud.com/cn/iam/support-services)

```
所有产品所有操作，通过通配符的方式指定
"action":"*"
"action":"*:*"

// IAM产品所有操作，通过service name + 通配符的方式指定
"action":"iam:*"

// IAM产品的名为 createSubuser 的操作，单个操作的指定
"action":"iam:createSubuser"

// IAM产品的只读权限的操作，通过前缀通配的方式进行指定
"action":"iam:describe*"

// IAM产品，名为 createSubuser，createGroup，createRole 的操作列表，多个操作同时指定
"action":["iam:createSubuser","cos:createGroup","cos: createGroup"]
```
