## 创建快照
您的第一个快照会是一个数据的完整拷贝，但所有后续的快照保留的是已存快照和新数据之间的差异。随着您不时的对数据进行快照，备份也在增量的添加和删除。这意味着后续备份会相当快速，因为它们只传输很小的数据量。</br>
### 自动快照
登录京东云搜索Elasticsearch控制台，可在创建集群时打开自动创建快照开关，也可在实例列表页单击实例名称进入集群管理界面，选择集群快照，或单击操作-更多-备份与恢复进入快照页面。默认每天备份，备份开始时间可修改。</br>

![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/snapshot1.png)
 
### 手动快照
在集群快照页面可开启手动创建快照。手动创建快照将由您定义快照名称前缀和索引，不设置索引，将创建集群全部索引的快照。如果想要备份指定的索引，请指定具体的索引名称，比如'index1,index2,index3'。逗号隔开，长度不超过64。</br>

![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/snapshot2.png)

### 列出快照信息
执行创建快照操作后，快照列表会展示自动快照和手动快照的快照信息，并展示当前快照状态。
