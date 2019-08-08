# 连接实例

云数据库 Greenplum 基于Greenplum 5.19提供服务，完全兼容 PostgreSQL 8.3 的消息协议，可以直接使用支持 PostgreSQL 8.3 消息协议的工具，例如 libpq、JDBC、ODBC、psycopg2、pgadmin III 等。

Greenplum 官网包含 JDBC、ODBC 和 libpq的安装包，用户可方便地安装和使用，详情参见[Greenplum 官方文档](http://gpdb.docs.pivotal.io/4380/client_tool_guides/drivers/unix/unix_connect.html)。

psql 是 比较常用的Greenplum工具，提供了丰富的命令，其二进制文件在 Greenplum 安装后的 BIN 目录下。

以下说明如何使用psql连接Greenplum：

1. 连接串的方式

   ```
   psql "host=jdw-xxx-master-0.jvessel-open-hb.jdcloud.com port=5432 user=<username>" 
   ```

2. 指定参数的方式

   ```
   psql -h jdw-xxx-master-0.jvessel-open-hb.jdcloud.com -p 5432 -U <username>
   ```

   参数说明：

   - -h：指定主机地址。
   - -p：指定端口号。
   - -U：指定连接的用户。
   - 可以通过`psql --help`查看更多选项。在 psql 中，可以执行`\?`查看更多 psql 中支持的命令。

说明：

- 关于 Greenplum 的 psql 的更多使用方法，请参见文档“[psql](http://gpdb.docs.pivotal.io/4340/client_tool_guides/client/unix/psql.html)”。
- 数据仓库 JDW 也支持 PostgreSQL 的 psql 命令，详情参见“[PostgreSQL 8.3.23 Documentation — psql](https://www.postgresql.org/docs/8.3/static/app-psql.html)”。

