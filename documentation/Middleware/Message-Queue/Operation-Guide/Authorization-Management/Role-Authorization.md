# 角色授权

消息队列 JCQ 角色授权的功能通过[访问控制 IAM](https://docs.jdcloud.com/cn/iam/product-overview)（Identity and Access Management， IAM）来实现的。
更多关于 IAM 的介绍可前往[IAM访问控制](https://docs.jdcloud.com/cn/iam/product-overview)查看。


说明：

- 权限分割需要创建不同的IAM角色来实现

- 角色扮演者资源创建或者使用资源产生的费用统一划归到角色创建的主账号下

- 主账号拥有创建和删除角色及其策略的权限

  

授权流程：

消息队列 JCQ已全面对接访问控制服务，用户需要去[访问控制菜单](https://cm-console.jdcloud.com/cmSummary)设置角色的授权。

1. 主账号A创建用户角色，例如RoleA并为用户角色授予相应的策略，[参考](https://docs.jdcloud.com/cn/iam/createrole)。

   - 系统策略可以参考：

     | 系统策略名称              | 权限描述                    | 类型     | 资源范围                       | 备注                                                   |
     | ------------------------- | --------------------------- | -------- | ------------------------------ | ------------------------------------------------------ |
     | JDCloudAdmin              | 消息队列（JCQ）管理员权限   | 系统类型 | 主账号下消息队列 JCQ的所有资源 | 消息队列 JCQ的所有权限，包括管理及消息发布和订阅       |
     | JDCloudJCQTopicManagement | 消息队列（JCQ）主题管理权限 | 系统类型 | 主账号下消息队列 JCQ的所有资源 | 可以管理消息队列 JCQ的topic，包括创建、删除和变更topic |
     | JDCloudJCQPub             | 消息队列（JCQ）发布权限     | 系统类型 | 主账号下消息队列 JCQ的所有资源 | 可以向已有topic发布消息                                |
     | JDCloudJCQSub             | 消息队列（JCQ）订阅权限     | 系统类型 | 主账号下消息队列 JCQ的所有资源 | 可以向已有topic创建、删除及管理订阅并且消费消息        |
     | JDCloudJCQRead            | 消息队列（JCQ）读权限       | 系统类型 | 主账号下消息队列 JCQ的所有资源 | 可以查询已有topic的信息及死信队列，不具有修改权限      |

   - 自定义策略，[参考](https://docs.jdcloud.com/cn/iam/createpolicy)。

2. 登陆主账号B创建一个IAM子用户SubB，并授予**JDCloudStsAdmin**安全令牌系统策略，[参考](https://docs.jdcloud.com/cn/iam/createsubuser)。

3. 登陆IAM子用户SubB，进入子用户控制台，点击右上角菜单中的 “切换角色”，进行角色身份的登录，输入主账号A的accountID和RoleA的角色名称，登录后，SubB将以RoleA的身份和权限对主账号A的资源进行访问和管理。
