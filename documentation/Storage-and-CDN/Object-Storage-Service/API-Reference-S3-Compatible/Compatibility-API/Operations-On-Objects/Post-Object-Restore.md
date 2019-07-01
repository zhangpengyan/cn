# POST Object restore

## 描述

该操作可以对存储类型为 GLACIER 的对象恢复临时副本。恢复时支持指定临时副本的生命周期，即在指定的时间段后，OSS会删除该临时副本。

还原已归档对象时，可以指定以下还原选项：
- Expedited：快速取回
- Standard：标准取回
- Bulk：批量检索

## 请求

### 请求语法
```
POST /ObjectName?restore HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: date
Authorization: authorization string

 request body 
```

### 请求参数
无请求参数

### 请求Header
无特殊Header

### 请求元素
请求Body的XML示例：
```
<RestoreRequest>
   <Days>2</Days> 
   <GlacierJobParameters>
     <Tier>Bulk</Tier>
   </GlacierJobParameters> 
</RestoreRequest> 
```
名称|描述|必须
-|-|-
RestoreRequest|取回信息的集合。<br>类型: Container |是
Days|取回的临时副本的生命周期。从Glacier恢复对象的最小天数为1。当对象副本达到指定生命周期后，OSS会将其从存储桶中删除。<br>类型：Positive Integer（正整数）<br>父标签：RestoreRequest|是
GlacierJobParameters|Glacier取回任务参数的集合。<br>类型：Container<br>父标签：RestoreRequest|否
Tier|还原选项，默认为Standard。<br>类型：Enum<br>有效值：Expedited | Standard | Bulk <br>父标签：GlacierJobParameters|否

## 响应





