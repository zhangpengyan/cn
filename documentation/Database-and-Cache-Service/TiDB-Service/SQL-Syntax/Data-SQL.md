# 数据操作
## 插入数据
```SQL
INSERT INTO person VALUES("1","tom","20170912");
```

## 查询数据

```SQL
SELECT * FROM person;
+--------+------+------------+
| number | name | birthday   |
+--------+------+------------+
|  1 | tom  | 2017-09-12 |
+--------+------+------------+
```

## 修改数据
```SQL
UPDATE person SET birthday='20171010' WHERE name='tom';
SELECT * FROM person;
+--------+------+------------+
| number | name | birthday   |
+--------+------+------------+
|  1 | tom  | 2017-10-10 |
+--------+------+------------+
```

## 删除数据
```SQL
DELETE FROM person WHERE number=1;
SELECT * FROM person;
Empty set (0.00 sec)
```
