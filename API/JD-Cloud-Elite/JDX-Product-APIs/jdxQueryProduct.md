# jdxQueryProduct


## 描述
输出商品接口

## 请求方式
GET

## 请求地址
https://elite.cn-south-1.jdcloud-api.com/v1/regions/{regionId}/jdxQueryProduct

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNo**|Integer|True| |页码（最小1）|
|**pageSize**|Integer|True| |每页记录数（最小10，最大100）|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID，每次请求都不一样|

### Result
|名称|类型|描述|
|---|---|---|
|**status**|Boolean|true为成功，false为失败|
|**message**|String|描述信息|
|**data**|JdxProductVoListData|查询数据结果|
### JdxProductVoListData
|名称|类型|描述|
|---|---|---|
|**pageNo**|Integer|页码|
|**pageSize**|Integer|每页记录数|
|**totalRecord**|Integer|总记录数|
|**totalPage**|Integer|总页数|
|**dataList**|JdxProductVo[]|商品信息列表|
### JdxProductVo
|名称|类型|描述|
|---|---|---|
|**productId**|Integer|产品ID|
|**productName**|String|商品名称|
|**trademarkUrl**|String|商标图片地址|
|**categoryLevel1Name**|String|所属一级分类名称|
|**categoryLevel2Name**|String|所属二级分类名称|
|**deliveryForm**|Integer|交付形态|
|**deliveryFormName**|String|交付形态名称|
|**introduction**|String|商品简介|
|**sellType**|Integer|商品定价模式 1:按套次、2:按周期、3:按套餐包|
|**sellTypeName**|String|商品定价模式名称|
|**refundDays**|Integer|-1:不允许退款， 单位：天， 默认-1|
|**pcProductDetail**|String|pc端商品详情|
|**mProductDetail**|String|m端商品详情|
|**productSkuList**|JdxProductSkuVo[]|sku详情信息|
### JdxProductSkuVo
|名称|类型|描述|
|---|---|---|
|**skuId**|Integer|sku ID|
|**skuName**|String|sku名称|
|**saleAttributes**|String|销售属性json字符串,version表示版本(套次、周期、套餐包类商品均有该属性),validity表示周期(周期和套餐包类商品有该属性),packageNum表示条数(只有套餐包类商品有该属性)：例如[{"attrCode":"version","attrValue":"升级版"},{"attrCode":"validity","attrValue":365},{"attrCode":"packageNum","attrValue":1000}]|
|**maxBuyNum**|Integer|最大购买数量|
|**minBuyNum**|Integer|最小购买数量|
|**skuSellingPrice**|Number|sku 售价|
|**skuExtraChargeList**|JdxSkuExtraChargeVo[]|额外计费项信息|
### JdxSkuExtraChargeVo
|名称|类型|描述|
|---|---|---|
|**extraChargeName**|String|额外计费项名称|
|**extraChargeUnit**|String|额外计费项单位|
|**sellingPrice**|Number|售价|
|**numType**|Integer|1、范围 2、枚举|
|**num**|String|1,100逗号分隔,numType=1表示可购买数量的范围,numType=2表示只支持购买特定数量|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**500**|Internal server error|
