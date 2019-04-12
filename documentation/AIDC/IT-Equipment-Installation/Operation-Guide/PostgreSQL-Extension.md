# PostgeSQL 插件 
由于 PostgreSQL 提供了丰富的内核编程接口，从而允许开发者可以开发 PostgreSQL 的扩展程序, 以插件的方式实现动态加载，从而丰富了 PostgreSQL 的功能。

## 如何使用 PostgreSQL 插件 
默认情况下，云数据库 PostgreSQL 并未安装任何插件，如果您需要使用 PostgreSQL 的某个插件，请手动执行 `CREATE EXTENSION` 命令进行安装操作。

目前云数据库 PostgreSQL 支持的插件在下面会列举出来，不在列表中的插件表示目前暂不支持，后续我们会陆续增加更多的插件。

## 插件列表
|插件|描述|
|---|---|
|[PostGIS](http://www.postgis.net/), postgis_topology, postgis_tiger_geocoder, postgis_sfcgal|PostgreSQL 的空间和地理对象|
|[postgres_fdw](https://www.postgresql.org/docs/9.6/static/postgres-fdw.html)|外部数据包装器，用于访问存储在外部 PostgreSQL 服务器上的数据|
