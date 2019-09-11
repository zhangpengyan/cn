# DRDS DML SQL 语法

## INSERT
在DRDS中对拆分表进行insert时，必须在表名后加入字段名，否则拒绝执行该SQL
```SQL
-- 正确的SQL
insert into ddl_demo1 (id,name) values (1,'abc');

--错误的SQL
insert into ddl_demo1  values (100,'abc');
```

## DELETE，UPDATE，SELECT
建议在where语句中带上拆分字段，这样DRDS会根据拆分字段的值将SQL语句发往合适的分库分表中，可以提高SQL效率，例如：
```SQL
select id,name from ddl_demo1
where id =100;

update ddl_demo1
set name = 'efg'
where id = 100;

delete from ddl_demo1
where id =100;
```


