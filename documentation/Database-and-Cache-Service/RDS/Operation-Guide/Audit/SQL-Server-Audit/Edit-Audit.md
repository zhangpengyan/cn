# 编辑审计策略
- 实例级的审计，可以直接在控制台中进行编辑
- 数据库级的审计，需要连接到相应的数据库中，执行SQL进行修改

## 实例级审计的修改
1. 进入到审计页面，点击编辑策略，进入到编辑页面
- 编辑过程中，如勾选【使用推荐配置】，系统将推荐的策略放到“已选”框中
- 如未选择任何审计策略，审计将自动关闭。

2. 完成选择后，点击确定，保存审计策略
![编辑审计1](../../../../../../image/RDS/Edit-Audit-1.png)
- 关于每个审计项的具体含义，可以查看[审计介绍](Audit-Introduction.md)中的相关链接
- 编辑完成后，审计界面显示修改后的实例审计策略


## 数据库级审计的修改
修改数据库的审计，可以删除掉现有策略，然后重新创建；也可以在现有策略上修改。 下面介绍一下在现有策略上修改的方法和步骤：

1.修改已有的审计策略，需要先Disable此审计策略
```SQL
ALTER DATABASE AUDIT SPECIFICATION  [Audit Name]    --Audit Name为要修改的审计名称
WITH (STATE=OFF)
```

2. 修改审计策略，并使之生效，例如
```SQL
ALTER DATABASE AUDIT SPECIFICATION [Audit Name]    --Audit Name为要修改的审计名称
FOR SERVER AUDIT [RDSAUDIT]
DROP (SELECT ON OBJECT::[DBO].[tb1] BY [USER1]),
DROP (INSERT ON OBJECT::[DBO].[tb2] BY [USER1]),
ADD (DELETE ON OBJECT::[DBO].[tb2] BY [USER1])
WITH (STATE=ON)
```
详细的语法，可以参考微软的官方文档 [ALTER DATABASE AUDIT SPECIFICATION](https://docs.microsoft.com/zh-cn/sql/t-sql/statements/alter-database-audit-specification-transact-sql?view=sql-server-2017)
