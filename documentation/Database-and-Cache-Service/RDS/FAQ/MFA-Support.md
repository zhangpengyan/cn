# MFA(多因子认证）支持

MFA (Multi-Factor Authentication) 是一种简单有效的最佳安全实践，它能够在用户名和密码之外再额外增加一层安全保护，并且在京东云进行敏感操作时，进行身份验证防止误删。

关于MFA的具体介绍和设置请参考[MFA文档](https://docs.jdcloud.com/cn/iam/mfa-overview)

### RDS 支持 的身份校验方式有：

- 手机短信
- 电子邮箱
- 微信小程序 （京东云助手）

### RDS 支持的敏感操作
- MySQL、Percona、MariaDB
    - 删除实例
    - 删除只读实例
    - 删除数据库
- SQL Server
    - 删除实例
    - 删除数据库
    - 单库上云导入
    - 备份恢复
    - 单库跨实例恢复
