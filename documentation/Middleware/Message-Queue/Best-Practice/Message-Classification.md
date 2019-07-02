# 消息分类
Topic和Tag都可以用来进行消息区分，作为业务上消息的不同标识。

## 利用Topic进行消息分类

Topic：主题，一般对于不同业务的消息进行区分，具有消息隔离性，即订阅者如果只订阅了TopicA，那么它不会接收到TopicB的消息。

消息队列 JCQ允许生产者向不同Topic发送消息，消费者通过订阅不同Topic来消费Topic内的消息以达到消息分类的目的。

## 同一Topic下，利用Tag进行消息分类

Tag：标签，一般用于某个Topic下的消息进一步分类，同一Topic内的消息不具有消息隔离性，消费者只是对消息进行筛选，如果不设置标签，那么消费者可以获得Topic内的全量消息。

消息队列 JCQ允许对消息和消费者设置标签Tag来进行消息过滤，确保最终只消费到消息者想要获得的消息。

- 消息队列 JCQ 允许生产者在发送消息的时候，对消息设置Tag标签，带Tag标签的消息与无Tag标签的消息，被同等对待投递到JCQ消息系统中。

- 消费者在订阅Topic时，可以选择是否使用Tag过滤消息。如果带Tag订阅，则只能收到带同样Tag的消息，其余消息会被丢弃；否则，将会收到所有消息，


#### 消费一致

消息队列 JCQ中采取的Pub/Sub模式，消费者想要消费消息需要通过订阅的方式用ConsumerGroup去订阅某个Topic，而为了提升消费效率，ConsumerGroup下允许多个Consumer进行消费。由于模型关系，为了不丢失消息，需要ConsumerGroup下的所有Consumer设置的Tag保持一致，保证同一订阅下的同一ConsumerGroup中的不同Consumer消费的行为一致。

保持消费一致即：

- 同一ConsumerGroup下的所有Consumer设置的Tag一致

相关代码请前往[SDK参考](https://docs.jdcloud.com/cn/message-queue/produce-standard-message)。


## 选择Topic or Tag

为了消息分类，用户可以选择创建多个 Topic， 或者在同一个 Topic 下创建多个 Tag。 但可以从以下角度考虑：

1. 消息隔离：如果消息有数据隔离性的要求，则需要用Topic来区分，Tag无法做到完全的数据隔离。
2. 消息类型：如果需要发送的消息类型不同如普通消息和全局顺序消息，则消息需要用Topic来区分。
3. 消息体量：如果不同消息的体量差距较大，为了保证接收体量小的消息的时效性，建议用Topic来进行消息区分。
4. 业务关联：建议不同的业务消息用Topic来区分，同一业务下的不同类别用Tag来区分。





