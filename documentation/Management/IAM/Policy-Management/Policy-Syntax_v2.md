# 什么是Policy v2

本文介绍IAM Policy V2版本的基本元素、语法结构和示例。

## 基本元素

IAM Policy 包含以下基本元素：content（策略内容）、permission（允许的操作类型）、resource（允许操作的资源）、ids（指定资源的 IDs）、type（指定资源的类型）和 version（策略版本）。

- content
  Policy 的内容包含一组或多组授权详情。每一组授权详情都指定了被授权的资源（resource）和操作（permission）。
- type
  也就是产品线的service name，详情请参考[支持IAM的服务](https://docs.jdcloud.com/cn/iam/support-services)
- permission
  支持 3 种类型的资源操作，即读（R，指 Read）、改（M，指 Modify）、删除（D，指 Delete）。例如，查看云主机详情是读操作，备份或重启云主机均属于改操作，删除镜像是删除操作。
  当需要授权多种操作类型时，可以用竖线 "|" 将操作类型隔开。如，仅授权只读操作时，permission 为 "R"；授权管理员权限时，permission 为 "R|M|D"。
 
 > 注：如果授权子账号改权限（M）和删除权限（D），则子账号默认也具有读权限（R）。
 
- resource
  被授权的资源由资源类型（type）和资源 ID （ids） 指定。
- ids
  指定被授权的一个或多个资源 IDs。ids 支持通配符 *，用于授权对象是某一类资源，而不是指定资源 ID 的场景。
- version
  Policy 的版本，v2。

## Policy 的语法结构

Policy 的语法结构如下图所示。

![语法结构](../../../../image/IAM/PolicyManagement/policy语法结构.png)

Policy 的语法应符合 JSON 格式。如果您创建的授权策略不符合 JSON 语法，将无法保存成功。很多在线 JSON 格式检查工具都可以检查策略的格式错误。

## Policy 的语法描述

```JSON
<policy> =
{
<content>,
<version>
}
```

其中 Content 的描述可以包含一组或多组 Permission 和 Resource 对：

```JSON
<content> = 
"content":[
{
<permission>,
<resource>
},
{
<permission>,
<resource>
}
]
```

` permission`  中的内容 为（以管理员权限为例）：

```JSON
"permission" : "R|M|D"
```

` resource` 中需要指定资源的类型和 IDs：

```JSON
"resource":[
{
<ids>,
<type>
}
]
```

` ids` 中的可指定一个或多个资源（以指定资源 ID 为例）：

```JSON
"ids":[
"resource-id1",
"resource-id2"
]
```

`type`为指定产品线的service name：
```JSON
"type":"service name"
```
