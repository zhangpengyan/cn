# 表操作

## 创建、查看和删除表
```SQL
CREATE TABLE table_name column_name data_type constraint;
```

例如：
```SQL
CREATE TABLE person (
number INT(11),
name VARCHAR(255),
birthday DAT
);
```

如果表已存在，添加 IF NOT EXISTS 可防止发生错误：
```SQL
CREATE TABLE IF NOT EXISTS person (
  number INT(11),
  name VARCHAR(255),
  birthday DATE
);
```

## 查看所有表
```SQL
SHOW TABLES from db_name
```
例如：
```SQL
SHOW TABLES FROM testdb;
```
<br>

## 查看建表语句
```SQL
SHOW CREATE TABLE table_name;
```
例如：
```SQL
SHOW CREATE table person;
```

## 查看表的列
```SQL
SHOW FULL COLUMNS table_name;
```

例如：
```SQL
SHOW FULL COLUMNS FROM person;
```
## 删除表
```SQL
DROP TABLE table_name;
```
例如：
```SQL
DROP TABLE person;
DROP TABLE IF EXISTS person;
```
