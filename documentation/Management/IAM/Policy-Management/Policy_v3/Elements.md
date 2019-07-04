# 策略元素

IAM最新版本的策略(policy)，定义一条或多条权限的 JSON 文档，需遵循 JSON 语法规范。

策略（Policy）由如下策略元素组成：

- 策略版本（Version）
- 效力（Effect）
- 操作（Aciton）
- 资源（Resource）
- 角色扮演者（Principal）
- 生效条件（Condition）

## 版本(version)

必填项，描述策略语法版本。v3版本的值为"3"。

## 角色扮演者(principal)

选填项，京东云中可以扮演角色的实体用户或者服务。

## 语句(statement)

必填项，描述一条或多条权限的Json信息。该元素包括 action、resource、condition、effect 等多个其他元素的权限或权限集合。一条策略有且仅有一个statement 元素。

### 效力(effect)

必填项，包括 allow(允许)和deny(显式拒绝)两种情况。

> Deny 功能持续更新中，敬请期待

### 操作(action)

必填项，为实现京东云控制台和SDK访问的统一，我们将控制台上的每一个操作都具体细化到Open API级别，操作可以分为两大类：

- 不能指定资源的操作：如IAM子用户列表（iam:descirbeSubusers），群组列表(iam:describeGroups)，子用户创建(iam:createSubuser)等接口，这些接口在定义上就不允许指定资源进行操作，当您在IAM中创建自定义策略的时候，这些接口不支持对指定资源进行操作。一般列表接口，创建接口，报表接口都不支持对指定资源进行操作授权。
- 可以指定资源的操作：如IAM子用户详情（iam:describeSubuser），IAM子用户编辑（iam:modifySubuser）等接口，这些接口在定义上支持对指定资源进行操作，当您在IAM中创建自定义策略时，这些接口允许对指定资源进行授权和操作。一般详情，编辑，删除，解绑，绑定等接口都支持对指定资源进行操作授权。

### 资源(resource)

必填项，JDCloud资源名称（JDCloud Resource Name，JRN）是用来唯一标识一个JDCloud资源的，我们可以用JRN在JDCLOUD的全局环境中来明确指定一个资源。

### 生效条件(condition)

选填项，描述策略生效的约束条件。条件包括条件运算符、条件键和条件值组成。

> Condition的功能持续更新中，敬请期待

## 策略样例

该样例描述为：允许属于主账号 876393467912下的子账号，在从IP地址 “203.0.113.0/24”的时候，能够查看和创建IAM的子用户和群组，

```JSON
{
      "Version": "3",
      "Statement":
        [
        {
          "Effect": "Allow",
          "Action": ["iam:describe*","iam:create*"],
          "Resource": ["jrn:iam:*:*:subuser/*","jrn:iam:*:*:group/*"],
          "Condition":
             {
                "IpAddress":
                 {
                 "Jdcloud:SourceIp":"203.0.113.0/24"
                  }
              }
         }]
}
```
