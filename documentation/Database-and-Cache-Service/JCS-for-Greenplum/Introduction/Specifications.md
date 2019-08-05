# 产品规格

云数据库 Greenplum 支持用户选择Segment节点的规格与数量，支持规格如下：

## Segment 节点规格

| 节点规格代码    | vCPU | 内存GB | 可用存储空间GB | 双副本总存储空间GB | Primary Segment数量 | 节点数量 |
| --------------- | ---- | ------ | -------------- | ------------------ | ------------------- | -------- |
| jdw.dc1.large   | 2    | 16     | 160            | 320                | 1                   | 2-8      |
| jdw.dc1.4xlarge | 16   | 128    | 1280           | 2560               | 4                   | 2-8      |

**说明：**

- 每个Segment节点会包含数个 Primary Segment 和 Mirror Segment 。
- 规格的存储空间为用户可用的存储空间，即Primary Segment占用的存储空间。
- Segment节点的总存储空间为规格展示的2倍，用于存储Primary Segment 和 Mirror Segment 的数据。
- 控制台可选择2-8个Segment节点，如需要更多节点，可提交工单开通。

