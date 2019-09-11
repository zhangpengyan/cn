# DRDS SQL 使用限制
DRDS 兼容 MySQL 协议和语法，但由于DRDS和MyDQL还是存在一定的架构差异，因此在使用上有以下限制：
- 暂不支持用户自定义数据类型、自定义函数。
- 暂不支持临时表、视图、存储过程、触发器及游标。
- 暂不支持 BEGIN…END、LOOP…END LOOP、REPEAT…UNTIL…END REPEAT、WHILE…DO…END WHILE 等复合语句。

## SQL限制
- 不支持修改拆分字段的类型
- 不支持schema.table_name这样的创建及增删改查SQL
- 不支持 insert into ... select, load data, replace into 等插入语句
- 不支持 select into outfile/into dumpfile/into <variables>这样的SQL
- 不支持 rename表
- 不支持rename 拆分表中的拆分字段、auto increment字段
- 拆分表不支持CREATE TABLE ... LIKE 和 CREATE TABLE ... SELECT ... 

## 函数限制
DRDS暂不支持以下几类函数：
- 全文检索函数。
- XML 函数。
- GTID 函数。
- 企业加密函数。
