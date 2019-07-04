## 数据接入集群

ES 构建在 VPC 内，用户可以便捷地使用各种数据同步插件，将数据接入到 ES 集群中。用户可以通过 Elasticsearch REST client 编写代码的方式访问集群并接入数据，也可以通过官方提供的组件如 logstash 和 Beats接入数据。


 * 当数据量特别小时，您可以直接使用filebeat将数据接入集群。

 * 当有一定的数据量时，您可以使用filebeat来收集日志，发送到logstash server，或直接使用logstash，将数据接入到ES集群。

 * 当数据量特别大时，您可以使用filebeat来收集日志，经过kafka将日志信息发送到logstash server，再接入到ES集群中。

![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/logstash.png)

### 数据接入前提
由于ES创建在用户VPC内，因此需要用户创建一台和ES集群同一VPC的云主机。

### 使用Beats接入集群
Beats 包含用于收集文件类型数据的 fileBeat、 收集监控指标数据的 metricBeat、收集网络包数据的 packetBeat、收集Windows 系统日志的winlogbeat、收集审计数据的auditbeat等多种单一用途的的采集器，这些采集器比较轻量，相对于logstash，占用的系统资源较少，可以用于收集日志、监控等数据，用户也可以基于官方的 libbeat 库根据自己的需求开发自己的 Beats 组件。</br>

Filebeat相当于一个轻量级的logstash，当你需要收集信息的机器配置或资源并不是特别多时，可以使用filebeat来收集日志。操作步骤如下：</br>

1.安装部署filebeat

```
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.6.9-linux-x86_64.tar.gz
tar xvf filebeat-5.6.9.tar.gz
```

2.编辑配置文件/filebeat/filebeat.xml

```
// 定义日志文件的路径
filebeat.prospectors:
- input_type: log
    paths:
    - /usr/local/services/testlogs/*.log
 
// 设置输出到ES的IP地址和端口
output.elasticsearch:
  # Array of hosts to connect to.
  hosts: ["172.16.0.39:9200"]
  ```
  
3.执行filebeat

```
nohup ./filebeat 2>&1 >/dev/null &
```

### 使用logstash接入集群
Logstash是一款轻量级的日志搜集处理工具，使用管道方式进行数据传输、格式处理和格式化输出，常用于日志处理、或一些具有一定格式的数据导入到ES的处理。ES导入数据必须先创建index，mapping， logstash中并没有直接创建index，mapping，只传入了index，type等参数，logstash是通过ES的mapping template来创建的，这个模板文件不需要指定字段，就可以根据输入自动生成。操作步骤如下：

1.安装部署logstash和java</br>
 
 ```
wget https://artifacts.elastic.co/downloads/logstash/logstash-5.6.9.tar.gz

tar xvf logstash-5.6.9.tar.gz

yum install java-1.8.0-openjdk  java-1.8.0-openjdk-devel -y
```

2.根据数据源类型自定义配置文件*.conf。

#### File 数据源 

```
input {

    file {

        path => "/var/log/nginx/access.log" # 文件路径

        }

}

filter {

}

output {

  elasticsearch {

    hosts => ["http://172.16.0.89:9200"] # Elasticsearch集群的内网VIP地址和端口

    index => "nginx_access-%{+YYYY.MM.dd}" # 自定义索引名称, 以日期为后缀，每天生成一个索引

 }

}
```


更多详情请参见官方文档[file input plugin](https://www.elastic.co/guide/en/logstash/5.6/plugins-inputs-file.html)。</br>

#### Kafka 数据源
```
input{

      kafka{

        bootstrap_servers => ["172.16.16.22:9092"]

        client_id => "test"

        group_id => "test"

        auto_offset_reset => "latest" #从最新的偏移量开始消费

        consumer_threads => 5

        decorate_events => true #此属性会将当前topic、offset、group、partition等信息也带到message中

        topics => ["test1","test2"] #数组类型，可配置多个topic

        type => "test" #数据源标记字段

      }

}



output {

  elasticsearch {

    hosts => ["http://172.16.0.89:9200"] # Elasticsearch集群的内网VIP地址和端口

    index => "test_kafka"

 }

}
```


更多详情请参见官方文档 [kafka input plugin](https://www.elastic.co/guide/en/logstash/5.6/plugins-inputs-kafka.html)。</br>

3.执行logstash</br>

```
nohup ./bin/logstash -f ~/*.conf 2>&1 >/dev/null &
```
