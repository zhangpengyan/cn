# getSingleBucketCapacity


## 描述
根据type获取指定bucket用量数据

## 请求方式
POST

## 请求地址
https://ossopenapi.jdcloud-api.com/v1/regions/{regionId}/capacity/{bucketName}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域ID|
|**bucketName**|String|True| |查询用量的指定bucket|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**capacityTypes**|Integer[]|True| |<p>查询用量数据类型：</p><br><code>1000040</code>:标准存储<br><code>1000041</code>:低冗余存储<br><code>1000042</code>:归档存储<br><code>1000043</code>归档overHead存储:<br><code>1000044</code>低频存储:<br><code>1000045</code>低频overHead存储:<br><code>1</code>:内网GET流量<br><code>2</code>:内网HEAD流量<br><code>3</code>:内网PUT流量<br><code>4</code>:内网POST流量<br><code>5</code>:内网DELETE流量<br><code>6</code>:内网OPTIONS流量<br><code>7</code>:内网TRACE流量<br><code>11</code>:外网GET流量<br><code>12</code>:外网HEAD流量<br><code>13</code>:外网PUT流量<br><code>14</code>:外网POST流量<br><code>15</code>:外网DELETE流量<br><code>16</code>:外网OPTIONS流量<br><code>17</code>:外网TRACE流量<br><code>21</code>:CDN GET流量<br><code>22</code>:CDN HEAD流量<br><code>23</code>:CDN PUT流量<br><code>24</code>:CDN POST流量<br><code>25</code>:CDN DELETE流量<br><code>26</code>:CDN OPTIONS流量<br><code>27</code>:CDN TRACE流量<br><code>31</code>:内网GET数<br><code>32</code>:内网HEAD数<br><code>33</code>:内网PUT数<br><code>34</code>:内网POST数<br><code>35</code>:内网DELETE数<br><code>36</code>:内网OPTIONS数<br><code>37</code>:内网TRACE数<br><code>51</code>:外网GET数<br><code>52</code>:外网HEAD数<br><code>53</code>:外网PUT数<br><code>54</code>:外网POST数<br><code>55</code>:外网DELETE数<br><code>56</code>:外网OPTIONS数<br><code>57</code>:外网TRACE数<br><code>61</code>:CDN GET数<br><code>62</code>:CDN HEAD数<br><code>63</code>:CDN PUT数<br><code>64</code>:CDN POST数<br><code>65</code>:CDN DELETE数<br><code>66</code>:CDN OPTIONS数<br><code>67</code>:CDN TRACE数<br><code>71</code>:归档提前删除<br><code>72</code>:低频提前删除<br><code>81</code>:归档取回Bulk<br><code>82</code>:归档取回Std<br><code>83</code>:归档取回Exp<br><code>84</code>:低频数据取回<br>|
|**beginTime**|String|False| |开始时间，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ss'Z'|
|**endTime**|String|False| |结束时间，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ss'Z'|
|**periodType**|Integer|False| |查询数据的聚合方式:<br><code>0</code>:all, 最大查询区间365天 <br><code>1</code>:hour，最大查询区间31天。默认1<br><code>2</code>:day, 最大查询区间365天。|
|**method**|Integer|True| |返回数据的方式： <code>1</code>:recent(区间值), <code>2</code>:current(当前值。method = 2 时如果查询当前值时传入beginTime，则按照beginTime时间来进行查询；如果不传beginTime，则按照后端系统时间查询。)|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**bucketCapacityQueryResult**|BucketCapacityQueryResult| |
### BucketCapacityQueryResult
|名称|类型|描述|
|---|---|---|
|**resultList**|BucketCapacityStatistic[]|bucket 用量统计列表|
### BucketCapacityStatistic
|名称|类型|描述|
|---|---|---|
|**bucketName**|String|Bucket Name|
|**value**|Long|用量数值，单位Byte|
|**time**|String|时间|
|**capacityType**|Integer|用量类型|

## 返回码
|返回码|描述|
|---|---|
|**200**|success|
|**400**|Invalid parameter|
|**500**|Internal server error|
