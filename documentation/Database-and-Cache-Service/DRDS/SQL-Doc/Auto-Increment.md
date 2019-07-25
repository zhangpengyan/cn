# 全局自增ID
在单机MySQL的环境中，自增字段可以帮助用户生成表中唯一，递增的数值。但在DRDS中情况发生了变化，对于拆分表来说原先的一个表实际上已经被拆分成了后端多个分表，所以传统的自增字段已经不能满足用户的需求。所以DRDS对此做了改进，对于拆分表也可以生成唯一的数值。
>备注：本文中介绍的全局自增ID只针对拆分表；对于非拆分表，可以直接用MySQL的语法，

DRDS的全局自增ID，可以根据用户定义，按以下三种方式生成自增ID。
- SIMPLE：系统每次申请自增ID时，都会访问系统数据库，可以确保自增ID连续单调递增和唯一，但这种方式性能较低。
- GROUP（默认）： 系统提前将一段连续的ID取出放在DRDS的内存中，每个DRDS节点一个GROUP。应用申请自增ID时，从内存中获取，性能极高。但由于应用可能会同时从两个GROUP中申请ID，因此通过这种方式获取的自增ID，可以保证唯一，但不能保证连续、递增。
- TIME：根据时间戳，采用近似snowflake算法生成的ID，时间戳可以精确到毫秒，同一毫秒至少可支持2^16个自增ID。 
> 注意：使用TIME方式的自增ID，字段类型必须是bigint。

## SQL 语法
```SQL
CREATE TABLE table_name (
   [column definition]  auto_increment by [SIMPLE| GROUP | TIME ],
   [other column definition],
   ...
) auto_increment=<start value>
[dbpartion options]
```
为配合DRDS全局自增ID，DRDS新增了3个变量。这三个变量**只支持global级别的设置，不支持session级的，**因此建议修改时评估是否会影响其他的自增ID。
- drds_auto_increment_increment：对应MySQL的auto_increment_increment 。
- drds_auto_increment_offset：对应MySQL的auto_increment_offset 。
- drds_group_size：使用group方式申请自增ID时，每个group的大小，默认为1000 。
> 注意：在DRDS中设置原先MySQL的auto_increment_increment和auto_increment_offset，只能是session级别，global级别的set不生效。


使用 'show variables' 可以查看drds相关的变量
```
show variables like 'drds%' 
```

## 示例
1. 创建自增ID类型为group，起始值为10的表
```SQL
create table increment_demo1(
id int auto_increment by group,
name varchar(10),
key(id)
) auto_increment=10
dbpartition by int_mod(id);
```

## 使用说明：
1. 使用TIME方式的自增ID，字段类型必须是bigint。
2. DRDS的全局自增ID不支持循环使用，超出最大限制后，会报错，因此请设置合适的int字段类型。
3. SIMPLE,GROUP,TIME 不区分大小写。
4. 如果插入语句报错，当前的ID值将被丢弃，下次插入会申请新的ID。
5. 如果自增ID字段插入'0'，也会生成自增ID，这是跟MySQL略有区别的地方。
