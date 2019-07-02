# 主子账号授权

消息队列 JCQ主子账号授权的功能是通过[访问控制 IAM](https://docs.jdcloud.com/cn/iam/product-overview)（Identity and Access Management， IAM）来实现的。

访问控制服务的核心功能主要是用户身份管理与资源访问控制。用户可以通过使用IAM创建、管理子用户，并控制这些子用户访问京东云资源的操作权限。使用访问控制，主账号可以向他人授权管理账户中的资源，而不必共享账户密码或访问秘钥，按需为用户分配所需的最小权限，从而降低企业信息安全风险。更多关于 IAM 的介绍可前往[IAM访问控制](https://docs.jdcloud.com/cn/iam/product-overview)查看。

消息队列 JCQ已全面对接访问控制服务，用户需要去[访问控制菜单](https://cm-console.jdcloud.com/cmSummary)设置子账户的用户权限。

现在系统已经预置5种策略，用户可以按需授权给子账户。同时，用户也可以根据访问控制的[操作指南](https://docs.jdcloud.com/cn/iam/policy-management)，自定义策略授权给子账号。

系统预置策略如下：

| 系统策略名称              | 权限描述                    | 类型     | 资源范围                       | 备注                                                   |
| ------------------------- | --------------------------- | -------- | ------------------------------ | ------------------------------------------------------ |
| JDCloudAdmin              | 消息队列（JCQ）管理员权限   | 系统类型 | 主账号下消息队列 JCQ的所有资源 | 消息队列 JCQ的所有权限，包括管理及消息发布和订阅       |
| JDCloudJCQTopicManagement | 消息队列（JCQ）主题管理权限 | 系统类型 | 主账号下消息队列 JCQ的所有资源 | 可以管理消息队列 JCQ的Topic，包括创建、删除和变更Topic |
| JDCloudJCQPub             | 消息队列（JCQ）发布权限     | 系统类型 | 主账号下消息队列 JCQ的所有资源 | 可以向已有Topic发布消息                                |
| JDCloudJCQSub             | 消息队列（JCQ）订阅权限     | 系统类型 | 主账号下消息队列 JCQ的所有资源 | 可以向已有Topic创建、删除及管理订阅并且消费消息        |
| JDCloudJCQRead            | 消息队列（JCQ）读权限       | 系统类型 | 主账号下消息队列 JCQ的所有资源 | 可以查询已有Topic的信息及死信队列，不具有修改权限      |
