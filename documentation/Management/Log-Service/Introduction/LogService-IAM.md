# 日志服务IAM说明

## 一、概念

资源访问控制服务。IAM是基于用户的授权策略。通过设置 IAM，您可以集中管理您的用户（比如员工、系统或应用程序），以及控制用户可以访问您名下哪些资源的权限。比如能够限制您的用户只拥有对日志服务的读权限。子账号是从属于主账号的，并且这些账号下不能拥有实际的任何资源，所有资源都属于主账号。 
日志服务当前版本仅支持IAM当中的主子账户策略，角色将后续支持。

## 二、子账户使用日志服务流程

### 1.创建子账户

使用主账号登陆控制台，进入“管理—>访问控制”，https://iam-console.jdcloud.com/summary
点击“创建”，填写子账户信息，点击“确定”，完成创建。

![image](https://raw.githubusercontent.com/jdcloudcom/cn/zhangwenjie-only/image/LogService/LogserviceIAM/LS01.png)

![image](https://raw.githubusercontent.com/jdcloudcom/cn/zhangwenjie-only/image/LogService/LogserviceIAM/LS02.png)

### 2.为子账户授权

进入“管理-->访问控制-->用户管理”，选择指定的子账户，点击“授权”，可为子账户授予若干策略，策略的管理在“管理-->访问控制-->策略管理”。
默认策略有 管理员、只读 两种，可支持自定义策略。

![image](https://raw.githubusercontent.com/jdcloudcom/cn/zhangwenjie-only/image/LogService/LogserviceIAM/LS03.png)

### 3.子账户登录控制台

子账户登录控制台的URL与主账户不同，可在概览页中查看。

![image](https://raw.githubusercontent.com/jdcloudcom/cn/zhangwenjie-only/image/LogService/LogserviceIAM/LS04.png)

完成子账户创建与授权后，即可通过子账号登录链接进入控制台，根据所授予的权限进行操作和查看。
