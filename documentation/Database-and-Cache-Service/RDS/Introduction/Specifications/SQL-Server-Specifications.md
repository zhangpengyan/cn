# SQL Server 实例规格

**说明**
- 规格代码只与CPU、内存有关，因此相同的CPU、内存规格的实例，规格代码相同
- 北京地域的SQL Server 企业版同时支持本地SSD和NVME，其他地域暂时只支持本地SSD存储

**规格类型**
- 通用型：指CPU内存比为1:4的规格，适合绝大多数的数据库使用场景。 通用型规格支持所有的SQL Server版本
- 内存优化型：指CPU内存比为1:8的规格，适合对大内存有要求的业务场景。 内存优化型规格暂时只在北京地域提供，且仅支持SQL Server企业版

## 通用型

|实例规格|规格代码|存储空间(GB)|
|---|---|---|
|2核 8GB|db.sqlsvr.s1.large|200|
| |db.sqlsvr.s1.large|300|
| |db.sqlsvr.s1.large|400|
| |db.sqlsvr.s1.large|500|
|4核 16GB|db.sqlsvr.s1.xlarge|400|
| |db.sqlsvr.s1.xlarge|500|
| |db.sqlsvr.s1.xlarge|600|
| |db.sqlsvr.s1.xlarge|800|
|8核 32GB|db.sqlsvr.s1.2xlarge|600|
| |db.sqlsvr.s1.2xlarge|800|
| |db.sqlsvr.s1.2xlarge|1000|
| |db.sqlsvr.s1.2xlarge|1200|
|16核 64GB|db.sqlsvr.s1.4xlarge|1000|
| |db.sqlsvr.s1.4xlarge|1200|
| |db.sqlsvr.s1.4xlarge|1600|
| |db.sqlsvr.s1.4xlarge|2000|

## 内存优化型

|实例规格|规格代码|存储空间(GB)|
|---|---|---|
|2核 16GB|db.sqlsvr.m1.xlarge|200|
| |db.sqlsvr.m1.xlarge|300|
| |db.sqlsvr.m1.xlarge|400|
| |db.sqlsvr.m1.xlarge|500|
|4核 32GB|db.sqlsvr.m1.2xlarge|400|
| |db.sqlsvr.m1.2xlarge|500|
| |db.sqlsvr.m1.2xlarge|600|
| |db.sqlsvr.m1.2xlarge|800|
|8核 64GB|db.sqlsvr.m1.4xlarge|600|
| |db.sqlsvr.m1.4xlarge|800|
| |db.sqlsvr.m1.4xlarge|1000|
| |db.sqlsvr.m1.4xlarge|1200|
|16核 128GB|db.sqlsvr.m1.8xlarge|1000|
| |db.sqlsvr.m1.8xlarge|1200|
| |db.sqlsvr.m1.8xlarge|1600|
| |db.sqlsvr.m1.8xlarge|2000|
