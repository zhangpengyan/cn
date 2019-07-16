# 从本地 PostgreSQL 迁移到云数据库 PostgreSQL
这里主要讲下如何从本地自建 PostgreSQL 迁移到京东云云数据库 PostgreSQL，自建 PostgreSQL 需要您自己做 PostgreSQL 服务日常的运维，监控，备份等等其他操作，使用京东云云数据库 PostgreSQL 就省去了这些烦恼，只需要关注使用即可。

## 注意事项
* 新建的 PostgreSQL 实例需要和云主机在同一个 ***私有网络*** 内。
* 新建的 PostgreSQL 实例的容量空间要确保不能小于在云主机中自建的 PostgreSQL 。

## 操作步骤
1. 创建云数据库 PostgreSQL，具体的创建步骤请参考 [创建实例](../../../Operation-Guide/Instance/Create-Instance.md)。
2. 通过控制台进行数据库账号的创建，具体的创建步骤请参考 [创建账号](../../../Operation-Guide/Account/Create-Account/PostgreSQL-Create-Account.md)。
3. 完成云数据库 PostgreSQL 创建和初始化工作之后，开始从云主机中自建的 PostgreSQL 进行数据导出到云主机本地的操作，执行命令

    ```
    pg_dump -U 用户名 -h 数据库地址 -p 数据库端口 数据库名称 -f /路径/导出文件名.sql

    参数描述
        用户名：自建数据库的用户名。
        数据库地址：数据库主机名，如果是在本地数据库主机登录，可以使用localhost。
        数据库端口：自建数据库的端口号。
        数据库名称：填写您需要导出的库名。
    ```

4. 完成云主机中自建的 PostgreSQL 数据导出到本地之后，就可以将数据导入到云数据库 PostgreSQL 中，执行命令

    ```
    psql -U 用户名 -h 云数据库域名 -d 云数据库库名 -p 云数据库端口 -f /云主机路径/导出文件名.sql

    参数描述
        用户名：第 2 步操作中的用户名。
        云数据库域名：云数据库 PostgreSQL 的域名可以在实例的详情页查看。
        云数据库库名 ：需要将数据导入的目标库名。
        云数据库端口：云数据库 PostgreSQL 的端口号可以在实例的详情页查看。
    ```
5. 如果没有任何错误提示，表示导入成功。您可以登录到云数据库 PostgreSQL 里面查看，是否数据真的已经导入进去了。
