## 访问集群示例
### 基于云服务器访问前提
京东云搜索Elasticsearch与依赖的云主机必须处于同一个VPC下，因此要先创建相同私有网络和子网的云主机，从该云主机下获取到“公网IP”，才能访问云搜索Elasticsearch服务。
### curl测试访问内网域名
1. ssh 用户名@公网IP，输入密码。</br>
2. 通过Linux环境下的curl命令访问云搜索Elasticsearch实例的9200端口。指定账号密码访问示例格式为curl –XGET [实例内网访问域名]/_cat，内网访问域名为ES实例基本信息界面的 **内网访问域名** ，指令示例如下：

```
curl -XGET es-nlb-es-kgqo8zmgcv.jvessel-open-hb.jdcloud.com:9200/_cat
```
响应如下代表访问成功：
```
{
  =^.^=
/_cat/allocation
/_cat/shards
/_cat/shards/{index}
/_cat/master
/_cat/nodes
/_cat/tasks
/_cat/indices
/_cat/indices/{index}
/_cat/segments
/_cat/segments/{index}
/_cat/count
/_cat/count/{index}
/_cat/recovery
/_cat/recovery/{index}
}
```
### 导入数据
1. 下载数据集示例（首次登陆云主机需进行此步骤）</br>
```
wget https://download.elastic.co/demos/kibana/gettingstarted/shakespeare.json
wget https://download.elastic.co/demos/kibana/gettingstarted/accounts.zip
wget https://download.elastic.co/demos/kibana/gettingstarted/logs.jsonl.gz
```
2. 解压数据集示例
```
unzip accounts.zip
gunzip logs.jsonl.gz
```
3. 为Shakespeare数据集创建mapping，格式为curl -X PUT "[实例的内网访问域名]/shakespeare" -H 'Content-Type: application/json' -d'
 {
  "mappings" : {
   "_default_" : {
    "properties" : {
     "speaker" : {"type": "keyword" },
     "play_name" : {"type": "keyword" },
     "line_id" : { "type" : "integer" },
     "speech_number" : { "type" : "integer" }
    }
   }
 }
}
'，示例如下：

```
curl -X PUT "es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/shakespeare" -H 'Content-Type: application/json' -d' { "mappings" : { "_default_" : { "properties" : { "speaker" : {"type": "keyword" }, "play_name" : {"type": "keyword" }, "line_id" : { "type" : "integer" }, "speech_number" : { "type" : "integer" } } } } } '

 
```
响应如下时表示成功：
```
{"acknowledged":true,"shards_acknowledged":true,"index":"shakespeare"}
```
4. 为logstash创建mapping，格式为curl -X PUT "[实例的内网访问域名]/logstash-20181010" -H 'Content-Type: application/json' -d'
{
  "mappings": {
    "log": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
    }
  }
}' ，示例如下：

```
curl -X PUT "es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/logstash-20181011" -H 'Content-Type: application/json' -d' { "mappings": { "log": { "properties": { "geo": { "properties": { "coordinates": { "type": "geo_point" } } } } } } }' 

```
5. 加载数据集并验证加载是否成功，示例如下：
```
curl -H 'Content-Type: application/x-ndjson' -XPOST 'es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/bank/account/_bulk?pretty' --data-binary @accounts.json

curl -H 'Content-Type: application/x-ndjson' -XPOST 'es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/shakespeare/_bulk?pretty' --data-binary @shakespeare.json

curl -H 'Content-Type: application/x-ndjson' -XPOST 'es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/_bulk?pretty' --data-binary @logs.jsonl

curl -X GET "es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/_cat/indices?v"

```
出现类似以下输出时表示数据加载成功：
```
health status index uuid pri rep docs.count docs.deleted store.size pri.store.size
green open logstash-20181010 kUP-0TEJTxCTJLRZzTGeWg  5  1          0            0      1.5kb           810b
green  open   logstash-2015.05.18 GLLhXFRhQIaEmCE-JjYUew   5   1       4631            0       65mb         32.7mb
green  open   logstash-2015.05.19 MYvyilYSRNitM1cP4cn5cQ   5   1       4624            0     63.8mb         32.4mb
green  open   bank                AI80JfMGTY2zf916VqqnmQ   5   1       1000            0      1.2mb        640.8kb
green  open   shakespeare         y9zglGy5TqmNJ-AdtQKblg   5   1     111396            0     57.8mb         29.1mb
green  open   .kibana             Wui_-I2FR0eyu2IIvf7SZQ   1   1          1            0      6.4kb          3.2kb
green  open   logstash-2015.05.20 ssOTajNfRsO0FmXMmO2qvA   5   1       4750            0     65.8mb         33.1mb

```
