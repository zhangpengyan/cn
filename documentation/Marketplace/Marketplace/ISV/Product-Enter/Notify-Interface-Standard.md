# 1简介
本文档描述了第三方应用接入到京东云市场需要实现的接口定义，当客户在京东云市场购买商品后， 京东云市场会将购买者购买商品的信息以及账号信息，通过调用本文档中提供的接口，发送给服务商。服务商即可获得商品订购、续费、过期、停用等信息。同时服务商根据该信息对购买者信息进行处理。文档 中涉及到的所有接口都以 HTTP GET 方式调用，消息传输以 JSON 格式。

# 2适用范围
软件类的应用，一般有独立可访问的网站地址，客户无需购买独立的云资源，可以通过互联网在网站进行注册、登录、操作功能等。 商品接入类型选择应用软件类：
![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A31.png)

# 3安全
   3.1 描述
    为保证京东云市场和第三方应用之间的通信安全，云市场每次调用应用接口时参数中会添加一个token作为安全令牌。应用接口收到请求后根据生成规则生成 token 值，并与接口参数中获取的 token 值进行比较，完全相同即为校验通过。token值由每次传递的参数和云市场为服务商分配的key共同构成。

   3.2 Key值获取
    在服务商管理后台（http://i-market.jdcloud.com/）信息管理>基本信息页面获取。
    ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A32.png)

   3.3 token值生成

   3.3.1 说明</br>
        token值作为云市场与服务商之间进行安全校验必有参数，云市场每次调用服务 商接口的参数中都会带有 token 值。服务商根据生成规则生成 token值，并与接口中获取的 token 值进行比较。完全相同即为校验通过。

   3.3.2生成规则</br>
        取每次http get 请求参数中除token以外的其它所有参数，对参数名进行字典排序，在排序后的字符串最后加上 &key=[isv的key值]，然后对整个字符串进行 md5 加密，加密后的字符串作为token值。

   3.3.3示例</br>
         1 服务商收到的请求示例：</br>
                  http://www.isvwebsite.com?p1=1&p2=2&p3=3&token=xxxx    </br>            
         2 进行排序操作：不用url encode</br>
                  sort（P1，P2，P3）； </br>               
         3 token值：拼接后字符串;</br>
                  “p1=1&p2=2&p3=3&key=isvkey”.toMD5()</br>
                  文档最后有实例代码</br>
                  测试key:</br>
                  qweqeqeqe123123123131</br>
                  测试参数：</br>
                  accountNum=1&action=createInstance&email=bujiaban@jd.com&expiredOn=2018-06-30 23:59:59&jdPin=bujiaban&mobile=&orderBizId=444181&orderId=556596&serviceCode=FW_GOODS-500232&skuId=FW_GOODS-500232-1&template=&token=9512df22a941f172a9f28068b758ee3e

# 4接口描述
   1   客户购买商品并付款成功，云市场将调用本接口通知服务商客户购买商品的信息和客户信息。

   2   服务商需要返回此订单对应的交付实例唯一 ID（instanceId）。建议此 ID 直接使用云市场传入 的 orderBizId。

   3   请不要阻塞此接口，若耗时较长(京东云市场端设置的超时时间为10s)，可使用队列做缓冲，设置 instanceId=0，然后立即返回。若操作失败也请设置 instanceId=0，云市场都会再次调用，直到获取到有效 instanceId。如果一直没有获取到有效 instanceId，云市场会持续调用到 200 次后停止调用，如服务商接口问题已解决，需要重新请求调用，请服务商登录服务商管理后台（http://i-market.jcloud.com/）--交易管理—订购记录查询页面中点击“重置实例”。 当instanceId=0或异常该接口可能会被多次调用，如果被重复调用，请保证接口的幂等性。

   注意： 按数量售卖的服务产生的订单，会根据购买数量多次调用接口，传参orderBizId会不同，每次调用处理请返回一个交付实例。
          服务商对外只提供一个接口，通过请求参数action的值区分，处理不同的业务逻辑。如action=createInstance，则代表新购。

4.1 新购商品

4.1.1描述

   1 用户下单并支付成功后，云市场调用新购服务接口，传入用户信息和订单信息。服务商按照传入的参数，在其系统中进行交付动作，并通过Json格式将实例信息返回给云市场。云市场接收到返回值后会保存信息并反馈给用户。接口调用流程如下图：
            ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A33.jpg)
        
   2 服务商返回值中需要包含此订单所创建实例的唯一 ID（instanceId）。 建议此 ID 直接使用云市场传入的 orderBizId。
         
   3 请不要阻塞此接口，若耗时较长，可使用队列做缓冲，设置 instanceId=0，然后立即返回。 若操作失败也请设置 instanceId=0，云市场都会再次调用，直到获取到 instanceId。

   4 该接口可能会被多次调用，如果被重复调用，请保证接口的幂等性

4.1.2请求参数
   <table class="tg">
   <thead>
   <tr>
   <th class="tg-0pky">参数名</th>
   <th class="tg-0pky">类型</th>
   <th class="tg-0pky">必选</th>
   <th class="tg-0pky">说明</th>
   <th class="tg-0pky"></th>
   </tr>
      </thead>
   <tbody>
   <tr>
   <td class="tg-0pky">token</td>
   <td class="tg-0pky">String</td>
   <td class="tg-0pky">是</td>
   <td class="tg-0pky">安全校验令牌</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">action</td>
   <td class="tg-0pky">String</td>
   <td class="tg-0pky">是</td>
   <td class="tg-0pky">“createInstance”</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">jdPin</td>
   <td class="tg-0pky">String</td>
   <td class="tg-0pky">是</td>
   <td class="tg-0pky">用户在京东云的账号标识，具有唯一性</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">orderBizId</td>
   <td class="tg-0pky">String</td>
   <td class="tg-0pky">是</td>
   <td class="tg-0pky">云市场业务 ID，订购关系ID</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">orderId</td>
   <td class="tg-0pky">String</td>
   <td class="tg-0pky">是</td>
   <td class="tg-0pky">对应订单的ID</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">serviceCode</td>
   <td class="tg-0pky">String</td>
   <td class="tg-0pky">是</td>
   <td class="tg-0pky">服务对应的编码，可在服务商后台的服务列表中查看到</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">skuId</td>
   <td class="tg-0pky">String</td>
   <td class="tg-0pky">是</td>
   <td class="tg-0pky">服务的收费项目ID；</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">mobile</td>
   <td class="tg-0pky">String</td>
   <td class="tg-0pky">否</td>
   <td class="tg-0pky">用户的手机号</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">email</td>
   <td class="tg-0pky">String</td>
   <td class="tg-0pky">否</td>
   <td class="tg-0pky">用户的邮箱</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">template</td>
   <td class="tg-0pky">String</td>
   <td class="tg-0pky">否</td>
   <td class="tg-0pky">模板ID，适用于模板类建站商品</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">expiredOn</td>
   <td class="tg-0pky">DateTime</td>
   <td class="tg-0pky">否</td>
   <td class="tg-0pky">对应订单的到期时间，格式：yyyy-MM-dd HH:mm:ss；</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">accountNum</td>
   <td class="tg-0pky">Integer</td>
   <td class="tg-0pky">否</td>
   <td class="tg-0pky">交付类型为软件类，计费方式为按周期的服务，交付时支持的账户数量。此参数默认值为1</td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky">extraInfo</td>
   <td class="tg-0pky">Json</td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky">Key</td>
   <td class="tg-0pky">说明</td>
   </tr>
   <tr>
   <td class="tg-0pky"></td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky">否</td>
   <td class="tg-0pky">specification</td>
   <td class="tg-0pky">产品规格,如10</td>
   </tr>
   <tr>
   <td class="tg-0pky"></td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky">否</td>
   <td class="tg-0pky">Key1</td>
   <td class="tg-0pky">Key1，如test</td>
   </tr>
   <tr>
   <td class="tg-0pky">additionInfo</td>
   <td class="tg-0pky">Json</td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky">Key</td>
   <td class="tg-0pky">说明</td>
   </tr>
   <tr>
   <td class="tg-0pky"></td>
   <td class="tg-0pky">额外计费项参数</td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky"></td>
   </tr>
   <tr>
   <td class="tg-0pky"></td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky">yangbenshu</td>
   <td class="tg-0pky">例如：样本数:100</td>
   </tr>
   <tr>
   <td class="tg-0pky"></td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky">diyu</td>
   <td class="tg-0pky">例如：地域：北京</td>
   </tr>
   <tr>
   <td class="tg-0pky">appCode</td>
   <td class="tg-0pky">应用编码</td>
   <td class="tg-0pky">否</td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky">ME+参数</td>
   </tr>
   <tr>
   <td class="tg-0pky">tenantCode</td>
   <td class="tg-0pky">企业编码</td>
   <td class="tg-0pky">否</td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky">ME+参数</td>
   </tr>
   <tr>
   <td class="tg-0pky">userCode</td>
   <td class="tg-0pky">用户编码</td>
   <td class="tg-0pky">否</td>
   <td class="tg-0pky"></td>
   <td class="tg-0pky">ME+参数</td>
   </tr>
   </tbody>
   </table>
         说明：extraInfo：Json格式 key-value动态字段，可扩展，用于用户下单后传递一些非通用的字段给服务提供商，比如某些产品的规格10G、100M；用户购买账号数：5；
         additionInfo：Json格式 key-value动态字段，可扩展，用于用户下单后传递一些非通用的计费字段给服务提供商，比如某些产品的样本数1个10元；北京地区5元。</br></br>

4.1.3返回参数
         ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A35.png)</br>
说明：appInfo 字段包含客户购买商品后，登录服务地址（网站地址）进行后续操作，或者实现客户免登陆访问（需要返回免登地址）所需的相关信息。
         Info 字段是当 appinfo 无法满足服务商特殊登录要求时，可以自定义 key-value 字段，以提供给客户新购商品后的操作方法。

4.1.4示例</br>
 请求：</br>
         http://www.isvwebsite.com?action=createInstance&email=&expiredOn=2017-01-08+00%3A00%3A00&jdPin=test_jdb22&mobile=&orderBizId=423499&orderId=519801&serviceCode=FW_GOODS-409717&skuId=FW_GOODS-409717-1&template=&token=7e8970385f7f263074a48852aeda12a5&extraInfo={"key1":"1","key1","2"}&additionInfo ={"key1":"1","key1","2"}</br>
返回：
         
```
         {

                "instanceId":   "1001",

                "appInfo": {

                "frontEndUrl":   "http://xxx.com/",

                "adminUrl":   "http://xxx.com/admin",

                "username":   "admin",

                "password":   "admin_password"

                …

         },

         "info": {

                "key1": "自定义信息"

                }

         }
```


4.2 续费：</br>
    
4.2.1描述</br>
用户续费并支付成功后，云市场调用续费接口，传入实例ID、新到期日。服务商将其系统中维护的到期日进行更新，并返回是否成功标识。云市场接收到返回值后，对服务实例做相应处理。接口调用流程如下图：
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A36.jpg)</br>

4.2.2请求参数</br>
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/通知接口7.png)

4.2.3返回参数</br>
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/通知接口8.png)</br>
        
4.2.4示例</br>
    1  请求</br>
        http://www.isvwebsite.com? action=renewInstance&expiredOn=2017-12-06+00%3A00%3A00&instanceId=1002&orderId=520801&token=475f28682b5d0d1af820ffd477c1188f</br></br>
    2  返回</br>
        `{‘success’:true’, ‘authCode:’123456789’, ‘message’:’renew suecess’}` 
    

4.3 免登

4.3.1描述</br>
     客户购买商品后，可通过免登接口登录到服务商系统。云市场会根据“新购商品”接口返回的 appInfo 中的 authUrl，结合下面参数组织一个用于免登的 url 地址，ISV 接到此url 的请求后，验证 token 是否合法，确认 timeStamp 是否符合 ISV 约束的时间，来进行 ISV 管理后的自动登录。</br>

4.3.2请求参数</br>
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E4%B8%BB%E5%8A%A8%E9%80%9A%E7%9F%A511.png)</br>

4.3.3示例</br>
    1  请求</br>
        http://www.isvwebsite.com?token=9560d4d52cab35689fd5d472f28119ab&action=verify&instanceId=1001&timeStamp=2016-12-01+10%3A30%3A01              </br>
    2  返回</br>
            登陆成功页面

4.4 升级

4.4.1描述</br>
        用户升级并支付成功后，云市场调用升级接口，传入实例ID、新版本。服务商将其系统中维护的版本进行更新，并返回是否成功标识。云市场接收到返回值后，对服务实例做相应处理。接口调用流程如下图：</br>
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A312.jpg)

4.4.2请求参数</br>
        <table class="tg">
          <thead>
          <tr>
            <th class="tg-0lax">参数名</th>
            <th class="tg-0lax">类型</th>
            <th class="tg-0lax">必选</th>
            <th class="tg-0lax">说明</th>
            <th class="tg-0lax"></th>
          </tr>
   </thead>
   <tbody>
          <tr>
            <td class="tg-0lax">token</td>
            <td class="tg-0lax">String</td>
            <td class="tg-0lax">是</td>
            <td class="tg-0lax">安全校验令牌</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">action</td>
            <td class="tg-0lax">String</td>
            <td class="tg-0lax">是</td>
            <td class="tg-0lax">“upgradeInstance”</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">orderId</td>
            <td class="tg-0lax">String</td>
            <td class="tg-0lax">是</td>
            <td class="tg-0lax">对应订单的ID</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">instanceId</td>
            <td class="tg-0lax">String</td>
            <td class="tg-0lax">是</td>
            <td class="tg-0lax">升级服务对应的实例ID</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">skuId</td>
            <td class="tg-0lax">String</td>
            <td class="tg-0lax">是</td>
            <td class="tg-0lax">服务的收费项目ID；</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">extraInfo</td>
            <td class="tg-0lax">Json</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">Key</td>
            <td class="tg-0lax">说明</td>
          </tr>
          <tr>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">否</td>
            <td class="tg-0lax">specification</td>
            <td class="tg-0lax">产品规格,如20</td>
          </tr>
          <tr>
            <td class="tg-0lax">additionInfo</td>
            <td class="tg-0lax">Json</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">额外计费项参数</td>
            <td class="tg-0lax">否</td>
            <td class="tg-0lax">Key</td>
            <td class="tg-0lax">说明</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">yangbenshu</td>
            <td class="tg-0lax">例如：样本数:100</td>
          </tr>
          <tr>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">diyu</td>
            <td class="tg-0lax">例如：地域：北京</td>
          </tr>
   </tbody>
        </table>
        说明：extraInfo：Json格式 key-value动态字段，用于用户下单后传递一些非通用的字段给服务提供商，比如某些产品的规格升级到20G；
        additionInfo：Json格式 key-value动态字段，可扩展，用于用户下单后传递一些非通用的计费字段给服务提供商，比如某些产品的样本数升级到1个15元；北京地区10元。

4.4.3返回参数</br>
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A314.png)

4.4.4示例</br>
     1  请求</br>
            http://www.isvwebsite.com?action=upgradeInstance&skuId=FW-123-1instanceId=1002&orderId=520801&token=475f28682b5d0d1af820ffd477c1188f&extraInfo={"key1":"1","key1","2"}&additionInfo ={"key1":"1","key1","2"} </br>
      2  返回</br>
     `{‘success’:true’, ‘authCode:’123456789’, ‘message’:’renew suecess’}`

4.5 扩容

4.5.1描述</br>
        用户扩容并支付成功后，（按周期账号数量售卖服务）云市场调用扩容接口，传入实例ID、新版本。服务商将其系统中维护的版本进行更新，并返回是否成功标识。云市场接收到返回值后，对服务实例做相应处理。接口调用流程如下图：
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A315.jpg)

4.5.2请求参数</br>
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A316.png)
        说明：extraInfo：Json格式 key-value动态字段，用于用户下单后传递一些非通用的字段给服务提供商，比如某些产品扩容的规格20G；用户扩容账号数：5；

4.5.3返回参数</br>
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A317.png)</br>

4.5.4示例</br>
    1  请求
```
            http://www.isvwebsite.com?action=dilateInstance&accountNum=1&instanceId=1002&orderId=520801&token=475f28682b5d0d1af820ffd477c1188f&extraInfo={"key1":"1","key1","2"}
```
</br>
   2  返回
            `{‘success’:true’, ‘authCode:’123456789’, ‘message’:’dilatesuccess’}`

4.6过期</br>
4.6.1描述
        云市场将在订购商品过期后调用该接口，服务商在该接口的实现中可以将指定的实例置为过期。接口调用流程如下图：
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A318.png)</br>
 
4.6.2请求参数
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A319.png)

4.6.3返回参数
        ![image](https://github.com/jdcloudcom/cn/blob/edit/documentation/Marketplace/Marketplace/MarketPlace-Image/%E9%80%9A%E7%9F%A5%E6%8E%A5%E5%8F%A320.png)

4.6.4示例</br>
    1 请求
            http://www.isvwebsite.com? action=   expiredInstance &instanceId=424499_520001_FW_GOODS-409717-1&token=cb0a8e6348de9d12e74a085a28bf00fe</br></br>
    2  返回
            `{‘success’: true,’message’:’ expiredInstance success’}`
            
# 5接口调试</br>
5.1 描述</br>
为了保证软件类服务自动开通功能接入的正确性，在服务商管理平台搭建了应用接入调试界面。服务商可以在此页面调试以上接口的正确性。</br>
 
 注：调试数据非正式数据，京东云市场不做业务处理。
 ```
    import java.io.UnsupportedEncodingException;
    import java.security.MessageDigest;
    import java.security.NoSuchAlgorithmException;

    public class Md5Util {

        private static String byteArrayToHexString(byte b[]) {
            StringBuffer resultSb = new StringBuffer();
            for (int i = 0; i < b.length; i++) {
                resultSb.append(byteToHexString(b[i]));
            }

            return resultSb.toString();
        }

        private static String byteToHexString(byte b) {
            int n = b;
            if (n < 0)
                n += 256;
            int d1 = n / 16;
            int d2 = n % 16;
            return hexDigits[d1] + hexDigits[d2];
        }

        /**
         * saas接口获取token方法
         *
         * @param origin
         * @return
         */
        public static String md5Encode(String origin) {
            try {
                MessageDigest md = MessageDigest.getInstance("MD5");
                return byteArrayToHexString(md.digest(origin.getBytes("utf-8")));
            } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            return null;

        }
        private static final String hexDigits[] = {"0", "1", "2", "3", "4", "5",
                "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};

      public static void main(String[] args) {
            String md2 = Md5Util.md5Encode("accountNum=1&action=createInstance&email=bujiaban@jd.com&expiredOn=2018-06-30  
```


