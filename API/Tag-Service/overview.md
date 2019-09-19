# Resource-Tag API


## 简介
资源标签相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**describeCostAttrKeys**|GET|查询费用属性标签键信息 <br/><br>供标签控制台费用标签页面使用<br>|
|**describeKeys**|POST|获取标签键|
|**describeResources**|POST|获得资源与对应标签列表详情，不含资源名称和可用区。<br/><br>注意查询cdn的资源时url中regionId必须指定为cn-all。<br/><br>该接口目前不支持分页功能。<br>|
|**describeResourcesInfo**|POST|获取资源与对应标签列表详情, 不含资源名称和可用区。 <br/><br>注意查询cdn的资源时url中regionId必须指定为cn-all。<br/><br>|
|**describeTagResourcesInfo**|POST|获取标签信息与资源个数详情<br>|
|**describeTags**|POST|获取资源标签。<br/><br>注意查询cdn资源的标签时url中regionId必须指定为cn-all。<br/><br>注意查询不限制地域时url中regionId必须指定为all-region。<br>|
|**describeValues**|POST|获取标签值|
|**operateCostAttr**|POST|标签键操作(设置或取消)费用属性|
|**queryResource**|POST|根据标签查找资源。 <br/><br>若要查找cdn产品线的资源则url中的regionId必须指定为cn-all。<br>|
|**queryServiceCode**|GET|查询接入标签系统的所有产品线|
|**resetTagResources**|POST|资源标签批量替换|
|**tagResources**|POST|资源标签绑定。<br/><br>注意cdn资源绑定标签时url中regionId必须指定为cn-all。<br>|
|**unTagResources**|POST|资源标签解绑。<br/><br>注意cdn资源解绑标签时url中regionId必须指定为cn-all。<br>|
