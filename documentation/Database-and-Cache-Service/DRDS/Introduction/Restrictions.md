# 使用限制
**1. 暂不支持自增字段（auto_increment）**

DRDS暂时不支持自增字段auto_increment，用户需要在应用上自行实现数值自增的逻辑

**2. 不支持跨库事务**

DRDS 支持单个数据库事务，但不支持跨数据库的事务。

**3. 不支持跨库的join和子查询**

目前仅支持同一个数据库内的join和子查询语句，不支持跨库的join和子查询

**4. 不支持mysqldump**

DRDS自身不支持mysqldump，用户如果需要导出数据，可以直接登录到RDS MySQL上，对每个数据库逐一执行mysqldump操作

**5. Unique Index 的支持**
- 如果Unique Index和拆分字段一致，则Unique约束不受影响。
- 如果Unique Index和拆分字段不一致时，由于数据会被拆分到多个数据库的表中，因此Unique约束可能不会生效。 


### 数据库库名保留关键字
由于DRDS后端实际存储数据的是RDS MySQL，因此DRDS数据库名的保留关键字与MySQL相同。

```
mysql, information_schema, performance_schema, sys, percona, admin, aurora, replicator, 
xtrabak, root, mysql, test, eagleye, information_schema, guest, add, analyze, asc, between, 
blob, call, change, check, condition, continue, cross, current_timestamp, database, 
day_microsecond, dec, default, desc, distinct, double, each, enclosed, exit, fetch, 
float8, foreign, goto, having, hour_minute, ignore, infile, insensitiv, int1, int4, 
interval, iterate, keys, leading, like, lines, localtimestamp, longblob, low_priority, 
mediumint, minute_microsecond, modifies, no_write_to_binlog, on, optionally, out, precision, 
purge, read, references, rename, require, revoke, schema, select, set, spatial, sqlexception, 
sql_big_result, ssl, table, tinyblob, to, true, unique, update, using, utc_timestamp, varchar,
when, with, xor, all, and, asensitive, bigint, both, cascade, char, collate, connection, 
convert, current_date, current_user, databases, day_minute, decimal, delayed, describe, 
distinctrow, drop, else, escaped, explain, float, for, from, grant, high_priority, 
hour_second, in, inner, insert, int2, int8, into, join, kill, leave, limit, load, lock, 
longtext, match, mediumtext, minute_second, natural, null, optimize, or, outer, primary, 
raid0, reads, regexp, repeat, restrict, right, schemas, sensitive, show, specific, sqlstate, 
sql_calc_found_rows, starting, terminated, tinyint, trailing, undo, unlock, usage, utc_date, 
values, varcharacter, where, write, year_month, alter, as, before, binary, by, case, 
character, column, constraint, create, current_time, cursor, day_hour, day_second, declare, 
delete, deterministic, div, dual, elseif, exists, false, float4, force, fulltext, group, 
hour_microsecond, if, index, inout, int, int3, integer, is, key, label, left, linear, 
localtime, long, loop, mediumblob, middleint, mod, not, numeric, option, order, outfile, 
procedure, range, real, release, replace, return, rlike, second_microsecond, separator, 
smallint, sql, sqlwarning, sql_small_result, straight_join, then, tinytext, trigger, union, 
unsigned, use, utc_time, varbinary, varying, while, x509, zerofill, jcloud_yunding_db_push, 
jcloudv_push_rw, jcloudv_push_ro, jddb_percona
```

