### 查看快照信息

1.直接对仓库auto_snapshot和快照名snapshot_1发起一个 GET 请求，获得单个快照信息：

```
GET _snapshot/auto_snapshot/snapshot_1
```

返回的响应中包括快照相关的各种信息：

```
{
  "snapshots": [
    {
      "snapshot": "snapshot_1",
      "uuid": "AMvUjS9HStmIk5e6BUr2Hw",
      "version_id": 5060999,
      "version": "5.6.9",
      "indices": [
        "customer",
        "index"
      ],
      "state": "SUCCESS",
      "start_time": "2019-02-19T02:53:55.899Z",
      "start_time_in_millis": 1550544835899,
      "end_time": "2019-02-19T02:54:00.327Z",
      "end_time_in_millis": 1550544840327,
      "duration_in_millis": 4428,
      "failures": [],
      "shards": {
        "total": 10,
        "failed": 0,
        "successful": 10
      }
    }
  ]
}
```

2.您也可以使用 _all 占位符，获取一个仓库中所有快照的完整列表：

```
GET _snapshot/auto_snapshot/_all
```

3.您也可以通过拽取 _status API 数据查看快照的详细信息：
```
GET _snapshot/auto_snapshot/snapshot_1/_status
```
响应包括快照的总体状况，但也包括下钻到每个索引和每个分片的统计值，分片的不同完成状态展示如下：</br>

INITIALIZING：分片在检查集群状态看看自己是否可以被快照。这个一般是非常快的。</br>

STARTED：数据正在被传输到仓库。</br>

FINALIZING：数据传输完成；分片现在在发送快照元数据。</br>

DONE：快照完成。</br>

FAILED：快照处理的时候碰到了错误，这个分片/索引/快照不可能完成了。检查您的日志获取更多信息。</br>
