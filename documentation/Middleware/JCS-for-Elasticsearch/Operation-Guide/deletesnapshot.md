## 删除快照
快照只能采用API来删除，因为快照是增量的，会存在很多依赖于过去的段，请您慎重操作，可对仓库/快照名称，发一个DELETE命令的 HTTP 调用，来删除所有不再有用的旧快照：

```
DELETE _snapshot/auto_snapshot/snapshot_2
```
