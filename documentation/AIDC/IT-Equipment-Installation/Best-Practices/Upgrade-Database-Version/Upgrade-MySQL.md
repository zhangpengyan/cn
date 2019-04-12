# 升级云数据库 MySQL 版本
这里主要讲下如何从低版本的云数据库 MySQL 升级到高版本的云数据库 MySQL，下面以云数据库 MySQL 5.7 升级到 MySQL 8.0 为例。

## 注意事项
* 请确保安装了 MySQL 8.0 的客户端。 
* 新建的云主机需要和 MySQL 5.7 实例在同一个 ***私有网络*** 内。
* 新建的 MySQL 8.0 实例需要和 MySQL 5.7 实例在同一个 ***私有网络*** 内。
* 新建的 MySQL 8.0 实例的容量空间要确保不能小于原来的 MySQL 5.7 实例 。

## 操作步骤
1. 创建云主机，具体的创建步骤请参考 [创建云主机](https://docs.jdcloud.com/cn/virtual-machines/create-instance)，创建云主机时候需要注意以下几点
    * 请确保云主机和需要升级版本的云数据库 MySQL 5.7 实例在同一个 ***私有网络*** 内。
    * 新建的云主机需要带一个 ***公网 IP***，提供公网访问能力，否则没办法远程登录到云主机上。
    * 请确保云主机所在子网的 ***网络 ACL*** 是允许本地 ssh 连接到云主机上的。
2. 完成云主机创建之后，远程登录到云主机上，安装 MySQL 8.0 的客户端，客户端安装文件[下载地址](https://dev.mysql.com/downloads/mysql/5.5.html?os=31&version=5.1), 客户端[安装教程](https://dev.mysql.com/doc/refman/8.0/en/linux-installation-rpm.html)
3. 完成客户端的安装之后，开始从云数据库 MySQL 5.7 进行数据导出到云主机本地的操作，执行命令

    ```
    mysqldump -u用户名 -p密码 -R -E --skip-tz-utc --opt --skip-add-drop-table --single-transaction --hex-blob --default-character-set=binary --master-data=2 -B 数据库名称 > /路径/导出文件名.sql

    参数描述
        用户名：云数据库的用户名。
        密码：云数据库的密码。
        数据库名称：填写您需要导出的库名，多个库名通过空格来分隔。
    ```

4. 完成云数据库 MySQL 5.7 数据导出之后，开始创建云数据库 MySQL 8.0，具体的创建步骤请参考 [创建云数据库 MySQL 实例](../../Operation-Guide/Instance/Create-Instance.md)。
5. 通过控制台进行库的创建，确保云数据库 MySQL 5.7 中需要导出的库名在云数据库 MySQL 8.0 中同样的创建了一遍，具体的创建步骤请参考 [创建库](../../Operation-Guide/Database-Management/Create-Database.md)。
6. 通过控制台进行数据库账号的创建，然后赋予这个账号在第 5 步操作中新建的库的 ***读写*** 权限，具体的创建步骤请参考 [创建账号](../../Operation-Guide/Account/Create-Account/MySQL-Create-Account.md)。

7. 将第 3 步导出的数据导入到新建的云数据库 MySQL 8.0 中，执行命令

    ```
    mysql -u用户名 -p密码 -h 云数据库域名 --default-character-set=binary < /路径/导出文件名.sql

    参数描述
        用户名：第 6 步操作中的用户名。
        密码：第 6 步操作中的用户对应的密码。
        数据库域名：云数据库 MySQL 8.0 的域名可以在实例的详情页查看。
    ```
    
6. 如果没有任何错误提示，表示导入成功。您可以登录到云数据库 MySQL 8.0 里面查看，是否数据真的已经导入进去了。
