## Elasticsearch日志
云搜索Elasticsearch提供通过京东云日志服务提供Elasticsearch日志的查询和展示，日志类型包括主日志、搜索慢日志、索引慢日志、GC日志的查询和展示，各类型日志的日志内容主要由time、content 组成。</br>

Time：日志的产生时间。</br>

Content：日志具体内容。</br>

### 前提条件
已开通了京东云的日志服务。</br>

已创建了云搜索Elasticsearch集群实例。</br>
### 配置流程
首先，您需要在日志服务中创建存放Elasticsearch日志的日志集，日志集名称和保存时间可根据您的业务需求进行定义。</br>

然后，您需要给该日志集添加对应的日志主题，主题名称建议与您需要查询的日志类型相对应，即主日志、搜索慢日志、索引慢日志、GC日志，一个日志主题只能对应一种类型的日志。</br>

最后，您需要给日志主题添加对应产品和日志类型的采集配置，您可以采集该产品和实例类型下全部实例的日志信息，也可以指定部分实例来采集日志信息。日志服务采集配置方法详情请参考云产品[日志采集](https://docs.jdcloud.com/cn/logservice/cloudresource)和[日志配置管理](https://docs.jdcloud.com/cn/logservice/collectionconfigmanagement)。</br>
### 检索日志
在采集配置完您所需要的日志信息后，可以通过日志服务的日志检索页面进行日志信息的查询，通过入关键字和设置时间范围，可以快速锁定需要查询的日志内容。云搜索Elasticsearch搜索日志语法及规则，详情请参见[日志检索](https://docs.jdcloud.com/cn/logservice/fulltextsearch)。
