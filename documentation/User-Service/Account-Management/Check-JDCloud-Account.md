# 查看账号信息

（如果您使用的是京东账号，请参考[《京东账号管理》](../../../documentation/User-Service/Account-Management/Manage-JD-Account.md) 进行操作。）

登录京东云后，可以通过 “账户管理 - 基本资料” 页面查看账号信息：
- 账号名：注册或京东账号升级时由用户设置，用于登录
- 账号ID：账号标识，用于 IAM 授权（参考 [IAM 帮助文档](https://docs.jdcloud.com/iam)）
- PIN (客户识别码)：账号的系统标识，一些 OpenAPI 中可能会要求传递 pin 参数（例如 [shareImage](https://docs.jdcloud.com/virtual-machines/api/shareimage?content=API)）

![](../../../image/User/Account-Mgmt/info1.png)

账号信息中，“账号名” 为您的账号登录标识。手机和邮箱主要用于账号安全验证。当手机或邮箱带有 ![](../../../image/User/Account-Mgmt/icon2.png)
 图标时，可用于登录；否则手机或邮箱不能用于登录。
