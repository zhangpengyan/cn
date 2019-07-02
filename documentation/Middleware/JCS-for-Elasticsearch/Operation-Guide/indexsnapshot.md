## 快照指定索引
快照操作默认情况下会备份所有打开的索引。如果您不想把所有的索引都备份起来，可以在快照集群时，只备份您指定的索引例如在仓库auto_snapshot中的snapshot_2执行以下命令只会备份 customer和 index：</br>

```
PUT _snapshot/auto_snapshot/snapshot_2
{
 "indices":"customer,index"
}
```
