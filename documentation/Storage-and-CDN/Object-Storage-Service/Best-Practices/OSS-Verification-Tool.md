# OSS线上服务快速验证工具

## 介绍
京东云对象存储开发了基于shell脚本的服务基本功能验证工具，支持Linux，Mac OS系统，Windows下通过各类Linux Shell也可使用；该工具验证范围包括：

- 基本测试：对象存储线上各域名的连通性和基本上传下载功能。

- 带宽测试：对象存储线上各域名上传下载的带宽。

**系统需求** ：任何带有bash、host、curl、openssl的POSIX系统，并且可以通过Internet访问京东云线上服务。

## 下载与使用

### 下载
下载地址：[京东云OSS线上快速验证工具](http://downloads.s3.cn-north-1.jcloudcs.com/tools/oss_verification_tool.tar.gz)

以Linux为例：

```
wget http://downloads.s3.cn-north-1.jdcloud-oss.com/tools/oss_verification_tool.tar.gz
tar -xzvf oss_verification_tool.tar.gz
```

### 基本测试

**基本测试覆盖点：**

- 标准域名解析

- 泛域名解析

- 各VIP连通性

- 通过标准域名上传

- 通过泛域名上传

- 通过标准域名下载并验证数据

- 通过泛域名下载并验证数据

**相关测试用例**

基本测试相关测试用例脚本位于`shest/test_suites/`目录下
```
test_all_regions.sh
test_cn-east-1_internal.sh
test_cn-east-1.sh
test_cn-east-2_internal.sh
test_cn-east-2.sh
test_cn-north-1_internal.sh
test_cn-north-1.sh
test_cn-south-1_internal.sh
test_cn-south-1.sh
```

**执行基本测试** 

```
shest/test_suites/test_<region_id>.sh
```
示例：
```
shest/test_suites/test_cn-north-1.sh // 对华北区各公网域名进行基本功能测试
shest/test_suites/test_cn-north-1_internal.sh // 对华北区各内网域名进行基本功能测试
```

**检查基本测试结果**

测试工具会将测试结果概要输出到标准错误中，并在最后标明成功和失败的用例数量以及测试日志位置。若测试结果概要中显示有任何用例失败（FAIL），则需要打开测试日志检查具体错误原因。
```
Test log: /root/shest/log/test_cn-east-1.log
--------------------------------------------------------------------------------
TC tc_oss_basic_test START @ 10/09/18-14:17:18.141
TP: tp_host_resolve  s3.cn-east-1.jcloudcs.com ... PASS
TP: tp_host_resolve  generic.s3.cn-east-1.jcloudcs.com ... PASS
TP: tp_vip_connectivity  222.187.243.43 ... PASS
TP: tp_put_object  s3.cn-east-1.jcloudcs.com/cn-east-1-simple-test ... PASS
TP: tp_put_object  cn-east-1-simple-test.s3.cn-east-1.jcloudcs.com ... PASS
TP: tp_get_object  s3.cn-east-1.jcloudcs.com/cn-east-1-simple-test/hosts ... PASS
TP: tp_get_object  cn-east-1-simple-test.s3.cn-east-1.jcloudcs.com/hosts ... PASS
TC tc_oss_basic_test END - 5 of 5 passed
--------------------------------------------------------------------------------
TC tc_oss_basic_test START @ 10/09/18-14:17:19.609
TP: tp_host_resolve  oss.cn-east-1.jcloudcs.com ... PASS
TP: tp_host_resolve  generic.oss.cn-east-1.jcloudcs.com ... PASS
TP: tp_vip_connectivity  222.187.243.43 ... PASS
TP: tp_vip_connectivity  222.187.243.47 ... PASS
TP: tp_put_object  oss.cn-east-1.jcloudcs.com/cn-east-1-simple-test ... PASS
TP: tp_put_object  cn-east-1-simple-test.oss.cn-east-1.jcloudcs.com ... PASS
TP: tp_get_object  oss.cn-east-1.jcloudcs.com/cn-east-1-simple-test/hosts ... PASS
TP: tp_get_object  cn-east-1-simple-test.oss.cn-east-1.jcloudcs.com/hosts ... PASS
TC tc_oss_basic_test END - 6 of 6 passed
--------------------------------------------------------------------------------
11 of 11 passed
Test log: /root/shest/log/test_cn-east-1.log
```

### 带宽测试

**带宽测试覆盖点：**

- 并发上传并获取吞吐量数据

- 并发下载并获取吞吐量数据

- 批量删除

**带宽测试用例**

带宽测试相关测试用例脚本位于`shest/test_suites/`目录下

```
test_throughput_cn-east-1.sh
test_throughput_cn-east-2.sh
test_throughput_cn-north-1.sh
test_throughput_cn-south-1.sh
```

**执行带宽测试**

```
shest/test_suites/test_throughput_<region_id>.sh
```

示例：

```
shest/test_suites/test_throughput_cn-north-1.sh // 对华北区公网域名进行带宽测试
```

**检查基本测试结果**

测试工具会将测试结果概要输出到标准错误中，并在最后标明成功和失败的用例数量以及测试日志位置。其中带宽数据可以在测试概要中看到。
```
Test log: /root/shest/log/test_throughput.log
--------------------------------------------------------------------------------
TC tc_oss_throughput_no_delete START @ 09/29/18-20:34:22.691
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 1 ... 13 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 1 ... 38 MB/s - PASS
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 1 ... 17 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 1 ... 94 MB/s - PASS
TC tc_oss_throughput_no_delete END - 4 of 4 passed
--------------------------------------------------------------------------------
TC tc_oss_throughput START @ 09/29/18-20:34:30.533
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 10 ... 91 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 10 ... 104 MB/s - PASS
TP: tp_del_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 10 ... PASS
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 10 ... 142 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 10 ... 223 MB/s - PASS
TP: tp_del_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 10 ... PASS
TC tc_oss_throughput END - 6 of 6 passed
--------------------------------------------------------------------------------
TC tc_oss_throughput START @ 09/29/18-20:34:44.495
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 20 ... 148 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 20 ... 89 MB/s - PASS
TP: tp_del_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 20 ... PASS
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 20 ... 233 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 20 ... 221 MB/s - PASS
TP: tp_del_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 20 ... PASS
TC tc_oss_throughput END - 6 of 6 passed
--------------------------------------------------------------------------------
16 of 16 passed
Test log: /root/shest/log/test_throughput.log
```

### 批量执行测试用例

该工具支持通过执行`shest/test_suites/shest.sh`来批量执行测试用例，您可以编辑`shest.sh`来定义执行哪些测试用例，通过增加、注释掉某些“run_tc”语句可以增加或减少需要执行的测试用例。

```
run_tc tc_oss_simple_test s3.cn-north-1.jcloudcs.com cn-north-1
run_tc tc_oss_simple_test oss.cn-north-1.jcloudcs.com cn-north-1
run_tc tc_oss_simple_test s3.cn-south-1.jcloudcs.com cn-south-1
run_tc tc_oss_simple_test oss.cn-south-1.jcloudcs.com cn-south-1
run_tc tc_oss_simple_test s3.cn-east-1.jcloudcs.com cn-east-1
run_tc tc_oss_simple_test oss.cn-east-1.jcloudcs.com cn-east-1
run_tc tc_oss_simple_test s3.cn-east-2.jcloudcs.com cn-east-2
run_tc tc_oss_simple_test oss.cn-east-2.jcloudcs.com cn-east-2
run_tc tc_oss_throughput s3.cn-south-1.jcloudcs.com cn-east-1 1 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-south-1.jcloudcs.com cn-east-1 10 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-north-1.jcloudcs.com cn-east-1 1 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-north-1.jcloudcs.com cn-east-1 10 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-east-1.jcloudcs.com cn-east-1 1 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-east-1.jcloudcs.com cn-east-1 10 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-east-2.jcloudcs.com cn-east-1 1 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-east-2.jcloudcs.com cn-east-1 10 $(( 10 * MB )) $(( 100 * MB ))
```
