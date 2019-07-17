# 全局自增ID
DRDS支持全局自增ID，可以根据用户定义，按以下三种方式生成：
- SIMPLE：系统每次申请自增ID时，都会访问系统数据库，可以确保自增ID连续单调递增和唯一，但这种方式性能较低。
- GROUP(默认）： 系统提前将一段连续的ID取出放在DRDS的内存中，每个DRDS节点一个GROUP。应用申请自增ID时，从内存中获取，性能极高。但由于应用可能会同时从两个GROUP中申请ID，因此通过这种方式获取的自增ID，可以保证唯一，但不能保证连续、递增。
- TIME：根据时间戳，采用近似snowflake算法生成的ID。时间戳可以精确到毫秒，同一毫秒至少可支持2^16个自增ID。 
> 注意：
>1. 使用TIME方式的自增ID，字段类型必须是bigint
>2. DRDS的全局自增ID不支持循环使用，超出最大限制后，会报错。

## SQL 语法
```SQL
CREATE TABLE table_name (
   [column definition]  AUTO_INCREMENT [SIMPLE| GROUP | TIME ],
   [other column definition],
   ...
) AUTO_INCREMENT=<start value>
[dbpartion options]
```

## 示例
1. 创建自增ID类型为group，起始值为10的表
```SQL
create table increment_demo1(
id int AUTO_INCREMENT group，
name varchar(10)
) AUTO_INCREMENT=10；
```
