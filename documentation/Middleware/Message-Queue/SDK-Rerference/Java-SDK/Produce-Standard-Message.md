# 生产普通（无序）消息
（说明：当topic类型选择无序消息时候，应用此producer来发送消息）

消息队列 JCQ SDK支持发送四种普通消息方式：同步发送单条消息、异步发送单条消息、同步发送批量消息（最多32条）、异步发送批量消息（最多32条）。 本文介绍了消息发送方式、可设置的参数、应用场景和特性，同时提供了代码示例以供参考。

## 不同的消息发送方式

| 消息发送方式     | TPS  | 吞吐量 |原理 |应用场景                                                     |
| ---------------- | ---- | ------ |---| ------------------------------------------------------------ |
| 同步发送单条消息 | 快   | 中等   | 同步发送是指消息发送方发出请求后，在收到接收方发回响应之后才发下一个请求的通讯方式。|同步发送主要应用在需要最快返回结果的业务中，例如充值结果或者短信邮件的发送结果反馈。 |
| 同步发送批量消息 | 中等 | 高     | 同步批量发送是指消息在同步发送的基础上批量发送，一次请求可以发送多条消息，相应的服务端返回响应的速率也会稍慢|                                                           |
| 异步发送单条消息 | 最快   | 较高   | 异步发送是指发送方发出请求后，不用等接收方发回响应（响应结果需要用户通过回调函数获取），接着发送下个请求的通讯方式。 |异步发送主要应用在对发送结果不敏感对响应时间敏感的业务，例如日志收集。 |
| 异步发送批量消息 | 较快 | 最高     | 异步批量发送是指在异步发送的基础上批量发送，接着发送下一个批量请求。|                                                         |


## 可配置的参数
| 参数                | 参数描述                                   |
| ------------------- | ------------------------------------------ |
| PROPERTY_TAGS       | 可以设置消息的标签（tag），暂时支持一条tag |
| PROPERTY_DELAY_TIME | 可以设置消息的延迟时间，范围为0-3600秒     |

## 代码示例
```Java
package com.jcloud.jcq.sdk.demo;

import com.jcloud.jcq.common.constants.MessageConstants;
import com.jcloud.jcq.protocol.Message;
import com.jcloud.jcq.sdk.JCQClientFactory;
import com.jcloud.jcq.sdk.auth.UserCredential;
import com.jcloud.jcq.sdk.producer.Producer;
import com.jcloud.jcq.sdk.producer.ProducerConfig;
import com.jcloud.jcq.sdk.producer.async.AsyncSendBatchCallback;
import com.jcloud.jcq.sdk.producer.async.AsyncSendCallback;
import com.jcloud.jcq.sdk.producer.model.SendBatchResult;
import com.jcloud.jcq.sdk.producer.model.SendResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * 普通消息生产者 demo.
 * @date 2018-05-17
 */
public class ProducerDemo {
    private static final Logger logger = LoggerFactory.getLogger(ProducerDemo.class);
    /**
     * 用户accessKey
     */
    private static final String ACCESS_KEY = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0";
    /**
     * 用户secretKey
     */
    private static final String SECRET_KEY = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB0";
    /**
     * 元数据服务器地址（接入点地址）
     */
    private static final String META_SERVER_ADDRESS = "192.168.166.57:18888";
    /**
     * topic名称
     */
    private static final String TOPIC = "testTopic";

    public static void main(String[] args) throws Exception {
        // 创建普通消息producer
        UserCredential userCredential = new UserCredential(ACCESS_KEY, SECRET_KEY);
        ProducerConfig producerConfig = ProducerConfig.builder()
                .metaServerAddress(META_SERVER_ADDRESS)
                .build();
        Producer producer = JCQClientFactory.getInstance().createProducer(userCredential, producerConfig);

        // 开启producer
        producer.start();

        // 创建message
        Message message = new Message();
        message.setTopic(TOPIC);
        message.setBody(("this is message boy").getBytes());
        Message message1 = new Message();
        message1.setTopic(TOPIC);
        message1.setBody(("this is message1 boy").getBytes());

        // 设置message tag属性, 如有需要
        message.getProperties().put(MessageConstants.PROPERTY_TAGS, "TAG");

        // 设置message 延迟投递属性(单位second)，如有需要
        message.getProperties().put(MessageConstants.PROPERTY_DELAY_TIME, "1000");

        // 同步发送单条消息
        SendResult sendResult = producer.sendMessage(message);
        logger.info("messageId:{}, resultCode:{}", sendResult.getMessageId(), sendResult.getResultCode());

        // 异步发送单条消息
        producer.sendMessageAsync(message, new AsyncSendCallback() {
            @Override
            public void onResult(SendResult sendResult) {
                logger.info("messageId:{}, resultCode:{}", sendResult.getMessageId(), sendResult.getResultCode());
            }

            @Override
            public void onException(Throwable throwable) {
                logger.info("exception:{}", throwable);
            }
        });

        // 同步发送批量消息, 一批最多32条消息
        List<Message> messages = new ArrayList<>();
        messages.add(message);
        messages.add(message1);
        SendBatchResult sendBatchResult = producer.sendBatchMessage(messages);
        logger.info("messageIds:{}, resultCode:{}", sendBatchResult.getMessageIds(), sendBatchResult.getResultCode());

        // 异步发送批量消息，一批最多32条消息
        producer.sendBatchMessageAsync(messages, new AsyncSendBatchCallback() {
            @Override
            public void onResult(SendBatchResult sendBatchResult) {
                logger.info("messageIds:{}, resultCode:{}", sendBatchResult.getMessageIds(), sendBatchResult.getResultCode());
            }

            @Override
            public void onException(Throwable throwable) {
                logger.info("exception:{}", throwable);
            }
        });
    }
}
```

