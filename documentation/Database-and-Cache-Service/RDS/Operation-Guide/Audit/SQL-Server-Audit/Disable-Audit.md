# 关闭审计
- 实例级审计：可以在控制台关闭
- 数据库级的审计：如果要关闭所有的审计，直接关闭实例级的审计即可。如果只是关闭某个数据库审计，则需要连接到具体的数据库中执行相应的SQL进行关闭。

## 实例级审计的关闭
1. 进入实例审计页面，点击右边的按钮

![关闭实例1](../../../../../../image/RDS/Disable-Audit-1.png)

> **注意：如果在审计编辑页面中，删除了所有的审计策略，审计也会自动关闭**

2.在对话框中确认关闭。 
> 关闭审计不会删除已经生成的审计记录文件。

## 数据库级审计的关闭
1. 查看当前数据库中所有的审计规则
```SQL
SELECT * FROM SYS.DATABASE_AUDIT_SPECIFICATIONS
```
2. 查看审计规则的具体内容，确认要删除的规格正确无误
```SQL
SELECT t1.* FROM SYS.DATABASE_AUDIT_SPECIFICATION_DETAILS t1, SYS.DATABASE_AUDIT_SPECIFICATIONS t2
where t1.database_specification_id = t2.database_specification_id
and t2.name = 'xxxxxx'   -- xxxxxx为要删除审计规则的名称
```

3. 删除自定义审计规则
```SQL
ALTER DATABASE AUDIT SPECIFICATION [Audit Name]    --Audit Name为要修改的审计名称
WITH (STATE=OFF);

DROP DATABASE AUDIT SPECIFICATION [Audit Name]  -- Audit Name为要删除审计规则的名称
```
