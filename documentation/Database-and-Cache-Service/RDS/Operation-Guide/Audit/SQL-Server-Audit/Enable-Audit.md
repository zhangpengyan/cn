# 开启审计
SQL Server的审计分为实例级的审计和数据库级的审计。
- 实例级的审计：可以通过控制台上进行审计的开启、关闭及编辑操作
- 数据库级的审计：由于涉及到具体的对象及SQL语句，不能在控制台进行操作，需要首先开启实例级审计，然后再连接到具体的数据库中执行SQL进行审计的开启、关闭及编辑。

## 实例级审计的开启
1. 进入实例详情中的审计页面，点击右边的开关按钮，开启审计

![开启审计1](../../../../../../image/RDS/Enable-Audit-1.png)

2. 进入到审计策略编辑页面
- 开启审计时，将直接进入到审计策略编辑界面中。
- 缺省使用推荐的审计策略，也可以根据需要进行选择
- 选择要开启的审计策略点击【确认】后即可。
![开启审计2](../../../../../../image/RDS/Enable-Audit-2.png)

## 数据库级审计的开启
> **注意： 审计会消耗数据库资源。如果对频繁的数据库操作进行了审计，可能会对数据库性能造成一定的影响，建议仅对重要的表及操作开启，或者仅在特定的时间段开启。**

1. 开启数据库级的审计，需要首先开启实例级的审计，并且至少选择一项审计策略。
2. 使用具有rw（读写）权限的用户账号，连接到将开启审计的数据库中。
3. 执行相应的SQL 语句，即可开启数据库的审计。例如对表tb1 开启USER1的 select，insert和delete审计，对tab2开启USER2的审计
```SQL
CREATE DATABASE AUDIT SPECIFICATION [Audit Name] -- 自己随意定义审计规则别名
FOR SERVER AUDIT [RDSAudit]                      -- 固定名称: RDSAudit,不能修改
ADD (SELECT ON OBJECT::[DBO].[tb1] BY [USER1]),
ADD (INSERT ON OBJECT::[DBO].[tb1] BY [USER1]),
ADD (DELETE ON OBJECT::[DBO].[tb1] BY [USER1]),
ADD (SELECT ON OBJECT::[DBO].[tb2] BY [USER2]),
ADD (INSERT ON OBJECT::[DBO].[tb2] BY [USER2]),
ADD (DELETE ON OBJECT::[DBO].[tb2] BY [USER2])
WITH (STATE=ON)
```

详细的SQL语法可参考微软文档 [CREATE DATABASE AUDIT](https://docs.microsoft.com/zh-cn/sql/t-sql/statements/create-database-audit-specification-transact-sql?view=sql-server-2017)
