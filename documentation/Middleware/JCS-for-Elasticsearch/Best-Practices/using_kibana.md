## 使用Kibana
Kibana是一个开源的数据分析和可视化的平台，用户可以使用Kibana查询和分析存储在云搜索Elastisearch中的数据。
![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/kibana访问设置-01.png)

### 存储数据
#### 定义索引mapping
进入ES控制台，在实例列表页单击kibana，跳转到kibana web页面，点击左侧导航栏的Dev Tools进入页面可进行数据的存储。索引名称blog_index，类型名称为user，字段title和name的类型均为text，字段age的类型为integer。然后就可以通过Management->Index Patterns添加index pattern。
![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/kibana_save1.png)
```
PUT blog_index
{

"mappings": {

"user": {

"properties": {

"title": { "type": "text" },

"name": { "type": "text" },

"age": { "type": "integer" }

}
}
}
}
```
#### 添加索引文档
```
PUT blog_index/user
{

"title": "manager",

"name": "Tom Jerry",

"age": 34

}

```

### 定义索引模式
单击左侧导航栏的Management ，选择Index Patterns，在该页面中可以定义新的索引模式。</br>
#### 操作示例
1.为上一步骤中的样本数据集Shakespeare定义索引“shakes*”，然后点击“Create”；</br>

2.通过同样的方式可以再定义另一个索引“ba*”;</br>

3.单击“Add New “为上一步骤中的样本数据集logstash定义索引，勾选“Use event times to create index names [DEPRECATED]”，“Index pattern interval”下拉框中选择“Daily”;</br>

4.从下拉框“Time Filter field name ”选中“@timestamp”，然后点击”Create”，完成索引的定义。</br>

### 检索数据
单击kibana页面左侧导航栏的“Discover”，选择对应索引查看搜索结果。也可以通过输入特定的搜索条件在搜索框中进行检索，在搜索框中可以使用运算符>,<=，逻辑符AND OR NOT（都是大写）来进行组合检索。</br>
#### 操作示例
1.选中“ba*”作为检索条件；</br>

2.在搜索框中输入“account_number:<100 AND balance:>47500”进行搜索；</br>

3.在此搜索条件将返回account_number在【0，99】之间并且balance的值大于47500的结果。</br>

![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/kibana_1.png)
另外，还可以通过增加过滤属性作为条件筛选搜索结果。在“Available Fields list ”下的过滤条件中选择“Add”作为Fileds，若选择“account_number”作为Fileds时，则搜索结果中只包含account_number列。</br>
![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/kibana_2.png)
### 数据可视化
单击kibana页面左侧导航栏的“Visualize”，进行数据的可视化。
#### 操作示例
1.单击屏幕中央的“Create a visualization”；</br>

![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/kibana_3.png)
2.选择pie。</br>

![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/kibana_4.png)
3.选择索引模式为“ba*”，进行数据可视化。可以从已经保存的搜索结果中创建可视化，也可以重新输入新的检索规则，若要重新输入检索规则，需要指定一个索引模式；</br>

![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/kibana_5.png)
4.默认搜索匹配所有文档。

![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/kibana_6.png)
5.定义bucket。在样本数据集account.json中，每一个account都包含balance，通过建立一个bucket，可以定义balance的ranges，并且可以查看到有多少account在每个rangs中。</br>

a)	点击“Split Slices” bucket type</br>

b)	在“Aggregation”的下拉框中选择“Range”</br>

c)	在“Field”下拉框中选择“balance”</br>

d)	4次点击“Add Range“，总rangs为6个</br>

e)	定义以下的ranges：</br>

0             999</br>

1000         2999</br>

3000         6999</br>

7000        14999</br>

15000       30999</br>

31000       50000</br>

于是可以看到account在每个balance range的比例。
![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/kibana_7.png)
6.定义子bucket：使用account的holder’s age作为度量单位，通过添加另一个bucket，可以看到在每一个balance range中account holder的age。</br>

a)	点击“Add sub-buckets” bucket type</br>

b)	点击“Split Slices” bucket type</br></br>

c)	在“sub Aggregation”的下拉框中选择“Terms”</br>

d)	在“Field”下拉框中选择“age”</br>

e)	点击“Apply changes”</br>

现在可以看到account holder的age环绕在balance range中。</br>

![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/kibana_8.png)
7.点击“Save“，输入”Pie Example “进行保存。</br>

也可以根据您的需要创建其他类型的可视化，如Coordinate Map,Markdown,Vertical Bar。

### 结合仪表盘
点击kibana页面左侧导航栏的“Dashboard”，点击“Add”展示所有已保存的可视化图表，然后分别点击已经保存的可视化数据，然后点击小的向上箭头来合并可视化list
然后可以进行保存和生成链接share。
