
DROP TABLE IF EXISTS `admin_settings`;

CREATE TABLE `admin_settings` (
  `uuid` varchar(31) NOT NULL,
  `json_value` text,
  `admin_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `alarm` */

DROP TABLE IF EXISTS `alarm`;

CREATE TABLE `alarm` (
  `uuid` varchar(31) NOT NULL,
  `ack_ts` bigint(20) DEFAULT NULL,
  `clear_ts` bigint(20) DEFAULT NULL,
  `additional_info` text,
  `end_ts` bigint(20) DEFAULT NULL,
  `originator_id` varchar(31) DEFAULT NULL,
  `originator_type` int(11) DEFAULT NULL,
  `propagate` tinyint(1) DEFAULT NULL,
  `severity` varchar(255) DEFAULT NULL,
  `start_ts` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `asset` */

DROP TABLE IF EXISTS `asset`;

CREATE TABLE `asset` (
  `uuid` varchar(31) NOT NULL,
  `additional_info` text,
  `customer_id` varchar(31) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `attribute_kv` */

DROP TABLE IF EXISTS `attribute_kv`;

CREATE TABLE `attribute_kv` (
  `entity_type` varchar(255) DEFAULT NULL,
  `entity_id` varchar(31) DEFAULT NULL,
  `attribute_type` varchar(255) DEFAULT NULL,
  `attribute_key` varchar(255) DEFAULT NULL,
  `bool_v` tinyint(1) DEFAULT NULL,
  `str_v` text,
  `long_v` bigint(20) DEFAULT NULL,
  `dbl_v` double DEFAULT NULL,
  `last_update_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `attribute_kv_unq_key` (`entity_type`,`entity_id`,`attribute_type`,`attribute_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `audit_log` */

DROP TABLE IF EXISTS `audit_log`;

CREATE TABLE `audit_log` (
  `uuid` varchar(31) NOT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `customer_id` varchar(31) DEFAULT NULL,
  `entity_id` varchar(31) DEFAULT NULL,
  `entity_type` varchar(255) DEFAULT NULL,
  `entity_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(31) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `action_type` varchar(255) DEFAULT NULL,
  `action_data` text,
  `action_status` varchar(255) DEFAULT NULL,
  `action_failure_details` text,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `component_descriptor` */

DROP TABLE IF EXISTS `component_descriptor`;

CREATE TABLE `component_descriptor` (
  `uuid` varchar(31) NOT NULL,
  `actions` varchar(255) DEFAULT NULL,
  `clazz` text,
  `configuration_descriptor` text,
  `name` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `config_map` */

DROP TABLE IF EXISTS `config_map`;

CREATE TABLE `config_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `instance_id` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_key` (`instance_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `uuid` varchar(31) NOT NULL,
  `additional_info` text,
  `address` text,
  `address2` text,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dashboard` */

DROP TABLE IF EXISTS `dashboard`;

CREATE TABLE `dashboard` (
  `uuid` varchar(31) NOT NULL,
  `configuration` text,
  `assigned_customers` text,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `device` */

DROP TABLE IF EXISTS `device`;

CREATE TABLE `device` (
  `uuid` varchar(31) NOT NULL,
  `additional_info` text,
  `customer_id` varchar(31) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `parent_id` varchar(31) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `is_actived` int(1) DEFAULT '0',
  `model_id` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `index_device_name` (`name`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `device_command_log` */

DROP TABLE IF EXISTS `device_command_log`;

CREATE TABLE `device_command_log` (
  `uuid` varchar(31) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '命令名称',
  `entity_id` varchar(31) DEFAULT NULL COMMENT '设备唯一标识',
  `entity_type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `input_data` text COMMENT '请求参数',
  `request_time` bigint(20) DEFAULT NULL COMMENT '请求时间',
  `output_data` text COMMENT '响应参数',
  `reported_time` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `command_id` varchar(31) DEFAULT NULL COMMENT '命令唯一标识',
  `message_id` varchar(40) DEFAULT NULL COMMENT '消息唯一标识',
  `result_code` varchar(255) DEFAULT NULL COMMENT '结果码',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `search_text` text,
  PRIMARY KEY (`uuid`),
  KEY `index_service_log` (`name`,`entity_id`,`command_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `device_credentials` */

DROP TABLE IF EXISTS `device_credentials`;

CREATE TABLE `device_credentials` (
  `uuid` varchar(31) NOT NULL,
  `credentials_id` text,
  `credentials_type` varchar(255) DEFAULT NULL,
  `credentials_value` text,
  `device_id` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `device_telemetry_data_t` */

DROP TABLE IF EXISTS `device_telemetry_data_t`;

CREATE TABLE `device_telemetry_data_t` (
  `uuid` varchar(31) NOT NULL,
  `json_value` text,
  `device_id` varchar(31) NOT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `customer_id` varchar(31) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `message_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `event` */

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `uuid` varchar(31) NOT NULL,
  `body` text,
  `entity_id` varchar(31) DEFAULT NULL,
  `entity_type` varchar(255) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `event_uid` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `event_unq_key` (`tenant_id`,`entity_type`,`entity_id`,`event_type`,`event_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `model` */

DROP TABLE IF EXISTS `model`;

CREATE TABLE `model` (
  `uuid` varchar(31) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '边缘计算唯一标识',
  `display_name` varchar(100) DEFAULT NULL COMMENT '设备唯一标识',
  `model_desc` varchar(255) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `index_model_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `model_attribute` */

DROP TABLE IF EXISTS `model_attribute`;

CREATE TABLE `model_attribute` (
  `uuid` varchar(31) NOT NULL,
  `attribute_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_update_ts` bigint(20) DEFAULT NULL,
  `model_id` varchar(31) DEFAULT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `writeable` int(1) DEFAULT '0',
  `sys_reserved` int(1) DEFAULT '0',
  `unit` varchar(40) DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  `attribute_min` varchar(255) DEFAULT NULL,
  `attribute_max` varchar(255) DEFAULT NULL,
  `step` varchar(255) DEFAULT NULL,
  `attribute_group` varchar(40) DEFAULT NULL,
  `enum_info` text,
  UNIQUE KEY `index_model_model_id_name` (`model_id`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `model_command` */

DROP TABLE IF EXISTS `model_command`;

CREATE TABLE `model_command` (
  `uuid` varchar(31) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '命令名称',
  `identifier` varchar(100) DEFAULT '1' COMMENT '命令唯一标识',
  `call_type` int(1) DEFAULT '1' COMMENT '调用类型，0为异步，1为同步',
  `command_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `entity_id` varchar(31) DEFAULT NULL COMMENT '设备唯一标识',
  `entity_type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `model_id` varchar(31) DEFAULT NULL COMMENT '物模型唯一标识',
  `method` varchar(255) DEFAULT NULL COMMENT '方法名称',
  `method_type` varchar(255) DEFAULT NULL COMMENT '协议类型',
  PRIMARY KEY (`uuid`),
  KEY `index_service` (`identifier`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `model_command_params` */

DROP TABLE IF EXISTS `model_command_params`;

CREATE TABLE `model_command_params` (
  `uuid` varchar(93) DEFAULT NULL,
  `params_type` varchar(765) DEFAULT NULL,
  `name` varchar(765) DEFAULT NULL,
  `last_update_ts` bigint(20) DEFAULT NULL,
  `command_id` varchar(93) DEFAULT NULL,
  `params_desc` varchar(765) DEFAULT NULL,
  `unit` varchar(120) DEFAULT NULL,
  `unit_name` varchar(765) DEFAULT NULL,
  `params_min` varchar(765) DEFAULT NULL,
  `params_max` varchar(765) DEFAULT NULL,
  `step` varchar(765) DEFAULT NULL,
  `params_group` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `model_event` */

DROP TABLE IF EXISTS `model_event`;

CREATE TABLE `model_event` (
  `uuid` varchar(31) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `type` int(1) DEFAULT '1' COMMENT ':0:Info, 1: altert, 2: error',
  `event_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `model_id` varchar(31) DEFAULT NULL COMMENT '模型唯一标识',
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `next_user` */

DROP TABLE IF EXISTS `next_user`;

CREATE TABLE `next_user` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL,
  `user_pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `relation` */

DROP TABLE IF EXISTS `relation`;

CREATE TABLE `relation` (
  `from_id` varchar(31) DEFAULT NULL,
  `from_type` varchar(255) DEFAULT NULL,
  `to_id` varchar(31) DEFAULT NULL,
  `to_type` varchar(255) DEFAULT NULL,
  `relation_type_group` varchar(255) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `additional_info` text,
  UNIQUE KEY `relation_unq_key` (`from_id`,`from_type`,`relation_type_group`,`relation_type`,`to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rule_chain` */

DROP TABLE IF EXISTS `rule_chain`;

CREATE TABLE `rule_chain` (
  `uuid` varchar(31) NOT NULL,
  `additional_info` text,
  `configuration` text,
  `name` varchar(255) DEFAULT NULL,
  `first_rule_node_id` varchar(31) DEFAULT NULL,
  `root` tinyint(1) DEFAULT NULL,
  `debug_mode` tinyint(1) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `chain_id` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'disable',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `unique_id` (`chain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rule_node` */

DROP TABLE IF EXISTS `rule_node`;

CREATE TABLE `rule_node` (
  `uuid` varchar(31) NOT NULL,
  `rule_chain_id` varchar(31) DEFAULT NULL,
  `additional_info` text,
  `configuration` text,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `debug_mode` tinyint(1) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `service_route` */

DROP TABLE IF EXISTS `service_route`;

CREATE TABLE `service_route` (
  `uuid` varchar(31) NOT NULL,
  `address` varchar(100) DEFAULT NULL COMMENT '路由地址',
  `is_enabled` int(1) DEFAULT '1' COMMENT '是否启用，1代表启用，0反之。',
  `route_desc` varchar(255) DEFAULT NULL COMMENT '服务路由描述',
  `entity_id` varchar(255) DEFAULT NULL COMMENT '设备ID',
  `entity_type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`uuid`),
  KEY `index_service_route` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `uuid` varchar(31) NOT NULL,
  `additional_info` text,
  `authority` varchar(255) DEFAULT NULL,
  `customer_id` varchar(31) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tenant` */

DROP TABLE IF EXISTS `tenant`;

CREATE TABLE `tenant` (
  `uuid` varchar(31) NOT NULL,
  `additional_info` text,
  `address` text,
  `address2` text,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ts_kv` */

DROP TABLE IF EXISTS `ts_kv`;

CREATE TABLE `ts_kv` (
  `entity_type` varchar(255) NOT NULL,
  `entity_id` varchar(31) NOT NULL COMMENT '设备唯一标识',
  `ts_kv_key` varchar(255) NOT NULL COMMENT '属性名称',
  `ts` bigint(20) NOT NULL COMMENT '更新时间',
  `bool_v` tinyint(1) DEFAULT NULL COMMENT '属性布尔值',
  `str_v` text COMMENT '属性字符串值',
  `long_v` bigint(20) DEFAULT NULL COMMENT '属性整型值',
  `dbl_v` double DEFAULT NULL COMMENT '属性小数值',
  UNIQUE KEY `ts_kv_unq_key` (`entity_type`,`entity_id`,`ts_kv_key`,`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ts_kv_latest` */

DROP TABLE IF EXISTS `ts_kv_latest`;

CREATE TABLE `ts_kv_latest` (
  `entity_type` varchar(255) NOT NULL,
  `entity_id` varchar(31) NOT NULL,
  `ts_kv_key` varchar(255) NOT NULL,
  `ts` bigint(20) NOT NULL,
  `bool_v` tinyint(1) DEFAULT NULL,
  `str_v` text,
  `long_v` bigint(20) DEFAULT NULL,
  `dbl_v` double DEFAULT NULL,
  UNIQUE KEY `ts_kv_latest_unq_key` (`entity_type`,`entity_id`,`ts_kv_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_credentials` */

DROP TABLE IF EXISTS `user_credentials`;

CREATE TABLE `user_credentials` (
  `uuid` varchar(31) NOT NULL,
  `activate_token` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `user_id` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `activate_token` (`activate_token`),
  UNIQUE KEY `reset_token` (`reset_token`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `widget_type` */

DROP TABLE IF EXISTS `widget_type`;

CREATE TABLE `widget_type` (
  `uuid` varchar(31) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `bundle_alias` varchar(255) DEFAULT NULL,
  `descriptor` text,
  `name` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `widgets_bundle` */

DROP TABLE IF EXISTS `widgets_bundle`;

CREATE TABLE `widgets_bundle` (
  `uuid` varchar(31) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*Data for the table `admin_settings` */

insert  into `admin_settings`(`uuid`,`json_value`,`admin_key`) values ('1e746126a2266e4a91992ebcb67fe33','{\n	\"baseUrl\": \"http://localhost:8080\"\n}','general'),('1e746126eaaefa6a91992ebcb67fe33','{\n	\"mailFrom\": \"jdcloud-iot <jdcloud-iot@jd.com>\",\n	\"smtpProtocol\": \"smtp\",\n	\"smtpHost\": \"localhost\",\n	\"smtpPort\": \"25\",\n	\"timeout\": \"10000\",\n	\"enableTls\": \"false\",\n	\"username\": \"\",\n	\"password\": \"\"\n}','mail');

/*Data for the table `asset` */

insert  into `asset`(`uuid`,`additional_info`,`customer_id`,`name`,`search_text`,`tenant_id`,`type`) values ('1e8ec9ad60e72f0b00f91d7f1a983d1',NULL,'1b21dd2138140008080808080808080','资产01','资产01','1e8cdf813e295009dbe4fab9d59c703','房地产');

/*Data for the table `component_descriptor` */

insert  into `component_descriptor`(`uuid`,`actions`,`clazz`,`configuration_descriptor`,`name`,`scope`,`search_text`,`type`) values ('1e959d78a08bd20b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.delay.TbMsgDelayNode','{\"nodeDefinition\":{\"details\":\"Delays messages for configurable period.\",\"description\":\"Delays incoming message\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"periodInSeconds\":60,\"maxPendingMsgs\":1000},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeMsgDelayConfig\",\"icon\":\"pause\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','delay','TENANT','delay','ACTION'),('1e959d78a530c90b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.rpc.TbSendRPCRequestNode','{\"nodeDefinition\":{\"details\":\"Expects messages with \\\"method\\\" and \\\"params\\\". Will forward response from device to next nodes.If the RPC call request is originated by REST API call from user, will forward the response to user immediately.\",\"description\":\"Sends RPC call to device\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"timeoutInSeconds\":60},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeRpcRequestConfig\",\"icon\":\"call_made\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','rpc call request','TENANT','rpc call request','ACTION'),('1e959d78a65f850b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.metadata.TbGetTenantAttributeNode','{\"nodeDefinition\":{\"details\":\"If Attributes enrichment configured, server scope attributes are added into Message metadata. If Latest Telemetry enrichment configured, latest telemetry added into metadata. To access those attributes in other nodes this template can be used <code>metadata.temperature</code>.\",\"description\":\"Add Originators Tenant Attributes or Latest Telemetry into Message Metadata\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"attrMapping\":{\"temperature\":\"tempo\"},\"telemetry\":false},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbEnrichmentNodeTenantAttributesConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','tenant attributes','TENANT','tenant attributes','ENRICHMENT'),('1e959d78a74ec70b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.filter.TbOriginatorTypeSwitchNode','{\"nodeDefinition\":{\"details\":\"Routes messages to chain according to the originator type (\'Device\', \'Asset\', etc.).\",\"description\":\"Route incoming messages by Message Originator Type\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Device\",\"Asset\",\"Tenant\",\"Customer\",\"User\",\"Dashboard\",\"Rule chain\",\"Rule node\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"version\":0},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbNodeEmptyConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','originator type switch','TENANT','originator type switch','FILTER'),('1e959d78a83e090b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.jd.jcq.TbJCQNode','{\"nodeDefinition\":{\"details\":\"Will publish message payload and metadata attributes to the JDCloud JCQ queue. Outbound message will contain response fields (<code>messageId</code>, <code>requestId</code>, <code>messageBodyMd5</code>, <code>messageAttributesMd5</code>, <code>sequenceNumber</code>) in the Message Metadata from the JDCloud JCQ. For example <b>requestId</b> field can be accessed with <code>metadata.requestId</code>.\",\"description\":\"Publish messages to the JDCloud JCQ\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"queueType\":\"STANDARD\",\"queueUrlPattern\":\"jcq-internet-05-manager-nlb-FI.jvessel-open-hb.jdcloud.com:2888\",\"delaySeconds\":0,\"messageAttributes\":{},\"accessKeyId\":null,\"secretAccessKey\":null,\"region\":\"us-east-1\",\"topic\":\"iot_order\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeSqsConfig\",\"icon\":\"\",\"iconUrl\":\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjQ4IiBoZWlnaHQ9IjQ4Ij48cGF0aCBkPSJNMTMuMjMgMTAuNTZWMTBjLTEuOTQgMC0zLjk5LjM5LTMuOTkgMi42NyAwIDEuMTYuNjEgMS45NSAxLjYzIDEuOTUuNzYgMCAxLjQzLS40NyAxLjg2LTEuMjIuNTItLjkzLjUtMS44LjUtMi44NG0yLjcgNi41M2MtLjE4LjE2LS40My4xNy0uNjMuMDYtLjg5LS43NC0xLjA1LTEuMDgtMS41NC0xLjc5LTEuNDcgMS41LTIuNTEgMS45NS00LjQyIDEuOTUtMi4yNSAwLTQuMDEtMS4zOS00LjAxLTQuMTcgMC0yLjE4IDEuMTctMy42NCAyLjg2LTQuMzggMS40Ni0uNjQgMy40OS0uNzYgNS4wNC0uOTNWNy41YzAtLjY2LjA1LTEuNDEtLjMzLTEuOTYtLjMyLS40OS0uOTUtLjctMS41LS43LTEuMDIgMC0xLjkzLjUzLTIuMTUgMS42MS0uMDUuMjQtLjI1LjQ4LS40Ny40OWwtMi42LS4yOGMtLjIyLS4wNS0uNDYtLjIyLS40LS41Ni42LTMuMTUgMy40NS00LjEgNi00LjEgMS4zIDAgMyAuMzUgNC4wMyAxLjMzQzE3LjExIDQuNTUgMTcgNi4xOCAxNyA3Ljk1djQuMTdjMCAxLjI1LjUgMS44MSAxIDIuNDguMTcuMjUuMjEuNTQgMCAuNzFsLTIuMDYgMS43OGgtLjAxIj48L3BhdGg+PHBhdGggZD0iTTIwLjE2IDE5LjU0QzE4IDIxLjE0IDE0LjgyIDIyIDEyLjEgMjJjLTMuODEgMC03LjI1LTEuNDEtOS44NS0zLjc2LS4yLS4xOC0uMDItLjQzLjI1LS4yOSAyLjc4IDEuNjMgNi4yNSAyLjYxIDkuODMgMi42MSAyLjQxIDAgNS4wNy0uNSA3LjUxLTEuNTMuMzctLjE2LjY2LjI0LjMyLjUxIj48L3BhdGg+PHBhdGggZD0iTTIxLjA3IDE4LjVjLS4yOC0uMzYtMS44NS0uMTctMi41Ny0uMDgtLjE5LjAyLS4yMi0uMTYtLjAzLS4zIDEuMjQtLjg4IDMuMjktLjYyIDMuNTMtLjMzLjI0LjMtLjA3IDIuMzUtMS4yNCAzLjMyLS4xOC4xNi0uMzUuMDctLjI2LS4xMS4yNi0uNjcuODUtMi4xNC41Ny0yLjV6Ij48L3BhdGg+PC9zdmc+\",\"docUrl\":\"\"}}','JDCloud JCQ','TENANT','jdcloud jcq','EXTERNAL'),('1e959d78a914e10b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.transform.TbTransformMsgNode','{\"nodeDefinition\":{\"details\":\"JavaScript function receive 3 input parameters <br/> <code>metadata</code> - is a Message metadata.<br/><code>msg</code> - is a Message payload.<br/><code>msgType</code> - is a Message type.<br/>Should return the following structure:<br/><code>{ msg: <i style=\\\"color: #666;\\\">new payload</i>,<br/>&nbsp&nbsp&nbspmetadata: <i style=\\\"color: #666;\\\">new metadata</i>,<br/>&nbsp&nbsp&nbspmsgType: <i style=\\\"color: #666;\\\">new msgType</i> }</code><br/>All fields in resulting object are optional and will be taken from original message if not specified.\",\"description\":\"Change Message payload, Metadata or Message type using JavaScript\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"jsScript\":\"return {msg: msg, metadata: metadata, msgType: msgType};\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbTransformationNodeScriptConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','script','TENANT','script','TRANSFORMATION'),('1e959d78aa26510b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.jd.es.TbESNode','{\"nodeDefinition\":{\"details\":\"Will publish message payload and metadata attributes to the JDCloud ElasticSearch. Outbound message will contain response fields (<code>messageId</code>, <code>requestId</code>, <code>messageBodyMd5</code>, <code>messageAttributesMd5</code>, <code>sequenceNumber</code>) in the Message Metadata from the JDCloud ElasticSearch. For example <b>requestId</b> field can be accessed with <code>metadata.requestId</code>.\",\"description\":\"Publish messages to the JDCloud ElasticSearch\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"queueType\":\"STANDARD\",\"queueUrlPattern\":\"这里请填写ES的内网接入点，不需要端口号\",\"delaySeconds\":0,\"messageAttributes\":{},\"accessKeyId\":\"这里要填写ES的Index\",\"secretAccessKey\":\"这里要填写ES的Type\",\"region\":\"无作用，不用填写\",\"topic\":\"无作用，不用填写\",\"esUrlPattern\":\"\",\"esIndex\":\"\",\"esType\":\"\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeSqsConfig\",\"icon\":\"\",\"iconUrl\":\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjQ4IiBoZWlnaHQ9IjQ4Ij48cGF0aCBkPSJNMTMuMjMgMTAuNTZWMTBjLTEuOTQgMC0zLjk5LjM5LTMuOTkgMi42NyAwIDEuMTYuNjEgMS45NSAxLjYzIDEuOTUuNzYgMCAxLjQzLS40NyAxLjg2LTEuMjIuNTItLjkzLjUtMS44LjUtMi44NG0yLjcgNi41M2MtLjE4LjE2LS40My4xNy0uNjMuMDYtLjg5LS43NC0xLjA1LTEuMDgtMS41NC0xLjc5LTEuNDcgMS41LTIuNTEgMS45NS00LjQyIDEuOTUtMi4yNSAwLTQuMDEtMS4zOS00LjAxLTQuMTcgMC0yLjE4IDEuMTctMy42NCAyLjg2LTQuMzggMS40Ni0uNjQgMy40OS0uNzYgNS4wNC0uOTNWNy41YzAtLjY2LjA1LTEuNDEtLjMzLTEuOTYtLjMyLS40OS0uOTUtLjctMS41LS43LTEuMDIgMC0xLjkzLjUzLTIuMTUgMS42MS0uMDUuMjQtLjI1LjQ4LS40Ny40OWwtMi42LS4yOGMtLjIyLS4wNS0uNDYtLjIyLS40LS41Ni42LTMuMTUgMy40NS00LjEgNi00LjEgMS4zIDAgMyAuMzUgNC4wMyAxLjMzQzE3LjExIDQuNTUgMTcgNi4xOCAxNyA3Ljk1djQuMTdjMCAxLjI1LjUgMS44MSAxIDIuNDguMTcuMjUuMjEuNTQgMCAuNzFsLTIuMDYgMS43OGgtLjAxIj48L3BhdGg+PHBhdGggZD0iTTIwLjE2IDE5LjU0QzE4IDIxLjE0IDE0LjgyIDIyIDEyLjEgMjJjLTMuODEgMC03LjI1LTEuNDEtOS44NS0zLjc2LS4yLS4xOC0uMDItLjQzLjI1LS4yOSAyLjc4IDEuNjMgNi4yNSAyLjYxIDkuODMgMi42MSAyLjQxIDAgNS4wNy0uNSA3LjUxLTEuNTMuMzctLjE2LjY2LjI0LjMyLjUxIj48L3BhdGg+PHBhdGggZD0iTTIxLjA3IDE4LjVjLS4yOC0uMzYtMS44NS0uMTctMi41Ny0uMDgtLjE5LjAyLS4yMi0uMTYtLjAzLS4zIDEuMjQtLjg4IDMuMjktLjYyIDMuNTMtLjMzLjI0LjMtLjA3IDIuMzUtMS4yNCAzLjMyLS4xOC4xNi0uMzUuMDctLjI2LS4xMS4yNi0uNjcuODUtMi4xNC41Ny0yLjV6Ij48L3BhdGg+PC9zdmc+\",\"docUrl\":\"\"}}','ElasticSearch','TENANT','elasticsearch','EXTERNAL'),('1e959d78ab26aa0b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.action.TbCreateAlarmNode','{\"nodeDefinition\":{\"details\":\"Details - JS function that creates JSON object based on incoming message. This object will be added into Alarm.details field.\\nNode output:\\nIf alarm was not created, original message is returned. Otherwise new Message returned with type \'ALARM\', Alarm object in \'msg\' property and \'matadata\' will contains one of those properties \'isNewAlarm/isExistingAlarm\'. Message payload can be accessed via <code>msg</code> property. For example <code>\'temperature = \' + msg.temperature ;</code>. Message metadata can be accessed via <code>metadata</code> property. For example <code>\'name = \' + metadata.customerName;</code>.\",\"description\":\"Create or Update Alarm\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Created\",\"Updated\",\"False\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"alarmType\":\"General Alarm\",\"alarmDetailsBuildJs\":\"var details = {};\\nif (metadata.prevAlarmDetails) {\\n    details = JSON.parse(metadata.prevAlarmDetails);\\n}\\nreturn details;\",\"severity\":\"CRITICAL\",\"propagate\":false},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeCreateAlarmConfig\",\"icon\":\"notifications_active\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','create alarm','TENANT','create alarm','ACTION'),('1e959d78ac41de0b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.debug.TbMsgGeneratorNode','{\"nodeDefinition\":{\"details\":\"Generates messages with configurable period. Javascript function used for message generation.\",\"description\":\"Periodically generates messages\",\"inEnabled\":false,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"msgCount\":0,\"periodInSeconds\":1,\"originatorId\":null,\"originatorType\":null,\"jsScript\":\"var msg = { temp: 42, humidity: 77 };\\nvar metadata = { data: 40 };\\nvar msgType = \\\"DebugMsg\\\";\\n\\nreturn { msg: msg, metadata: metadata, msgType: msgType };\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbActionNodeGeneratorConfig\",\"icon\":\"repeat\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','generator','TENANT','generator','ACTION'),('1e959d78af6edb0b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.action.TbLogNode','{\"nodeDefinition\":{\"details\":\"Transform incoming Message with configured JS function to String and log final value into Thingsboard log file. Message payload can be accessed via <code>msg</code> property. For example <code>\'temperature = \' + msg.temperature ;</code>. Message metadata can be accessed via <code>metadata</code> property. For example <code>\'name = \' + metadata.customerName;</code>.\",\"description\":\"Log incoming messages using JS script for transformation Message into String\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"jsScript\":\"return \'Incoming message:\\\\n\' + JSON.stringify(msg) + \'\\\\nIncoming metadata:\\\\n\' + JSON.stringify(metadata);\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeLogConfig\",\"icon\":\"menu\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','log','TENANT','log','ACTION'),('1e959d78b065700b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.filter.TbMsgTypeFilterNode','{\"nodeDefinition\":{\"details\":\"If incoming MessageType is expected - send Message via <b>True</b> chain, otherwise <b>False</b> chain is used.\",\"description\":\"Filter incoming messages by Message Type\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"True\",\"False\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"messageTypes\":[\"POST_ATTRIBUTES_REQUEST\",\"POST_TELEMETRY_REQUEST\",\"TO_SERVER_RPC_REQUEST\"]},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbFilterNodeMessageTypeConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','message type','TENANT','message type','FILTER'),('1e959d78b163580b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.action.TbClearAlarmNode','{\"nodeDefinition\":{\"details\":\"Details - JS function that creates JSON object based on incoming message. This object will be added into Alarm.details field.\\nNode output:\\nIf alarm was not cleared, original message is returned. Otherwise new Message returned with type \'ALARM\', Alarm object in \'msg\' property and \'matadata\' will contains \'isClearedAlarm\' property. Message payload can be accessed via <code>msg</code> property. For example <code>\'temperature = \' + msg.temperature ;</code>. Message metadata can be accessed via <code>metadata</code> property. For example <code>\'name = \' + metadata.customerName;</code>.\",\"description\":\"Clear Alarm\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Cleared\",\"False\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"alarmType\":\"General Alarm\",\"alarmDetailsBuildJs\":\"var details = {};\\nif (metadata.prevAlarmDetails) {\\n    details = JSON.parse(metadata.prevAlarmDetails);\\n}\\nreturn details;\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeClearAlarmConfig\",\"icon\":\"notifications_off\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','clear alarm','TENANT','clear alarm','ACTION'),('1e959d78b241830b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.rest.TbRestApiCallNode','{\"nodeDefinition\":{\"details\":\"Will invoke REST API call <code>GET | POST | PUT | DELETE</code> to external REST server. Message payload added into Request body. Configured attributes can be added into Headers from Message Metadata. Outbound message will contain response fields (<code>status</code>, <code>statusCode</code>, <code>statusReason</code> and response <code>headers</code>) in the Message Metadata. Response body saved in outbound Message payload. For example <b>statusCode</b> field can be accessed with <code>metadata.statusCode</code>.\",\"description\":\"Invoke REST API calls to external REST server\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"restEndpointUrlPattern\":\"http://localhost/api\",\"requestMethod\":\"POST\",\"headers\":{}},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeRestApiCallConfig\",\"icon\":\"\",\"iconUrl\":\"data:image/svg+xml;base64,PHN2ZyBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MTIgNTEyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbDpzcGFjZT0icHJlc2VydmUiIHZpZXdCb3g9IjAgMCA1MTIgNTEyIiB2ZXJzaW9uPSIxLjEiIHk9IjBweCIgeD0iMHB4Ij48ZyB0cmFuc2Zvcm09Im1hdHJpeCguOTQ5NzUgMCAwIC45NDk3NSAxNy4xMiAyNi40OTIpIj48cGF0aCBkPSJtMTY5LjExIDEwOC41NGMtOS45MDY2IDAuMDczNC0xOS4wMTQgNi41NzI0LTIyLjAxNCAxNi40NjlsLTY5Ljk5MyAyMzEuMDhjLTMuNjkwNCAxMi4xODEgMy4yODkyIDI1LjIyIDE1LjQ2OSAyOC45MSAyLjIyNTkgMC42NzQ4MSA0LjQ5NjkgMSA2LjcyODUgMSA5Ljk3MjEgMCAxOS4xNjUtNi41MTUzIDIyLjE4Mi0xNi40NjdhNi41MjI0IDYuNTIyNCAwIDAgMCAwLjAwMiAtMC4wMDJsNjkuOTktMjMxLjA3YTYuNTIyNCA2LjUyMjQgMCAwIDAgMCAtMC4wMDJjMy42ODU1LTEyLjE4MS0zLjI4Ny0yNS4yMjUtMTUuNDcxLTI4LjkxMi0yLjI4MjUtMC42OTE0NS00LjYxMTYtMS4wMTY5LTYuODk4NC0xem04NC45ODggMGMtOS45MDQ4IDAuMDczNC0xOS4wMTggNi41Njc1LTIyLjAxOCAxNi40NjlsLTY5Ljk4NiAyMzEuMDhjLTMuNjg5OCAxMi4xNzkgMy4yODUzIDI1LjIxNyAxNS40NjUgMjguOTA4IDIuMjI5NyAwLjY3NjQ3IDQuNTAwOCAxLjAwMiA2LjczMjQgMS4wMDIgOS45NzIxIDAgMTkuMTY1LTYuNTE1MyAyMi4xODItMTYuNDY3YTYuNTIyNCA2LjUyMjQgMCAwIDAgMC4wMDIgLTAuMDAybDY5Ljk4OC0yMzEuMDdjMy42OTA4LTEyLjE4MS0zLjI4NTItMjUuMjIzLTE1LjQ2Ny0yOC45MTItMi4yODE0LTAuNjkyMzEtNC42MTA4LTEuMDE4OS02Ljg5ODQtMS4wMDJ6bS0yMTcuMjkgNDIuMjNjLTEyLjcyOS0wLjAwMDg3LTIzLjE4OCAxMC40NTYtMjMuMTg4IDIzLjE4NiAwLjAwMSAxMi43MjggMTAuNDU5IDIzLjE4NiAyMy4xODggMjMuMTg2IDEyLjcyNy0wLjAwMSAyMy4xODMtMTAuNDU5IDIzLjE4NC0yMy4xODYgMC4wMDA4NzYtMTIuNzI4LTEwLjQ1Ni0yMy4xODUtMjMuMTg0LTIzLjE4NnptMCAxNDYuNjRjLTEyLjcyNy0wLjAwMDg3LTIzLjE4NiAxMC40NTUtMjMuMTg4IDIzLjE4NC0wLjAwMDg3MyAxMi43MjkgMTAuNDU4IDIzLjE4OCAyMy4xODggMjMuMTg4IDEyLjcyOC0wLjAwMSAyMy4xODQtMTAuNDYgMjMuMTg0LTIzLjE4OC0wLjAwMS0xMi43MjYtMTAuNDU3LTIzLjE4My0yMy4xODQtMjMuMTg0em0yNzAuNzkgNDIuMjExYy0xMi43MjcgMC0yMy4xODQgMTAuNDU3LTIzLjE4NCAyMy4xODRzMTAuNDU1IDIzLjE4OCAyMy4xODQgMjMuMTg4aDE1NC45OGMxMi43MjkgMCAyMy4xODYtMTAuNDYgMjMuMTg2LTIzLjE4OCAwLjAwMS0xMi43MjgtMTAuNDU4LTIzLjE4NC0yMy4xODYtMjMuMTg0eiIgdHJhbnNmb3JtPSJtYXRyaXgoMS4wMzc2IDAgMCAxLjAzNzYgLTcuNTY3NiAtMTQuOTI1KSIgc3Ryb2tlLXdpZHRoPSIxLjI2OTMiLz48L2c+PC9zdmc+\",\"docUrl\":\"\"}}','rest api call','TENANT','rest api call','EXTERNAL'),('1e959d78b38b1a0b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.transform.TbChangeOriginatorNode','{\"nodeDefinition\":{\"details\":\"Related Entity found using configured relation direction and Relation Type. If multiple Related Entities are found, only first Entity is used as new Originator, other entities are discarded. \",\"description\":\"Change Message Originator To Tenant/Customer/Related Entity\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"originatorSource\":\"CUSTOMER\",\"relationsQuery\":{\"direction\":\"FROM\",\"maxLevel\":1,\"filters\":[{\"relationType\":\"Contains\",\"entityTypes\":[]}]}},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbTransformationNodeChangeOriginatorConfig\",\"icon\":\"find_replace\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','change originator','TENANT','change originator','TRANSFORMATION'),('1e959d78b466d40b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.filter.TbJsFilterNode','{\"nodeDefinition\":{\"details\":\"Evaluate incoming Message with configured JS condition. If <b>True</b> - send Message via <b>True</b> chain, otherwise <b>False</b> chain is used.Message payload can be accessed via <code>msg</code> property. For example <code>msg.temperature < 10;</code><br/>Message metadata can be accessed via <code>metadata</code> property. For example <code>metadata.customerName === \'John\';</code><br/>Message type can be accessed via <code>msgType</code> property.\",\"description\":\"Filter incoming messages using JS script\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"True\",\"False\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"jsScript\":\"return msg.temperature > 20;\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbFilterNodeScriptConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','script','TENANT','script','FILTER'),('1e959d78b5401d0b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.telemetry.TbMsgAttributesNode','{\"nodeDefinition\":{\"details\":\"Saves entity attributes based on configurable scope parameter. Expects messages with \'POST_ATTRIBUTES_REQUEST\' message type\",\"description\":\"Saves attributes data\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"scope\":\"SERVER_SCOPE\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbActionNodeAttributesConfig\",\"icon\":\"file_upload\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','save attributes','TENANT','save attributes','ACTION'),('1e959d78b645580b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.filter.TbOriginatorTypeFilterNode','{\"nodeDefinition\":{\"details\":\"If Originator Type of incoming message is expected - send Message via <b>True</b> chain, otherwise <b>False</b> chain is used.\",\"description\":\"Filter incoming messages by message Originator Type\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"True\",\"False\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"originatorTypes\":[\"DEVICE\"]},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbFilterNodeOriginatorTypeConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','originator type','TENANT','originator type','FILTER'),('1e959d78b74f750b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.filter.TbJsSwitchNode','{\"nodeDefinition\":{\"details\":\"Node executes configured JS script. Script should return array of next Chain names where Message should be routed. If Array is empty - message not routed to next Node. Message payload can be accessed via <code>msg</code> property. For example <code>msg.temperature < 10;</code><br/>Message metadata can be accessed via <code>metadata</code> property. For example <code>metadata.customerName === \'John\';</code><br/>Message type can be accessed via <code>msgType</code> property.\",\"description\":\"Route incoming Message to one or multiple output chains\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Failure\"],\"customRelations\":true,\"defaultConfiguration\":{\"jsScript\":\"function nextRelation(metadata, msg) {\\n    return [\'one\',\'nine\'];\\n}\\nif(msgType === \'POST_TELEMETRY_REQUEST\') {\\n    return [\'two\'];\\n}\\nreturn nextRelation(metadata, msg);\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbFilterNodeSwitchConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','switch','TENANT','switch','FILTER'),('1e959d78b977370b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.aws.sqs.TbSqsNode','{\"nodeDefinition\":{\"details\":\"Will publish message payload and metadata attributes to the AWS SQS queue. Outbound message will contain response fields (<code>messageId</code>, <code>requestId</code>, <code>messageBodyMd5</code>, <code>messageAttributesMd5</code>, <code>sequenceNumber</code>) in the Message Metadata from the AWS SQS. For example <b>requestId</b> field can be accessed with <code>metadata.requestId</code>.\",\"description\":\"Publish messages to the AWS SQS\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"queueType\":\"STANDARD\",\"queueUrlPattern\":\"https://sqs.us-east-1.amazonaws.com/123456789012/my-queue-name\",\"delaySeconds\":0,\"messageAttributes\":{},\"accessKeyId\":null,\"secretAccessKey\":null,\"region\":\"us-east-1\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeSqsConfig\",\"icon\":\"\",\"iconUrl\":\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjQ4IiBoZWlnaHQ9IjQ4Ij48cGF0aCBkPSJNMTMuMjMgMTAuNTZWMTBjLTEuOTQgMC0zLjk5LjM5LTMuOTkgMi42NyAwIDEuMTYuNjEgMS45NSAxLjYzIDEuOTUuNzYgMCAxLjQzLS40NyAxLjg2LTEuMjIuNTItLjkzLjUtMS44LjUtMi44NG0yLjcgNi41M2MtLjE4LjE2LS40My4xNy0uNjMuMDYtLjg5LS43NC0xLjA1LTEuMDgtMS41NC0xLjc5LTEuNDcgMS41LTIuNTEgMS45NS00LjQyIDEuOTUtMi4yNSAwLTQuMDEtMS4zOS00LjAxLTQuMTcgMC0yLjE4IDEuMTctMy42NCAyLjg2LTQuMzggMS40Ni0uNjQgMy40OS0uNzYgNS4wNC0uOTNWNy41YzAtLjY2LjA1LTEuNDEtLjMzLTEuOTYtLjMyLS40OS0uOTUtLjctMS41LS43LTEuMDIgMC0xLjkzLjUzLTIuMTUgMS42MS0uMDUuMjQtLjI1LjQ4LS40Ny40OWwtMi42LS4yOGMtLjIyLS4wNS0uNDYtLjIyLS40LS41Ni42LTMuMTUgMy40NS00LjEgNi00LjEgMS4zIDAgMyAuMzUgNC4wMyAxLjMzQzE3LjExIDQuNTUgMTcgNi4xOCAxNyA3Ljk1djQuMTdjMCAxLjI1LjUgMS44MSAxIDIuNDguMTcuMjUuMjEuNTQgMCAuNzFsLTIuMDYgMS43OGgtLjAxIj48L3BhdGg+PHBhdGggZD0iTTIwLjE2IDE5LjU0QzE4IDIxLjE0IDE0LjgyIDIyIDEyLjEgMjJjLTMuODEgMC03LjI1LTEuNDEtOS44NS0zLjc2LS4yLS4xOC0uMDItLjQzLjI1LS4yOSAyLjc4IDEuNjMgNi4yNSAyLjYxIDkuODMgMi42MSAyLjQxIDAgNS4wNy0uNSA3LjUxLTEuNTMuMzctLjE2LjY2LjI0LjMyLjUxIj48L3BhdGg+PHBhdGggZD0iTTIxLjA3IDE4LjVjLS4yOC0uMzYtMS44NS0uMTctMi41Ny0uMDgtLjE5LjAyLS4yMi0uMTYtLjAzLS4zIDEuMjQtLjg4IDMuMjktLjYyIDMuNTMtLjMzLjI0LjMtLjA3IDIuMzUtMS4yNCAzLjMyLS4xOC4xNi0uMzUuMDctLjI2LS4xMS4yNi0uNjcuODUtMi4xNC41Ny0yLjV6Ij48L3BhdGg+PC9zdmc+\",\"docUrl\":\"\"}}','aws sqs test','TENANT','aws sqs test','EXTERNAL'),('1e959d78ba8ffa0b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.aws.sns.TbSnsNode','{\"nodeDefinition\":{\"details\":\"Will publish message payload to the AWS SNS topic. Outbound message will contain response fields (<code>messageId</code>, <code>requestId</code>) in the Message Metadata from the AWS SNS. For example <b>requestId</b> field can be accessed with <code>metadata.requestId</code>.\",\"description\":\"Publish message to the AWS SNS\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"topicArnPattern\":\"arn:aws:sns:us-east-1:123456789012:MyNewTopic\",\"accessKeyId\":null,\"secretAccessKey\":null,\"region\":\"us-east-1\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeSnsConfig\",\"icon\":\"\",\"iconUrl\":\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjQ4IiBoZWlnaHQ9IjQ4Ij48cGF0aCBkPSJNMTMuMjMgMTAuNTZWMTBjLTEuOTQgMC0zLjk5LjM5LTMuOTkgMi42NyAwIDEuMTYuNjEgMS45NSAxLjYzIDEuOTUuNzYgMCAxLjQzLS40NyAxLjg2LTEuMjIuNTItLjkzLjUtMS44LjUtMi44NG0yLjcgNi41M2MtLjE4LjE2LS40My4xNy0uNjMuMDYtLjg5LS43NC0xLjA1LTEuMDgtMS41NC0xLjc5LTEuNDcgMS41LTIuNTEgMS45NS00LjQyIDEuOTUtMi4yNSAwLTQuMDEtMS4zOS00LjAxLTQuMTcgMC0yLjE4IDEuMTctMy42NCAyLjg2LTQuMzggMS40Ni0uNjQgMy40OS0uNzYgNS4wNC0uOTNWNy41YzAtLjY2LjA1LTEuNDEtLjMzLTEuOTYtLjMyLS40OS0uOTUtLjctMS41LS43LTEuMDIgMC0xLjkzLjUzLTIuMTUgMS42MS0uMDUuMjQtLjI1LjQ4LS40Ny40OWwtMi42LS4yOGMtLjIyLS4wNS0uNDYtLjIyLS40LS41Ni42LTMuMTUgMy40NS00LjEgNi00LjEgMS4zIDAgMyAuMzUgNC4wMyAxLjMzQzE3LjExIDQuNTUgMTcgNi4xOCAxNyA3Ljk1djQuMTdjMCAxLjI1LjUgMS44MSAxIDIuNDguMTcuMjUuMjEuNTQgMCAuNzFsLTIuMDYgMS43OGgtLjAxIj48L3BhdGg+PHBhdGggZD0iTTIwLjE2IDE5LjU0QzE4IDIxLjE0IDE0LjgyIDIyIDEyLjEgMjJjLTMuODEgMC03LjI1LTEuNDEtOS44NS0zLjc2LS4yLS4xOC0uMDItLjQzLjI1LS4yOSAyLjc4IDEuNjMgNi4yNSAyLjYxIDkuODMgMi42MSAyLjQxIDAgNS4wNy0uNSA3LjUxLTEuNTMuMzctLjE2LjY2LjI0LjMyLjUxIj48L3BhdGg+PHBhdGggZD0iTTIxLjA3IDE4LjVjLS4yOC0uMzYtMS44NS0uMTctMi41Ny0uMDgtLjE5LjAyLS4yMi0uMTYtLjAzLS4zIDEuMjQtLjg4IDMuMjktLjYyIDMuNTMtLjMzLjI0LjMtLjA3IDIuMzUtMS4yNCAzLjMyLS4xOC4xNi0uMzUuMDctLjI2LS4xMS4yNi0uNjcuODUtMi4xNC41Ny0yLjV6Ij48L3BhdGg+PC9zdmc+\",\"docUrl\":\"\"}}','aws sns','TENANT','aws sns','EXTERNAL'),('1e959d78bb97a60b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.metadata.TbGetAttributesNode','{\"nodeDefinition\":{\"details\":\"If Attributes enrichment configured, <b>CLIENT/SHARED/SERVER</b> attributes are added into Message metadata with specific prefix: <i>cs/shared/ss</i>. Latest telemetry value added into metadata without prefix. To access those attributes in other nodes this template can be used <code>metadata.cs_temperature</code> or <code>metadata.shared_limit</code> \",\"description\":\"Add Message Originator Attributes or Latest Telemetry into Message Metadata\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"clientAttributeNames\":[],\"sharedAttributeNames\":[],\"serverAttributeNames\":[],\"latestTsKeyNames\":[]},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbEnrichmentNodeOriginatorAttributesConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','originator attributes','TENANT','originator attributes','ENRICHMENT'),('1e959d78bc70ef0b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.filter.TbCheckRelationNode','{\"nodeDefinition\":{\"details\":\"If relation exists - send Message via <b>True</b> chain, otherwise <b>False</b> chain is used.\",\"description\":\"Checks the relation from the selected entity to originator of the message by type and direction\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"True\",\"False\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"direction\":\"FROM\",\"entityId\":null,\"entityType\":null,\"relationType\":\"Contains\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbFilterNodeCheckRelationConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','check relation','TENANT','check relation','FILTER'),('1e959d78bda6fe0b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.kafka.TbKafkaNode','{\"nodeDefinition\":{\"details\":\"Will send record via Kafka producer to Kafka server. Outbound message will contain response fields (<code>offset</code>, <code>partition</code>, <code>topic</code>) from the Kafka in the Message Metadata. For example <b>partition</b> field can be accessed with <code>metadata.partition</code>.\",\"description\":\"Publish messages to Kafka server\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"topicPattern\":\"my-topic\",\"bootstrapServers\":\"localhost:9092\",\"retries\":0,\"batchSize\":16384,\"linger\":0,\"bufferMemory\":33554432,\"acks\":\"-1\",\"keySerializer\":\"org.apache.kafka.common.serialization.StringSerializer\",\"valueSerializer\":\"org.apache.kafka.common.serialization.StringSerializer\",\"otherProperties\":{}},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeKafkaConfig\",\"icon\":\"\",\"iconUrl\":\"data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTUzOCIgaGVpZ2h0PSIyNTAwIiB2aWV3Qm94PSIwIDAgMjU2IDQxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJ4TWlkWU1pZCI+PHBhdGggZD0iTTIwMS44MTYgMjMwLjIxNmMtMTYuMTg2IDAtMzAuNjk3IDcuMTcxLTQwLjYzNCAxOC40NjFsLTI1LjQ2My0xOC4wMjZjMi43MDMtNy40NDIgNC4yNTUtMTUuNDMzIDQuMjU1LTIzLjc5NyAwLTguMjE5LTEuNDk4LTE2LjA3Ni00LjExMi0yMy40MDhsMjUuNDA2LTE3LjgzNWM5LjkzNiAxMS4yMzMgMjQuNDA5IDE4LjM2NSA0MC41NDggMTguMzY1IDI5Ljg3NSAwIDU0LjE4NC0yNC4zMDUgNTQuMTg0LTU0LjE4NCAwLTI5Ljg3OS0yNC4zMDktNTQuMTg0LTU0LjE4NC01NC4xODQtMjkuODc1IDAtNTQuMTg0IDI0LjMwNS01NC4xODQgNTQuMTg0IDAgNS4zNDguODA4IDEwLjUwNSAyLjI1OCAxNS4zODlsLTI1LjQyMyAxNy44NDRjLTEwLjYyLTEzLjE3NS0yNS45MTEtMjIuMzc0LTQzLjMzMy0yNS4xODJ2LTMwLjY0YzI0LjU0NC01LjE1NSA0My4wMzctMjYuOTYyIDQzLjAzNy01My4wMTlDMTI0LjE3MSAyNC4zMDUgOTkuODYyIDAgNjkuOTg3IDAgNDAuMTEyIDAgMTUuODAzIDI0LjMwNSAxNS44MDMgNTQuMTg0YzAgMjUuNzA4IDE4LjAxNCA0Ny4yNDYgNDIuMDY3IDUyLjc2OXYzMS4wMzhDMjUuMDQ0IDE0My43NTMgMCAxNzIuNDAxIDAgMjA2Ljg1NGMwIDM0LjYyMSAyNS4yOTIgNjMuMzc0IDU4LjM1NSA2OC45NHYzMi43NzRjLTI0LjI5OSA1LjM0MS00Mi41NTIgMjcuMDExLTQyLjU1MiA1Mi44OTQgMCAyOS44NzkgMjQuMzA5IDU0LjE4NCA1NC4xODQgNTQuMTg0IDI5Ljg3NSAwIDU0LjE4NC0yNC4zMDUgNTQuMTg0LTU0LjE4NCAwLTI1Ljg4My0xOC4yNTMtNDcuNTUzLTQyLjU1Mi01Mi44OTR2LTMyLjc3NWE2OS45NjUgNjkuOTY1IDAgMCAwIDQyLjYtMjQuNzc2bDI1LjYzMyAxOC4xNDNjLTEuNDIzIDQuODQtMi4yMiA5Ljk0Ni0yLjIyIDE1LjI0IDAgMjkuODc5IDI0LjMwOSA1NC4xODQgNTQuMTg0IDU0LjE4NCAyOS44NzUgMCA1NC4xODQtMjQuMzA1IDU0LjE4NC01NC4xODQgMC0yOS44NzktMjQuMzA5LTU0LjE4NC01NC4xODQtNTQuMTg0em0wLTEyNi42OTVjMTQuNDg3IDAgMjYuMjcgMTEuNzg4IDI2LjI3IDI2LjI3MXMtMTEuNzgzIDI2LjI3LTI2LjI3IDI2LjI3LTI2LjI3LTExLjc4Ny0yNi4yNy0yNi4yN2MwLTE0LjQ4MyAxMS43ODMtMjYuMjcxIDI2LjI3LTI2LjI3MXptLTE1OC4xLTQ5LjMzN2MwLTE0LjQ4MyAxMS43ODQtMjYuMjcgMjYuMjcxLTI2LjI3czI2LjI3IDExLjc4NyAyNi4yNyAyNi4yN2MwIDE0LjQ4My0xMS43ODMgMjYuMjctMjYuMjcgMjYuMjdzLTI2LjI3MS0xMS43ODctMjYuMjcxLTI2LjI3em01Mi41NDEgMzA3LjI3OGMwIDE0LjQ4My0xMS43ODMgMjYuMjctMjYuMjcgMjYuMjdzLTI2LjI3MS0xMS43ODctMjYuMjcxLTI2LjI3YzAtMTQuNDgzIDExLjc4NC0yNi4yNyAyNi4yNzEtMjYuMjdzMjYuMjcgMTEuNzg3IDI2LjI3IDI2LjI3em0tMjYuMjcyLTExNy45N2MtMjAuMjA1IDAtMzYuNjQyLTE2LjQzNC0zNi42NDItMzYuNjM4IDAtMjAuMjA1IDE2LjQzNy0zNi42NDIgMzYuNjQyLTM2LjY0MiAyMC4yMDQgMCAzNi42NDEgMTYuNDM3IDM2LjY0MSAzNi42NDIgMCAyMC4yMDQtMTYuNDM3IDM2LjYzOC0zNi42NDEgMzYuNjM4em0xMzEuODMxIDY3LjE3OWMtMTQuNDg3IDAtMjYuMjctMTEuNzg4LTI2LjI3LTI2LjI3MXMxMS43ODMtMjYuMjcgMjYuMjctMjYuMjcgMjYuMjcgMTEuNzg3IDI2LjI3IDI2LjI3YzAgMTQuNDgzLTExLjc4MyAyNi4yNzEtMjYuMjcgMjYuMjcxeiIvPjwvc3ZnPg==\",\"docUrl\":\"\"}}','kafka','TENANT','kafka','EXTERNAL'),('1e959d78bebfc10b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.mail.TbSendEmailNode','{\"nodeDefinition\":{\"details\":\"Expects messages with <b>SEND_EMAIL</b> type. Node works only with messages that  where created using <code>to Email</code> transformation Node, please connect this Node with <code>to Email</code> Node using <code>Successful</code> chain.\",\"description\":\"Sends email message via SMTP server.\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"useSystemSmtpSettings\":true,\"smtpHost\":\"localhost\",\"smtpPort\":25,\"username\":null,\"password\":null,\"smtpProtocol\":\"smtp\",\"timeout\":10000,\"enableTls\":false},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeSendEmailConfig\",\"icon\":\"send\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','send email','TENANT','send email','EXTERNAL'),('1e959d78bfc28b0b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.metadata.TbGetDeviceAttrNode','{\"nodeDefinition\":{\"details\":\"If Attributes enrichment configured, <b>CLIENT/SHARED/SERVER</b> attributes are added into Message metadata with specific prefix: <i>cs/shared/ss</i>. Latest telemetry value added into metadata without prefix. To access those attributes in other nodes this template can be used <code>metadata.cs_temperature</code> or <code>metadata.shared_limit</code> \",\"description\":\"Add Originators Related Device Attributes and Latest Telemetry value into Message Metadata\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"clientAttributeNames\":[],\"sharedAttributeNames\":[],\"serverAttributeNames\":[],\"latestTsKeyNames\":[],\"deviceRelationsQuery\":{\"direction\":\"FROM\",\"maxLevel\":1,\"relationType\":\"Contains\",\"deviceTypes\":[\"default\"]}},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbEnrichmentNodeDeviceAttributesConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','device attributes','TENANT','device attributes','ENRICHMENT'),('1e959d78c11d390b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.metadata.TbGetCustomerAttributeNode','{\"nodeDefinition\":{\"details\":\"If Attributes enrichment configured, server scope attributes are added into Message metadata. If Latest Telemetry enrichment configured, latest telemetry added into metadata. To access those attributes in other nodes this template can be used <code>metadata.temperature</code>.\",\"description\":\"Add Originators Customer Attributes or Latest Telemetry into Message Metadata\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"attrMapping\":{\"temperature\":\"tempo\"},\"telemetry\":false},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbEnrichmentNodeCustomerAttributesConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','customer attributes','TENANT','customer attributes','ENRICHMENT'),('1e959d78c227560b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.rabbitmq.TbRabbitMqNode','{\"nodeDefinition\":{\"details\":\"Will publish message payload to RabbitMQ queue.\",\"description\":\"Publish messages to the RabbitMQ\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"exchangeNamePattern\":\"\",\"routingKeyPattern\":\"\",\"messageProperties\":null,\"host\":\"localhost\",\"port\":5672,\"virtualHost\":\"/\",\"username\":\"guest\",\"password\":\"guest\",\"automaticRecoveryEnabled\":false,\"connectionTimeout\":60000,\"handshakeTimeout\":10000,\"clientProperties\":{}},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeRabbitMqConfig\",\"icon\":\"\",\"iconUrl\":\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbDpzcGFjZT0icHJlc2VydmUiIHZlcnNpb249IjEuMSIgeT0iMHB4IiB4PSIwcHgiIHZpZXdCb3g9IjAgMCAxMDAwIDEwMDAiPjxwYXRoIHN0cm9rZS13aWR0aD0iLjg0OTU2IiBkPSJtODYwLjQ3IDQxNi4zMmgtMjYyLjAxYy0xMi45MTMgMC0yMy42MTgtMTAuNzA0LTIzLjYxOC0yMy42MTh2LTI3Mi43MWMwLTIwLjMwNS0xNi4yMjctMzYuMjc2LTM2LjI3Ni0zNi4yNzZoLTkzLjc5MmMtMjAuMzA1IDAtMzYuMjc2IDE2LjIyNy0zNi4yNzYgMzYuMjc2djI3MC44NGMtMC4yNTQ4NyAxNC4xMDMtMTEuNDY5IDI1LjU3Mi0yNS43NDIgMjUuNTcybC04NS42MzYgMC42Nzk2NWMtMTQuMTAzIDAtMjUuNTcyLTExLjQ2OS0yNS41NzItMjUuNTcybDAuNjc5NjUtMjcxLjUyYzAtMjAuMzA1LTE2LjIyNy0zNi4yNzYtMzYuMjc2LTM2LjI3NmgtOTMuNTM3Yy0yMC4zMDUgMC0zNi4yNzYgMTYuMjI3LTM2LjI3NiAzNi4yNzZ2NzYzLjg0YzAgMTguMDk2IDE0Ljc4MiAzMi40NTMgMzIuNDUzIDMyLjQ1M2g3MjIuODFjMTguMDk2IDAgMzIuNDUzLTE0Ljc4MiAzMi40NTMtMzIuNDUzdi00MzUuMzFjLTEuMTg5NC0xOC4xODEtMTUuMjkyLTMyLjE5OC0zMy4zODgtMzIuMTk4em0tMTIyLjY4IDI4Ny4wN2MwIDIzLjYxOC0xOC44NiA0Mi40NzgtNDIuNDc4IDQyLjQ3OGgtNzMuOTk3Yy0yMy42MTggMC00Mi40NzgtMTguODYtNDIuNDc4LTQyLjQ3OHYtNzQuMjUyYzAtMjMuNjE4IDE4Ljg2LTQyLjQ3OCA0Mi40NzgtNDIuNDc4aDczLjk5N2MyMy42MTggMCA0Mi40NzggMTguODYgNDIuNDc4IDQyLjQ3OHoiLz48L3N2Zz4=\",\"docUrl\":\"\"}}','rabbitmq','TENANT','rabbitmq','EXTERNAL'),('1e959d78c333e40b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.metadata.TbGetOriginatorFieldsNode','{\"nodeDefinition\":{\"details\":\"Will fetch fields values specified in mapping. If specified field is not part of originator fields it will be ignored.\",\"description\":\"Add Message Originator fields values into Message Metadata\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"fieldsMapping\":{\"name\":\"originatorName\",\"type\":\"originatorType\"}},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbEnrichmentNodeOriginatorFieldsConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','originator fields','TENANT','originator fields','ENRICHMENT'),('1e959d78c428080b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.rpc.TbSendRPCReplyNode','{\"nodeDefinition\":{\"details\":\"Expects messages with any message type. Will forward message body to the device.\",\"description\":\"Sends reply to RPC call from device\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"requestIdMetaDataAttribute\":\"requestId\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeRpcReplyConfig\",\"icon\":\"call_merge\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','rpc call reply','TENANT','rpc call reply','ACTION'),('1e959d78c51c2c0b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.metadata.TbGetRelatedAttributeNode','{\"nodeDefinition\":{\"details\":\"Related Entity found using configured relation direction and Relation Type. If multiple Related Entities are found, only first Entity is used for attributes enrichment, other entities are discarded. If Attributes enrichment configured, server scope attributes are added into Message metadata. If Latest Telemetry enrichment configured, latest telemetry added into metadata. To access those attributes in other nodes this template can be used <code>metadata.temperature</code>.\",\"description\":\"Add Originators Related Entity Attributes or Latest Telemetry into Message Metadata\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"attrMapping\":{\"temperature\":\"tempo\"},\"relationsQuery\":{\"direction\":\"FROM\",\"maxLevel\":1,\"filters\":[{\"relationType\":\"Contains\",\"entityTypes\":[]}]},\"telemetry\":false},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbEnrichmentNodeRelatedAttributesConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','related attributes','TENANT','related attributes','ENRICHMENT'),('1e959d78c63c420b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.telemetry.TbMsgTimeseriesNode','{\"nodeDefinition\":{\"details\":\"Saves timeseries telemetry data based on configurable TTL parameter. Expects messages with \'POST_TELEMETRY_REQUEST\' message type\",\"description\":\"Saves timeseries data\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"defaultTTL\":0},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbActionNodeTimeseriesConfig\",\"icon\":\"file_upload\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','save timeseries','TENANT','save timeseries','ACTION'),('1e959d78c75c580b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.filter.TbMsgTypeSwitchNode','{\"nodeDefinition\":{\"details\":\"Sends messages with message types <b>\\\"Post attributes\\\", \\\"Post telemetry\\\", \\\"RPC Request\\\"</b> etc. via corresponding chain, otherwise <b>Other</b> chain is used.\",\"description\":\"Route incoming messages by Message Type\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Post attributes\",\"Post telemetry\",\"RPC Request from Device\",\"RPC Request to Device\",\"Activity Event\",\"Inactivity Event\",\"Connect Event\",\"Disconnect Event\",\"Entity Created\",\"Entity Updated\",\"Entity Deleted\",\"Entity Assigned\",\"Entity Unassigned\",\"Attributes Updated\",\"Attributes Deleted\",\"Other\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"version\":0},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbNodeEmptyConfig\",\"icon\":\"\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','message type switch','TENANT','message type switch','FILTER'),('1e959d78c888a30b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.mail.TbMsgToEmailNode','{\"nodeDefinition\":{\"details\":\"Transforms message to email message by populating email fields using values derived from message metadata. Set \'SEND_EMAIL\' output message type.\",\"description\":\"Transforms message to email message\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"fromTemplate\":\"info@testmail.org\",\"toTemplate\":\"${userEmail}\",\"ccTemplate\":null,\"bccTemplate\":null,\"subjectTemplate\":\"Device ${deviceType} temperature high\",\"bodyTemplate\":\"Device ${deviceName} has high temperature ${temp}\"},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbTransformationNodeToEmailConfig\",\"icon\":\"email\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','to email','TENANT','to email','TRANSFORMATION'),('1e959d78ca1b780b9a14ffe2de96b68',NULL,'com.jdcloud.iothub.rule.engine.mqtt.TbMqttNode','{\"nodeDefinition\":{\"details\":\"Will publish message payload to the MQTT broker with QoS <b>AT_LEAST_ONCE</b>.\",\"description\":\"Publish messages to the MQTT broker\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"topicPattern\":\"my-topic\",\"host\":\"127.0.0.1\",\"port\":1883,\"connectTimeoutSec\":10,\"clientId\":null,\"cleanSession\":true,\"ssl\":false,\"credentials\":{\"type\":\"anonymous\"}},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\",\"static/rulenode/rulenode-core-config.css\"],\"configDirective\":\"tbActionNodeMqttConfig\",\"icon\":\"call_split\",\"iconUrl\":\"\",\"docUrl\":\"\"}}','mqtt','TENANT','mqtt','EXTERNAL'),('1e95f230342bbf0926177b2231aa0a3',NULL,'com.jdcloud.iothub.rule.engine.jd.topic.TbTopicNode','{\"nodeDefinition\":{\"details\":\"Will publish message payload and metadata attributes to the JDCloud Topic queue. Outbound message will contain response fields (<code>messageId</code>, <code>requestId</code>, <code>messageBodyMd5</code>, <code>messageAttributesMd5</code>, <code>sequenceNumber</code>) in the Message Metadata from the JDCloud Topic. For example <b>requestId</b> field can be accessed with <code>metadata.requestId</code>.\",\"description\":\"Publish messages to the JDCloud Topic\",\"inEnabled\":true,\"outEnabled\":true,\"relationTypes\":[\"Success\",\"Failure\"],\"customRelations\":false,\"defaultConfiguration\":{\"topicPattern\":\"deviceIdStr\",\"deviceName\":null,\"deviceIdStr\":null,\"timeoutInSeconds\":60},\"uiResources\":[\"static/rulenode/rulenode-core-config.js\"],\"configDirective\":\"tbActionNodeSqsConfig\",\"icon\":\"\",\"iconUrl\":\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjQ4IiBoZWlnaHQ9IjQ4Ij48cGF0aCBkPSJNMTMuMjMgMTAuNTZWMTBjLTEuOTQgMC0zLjk5LjM5LTMuOTkgMi42NyAwIDEuMTYuNjEgMS45NSAxLjYzIDEuOTUuNzYgMCAxLjQzLS40NyAxLjg2LTEuMjIuNTItLjkzLjUtMS44LjUtMi44NG0yLjcgNi41M2MtLjE4LjE2LS40My4xNy0uNjMuMDYtLjg5LS43NC0xLjA1LTEuMDgtMS41NC0xLjc5LTEuNDcgMS41LTIuNTEgMS45NS00LjQyIDEuOTUtMi4yNSAwLTQuMDEtMS4zOS00LjAxLTQuMTcgMC0yLjE4IDEuMTctMy42NCAyLjg2LTQuMzggMS40Ni0uNjQgMy40OS0uNzYgNS4wNC0uOTNWNy41YzAtLjY2LjA1LTEuNDEtLjMzLTEuOTYtLjMyLS40OS0uOTUtLjctMS41LS43LTEuMDIgMC0xLjkzLjUzLTIuMTUgMS42MS0uMDUuMjQtLjI1LjQ4LS40Ny40OWwtMi42LS4yOGMtLjIyLS4wNS0uNDYtLjIyLS40LS41Ni42LTMuMTUgMy40NS00LjEgNi00LjEgMS4zIDAgMyAuMzUgNC4wMyAxLjMzQzE3LjExIDQuNTUgMTcgNi4xOCAxNyA3Ljk1djQuMTdjMCAxLjI1LjUgMS44MSAxIDIuNDguMTcuMjUuMjEuNTQgMCAuNzFsLTIuMDYgMS43OGgtLjAxIj48L3BhdGg+PHBhdGggZD0iTTIwLjE2IDE5LjU0QzE4IDIxLjE0IDE0LjgyIDIyIDEyLjEgMjJjLTMuODEgMC03LjI1LTEuNDEtOS44NS0zLjc2LS4yLS4xOC0uMDItLjQzLjI1LS4yOSAyLjc4IDEuNjMgNi4yNSAyLjYxIDkuODMgMi42MSAyLjQxIDAgNS4wNy0uNSA3LjUxLTEuNTMuMzctLjE2LjY2LjI0LjMyLjUxIj48L3BhdGg+PHBhdGggZD0iTTIxLjA3IDE4LjVjLS4yOC0uMzYtMS44NS0uMTctMi41Ny0uMDgtLjE5LjAyLS4yMi0uMTYtLjAzLS4zIDEuMjQtLjg4IDMuMjktLjYyIDMuNTMtLjMzLjI0LjMtLjA3IDIuMzUtMS4yNCAzLjMyLS4xOC4xNi0uMzUuMDctLjI2LS4xMS4yNi0uNjcuODUtMi4xNC41Ny0yLjV6Ij48L3BhdGg+PC9zdmc+\",\"docUrl\":\"\"}}','JDCloud Topic','TENANT','jdcloud topic','EXTERNAL');

/*Data for the table `customer` */

insert  into `customer`(`uuid`,`additional_info`,`address`,`address2`,`city`,`country`,`email`,`phone`,`search_text`,`state`,`tenant_id`,`title`,`zip`) values ('1e8fe9ff48210e086853378dddc4345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,'1e8cdf813e295009dbe4fab9d59c703','123',NULL),('1e8fea0f2fbc99086853378dddc4345',NULL,NULL,NULL,NULL,NULL,'rpc@163.com',NULL,'rpc',NULL,'1e8cdf813e295009dbe4fab9d59c703','rpc',NULL);

/*Data for the table `dashboard` */

insert  into `dashboard`(`uuid`,`configuration`,`assigned_customers`,`search_text`,`tenant_id`,`title`) values ('1e9073f17de00b0a6016593e7a6ad37',NULL,NULL,'123','1e8cdf813e295009dbe4fab9d59c703','123');


/*Data for the table `tb_user` */

insert  into `tb_user`(`uuid`,`additional_info`,`authority`,`customer_id`,`email`,`first_name`,`last_name`,`search_text`,`tenant_id`) values ('1e746125a797660a91992ebcb67fe33',NULL,'SYS_ADMIN','1b21dd2138140008080808080808080','iot@jd.com',NULL,NULL,'iot@jd.com','1b21dd2138140008080808080808080'),('1e8d817afba26e0a1fdb7256a90324f',NULL,'TENANT_ADMIN','1b21dd2138140008080808080801111','jd_iot01@jd.com','admin','admin','jd_iot01@jd.com','1e8cdf813e295009dbe4fab9d59c703'),('1e8fea11e1b857086853378dddc4345',NULL,'CUSTOMER_USER','1e8fea0f2fbc99086853378dddc4345','rpc1@163.com',NULL,NULL,'rpc1@163.com','1e8cdf813e295009dbe4fab9d59c703');

/*Data for the table `tenant` */

insert  into `tenant`(`uuid`,`additional_info`,`address`,`address2`,`city`,`country`,`email`,`phone`,`region`,`search_text`,`state`,`title`,`zip`) values ('1e8cdf813e295009dbe4fab9d59c703','{\"description\":\"admin\"}','北京市朝阳区北辰西路8号2号北辰世纪中心A座5层',NULL,'北京','China','jd_iot01@jd.com',NULL,'Global','admin','北京','admin','100010');

/*Data for the table `user_credentials` */

insert  into `user_credentials`(`uuid`,`activate_token`,`enabled`,`password`,`reset_token`,`user_id`) values ('1e7461261441950a91992ebcb67fe33',NULL,1,'$2a$10$lBXrxIJfclLrs6Xwzgud/eU0Ost5EmB1HG9s5zm.CoFqsMF2jg/by',NULL,'1e746125a797660a91992ebcb67fe33'),('1e8d817afbdd060a1fdb7256a90324f',NULL,1,'$2a$10$ovPrgLQBl/T4sygtyDSCe.AlBJLUUBnM65rv4PAKRHZ8jZtKJMsPa',NULL,'1e8d817afba26e0a1fdb7256a90324f'),('1e8fea11f2ef14086853378dddc4345',NULL,1,'$2a$10$BzCfZ5cGZlMJa5MwAMbcreOHolbYFPC5HuGragd1R2Neq484O2hka',NULL,'1e8fea11e1b857086853378dddc4345');


/*Data for the table `rule_chain` */

/*Data for the table `relation` */

insert  into `relation`(`from_id`,`from_type`,`to_id`,`to_type`,`relation_type_group`,`relation_type`,`additional_info`) values ('1e8cdf813e295009dbe4fab9d59c703','TENANT','1e8cdf81407a9309dbe4fab9d59c703','RULE_CHAIN','RULE_CHAIN','Contains',NULL),('1e8f15a22e517f0aa974d5cac0c0c10','RULE_CHAIN','1e8f15a86e64a30aa974d5cac0c0c10','RULE_NODE','RULE_CHAIN','Contains',NULL),('1e8f15a22e517f0aa974d5cac0c0c10','RULE_CHAIN','1e8f15a872cc910aa974d5cac0c0c10','RULE_NODE','RULE_CHAIN','Contains',NULL),('1e8f15a22e517f0aa974d5cac0c0c10','RULE_CHAIN','1e8f15a55e10100aa974d5cac0c0c10','RULE_NODE','RULE_CHAIN','Contains',NULL),('1e8f15a55e10100aa974d5cac0c0c10','RULE_NODE','1e8f15a86e64a30aa974d5cac0c0c10','RULE_NODE','RULE_NODE','Post telemetry',NULL),('1e8f15a55e10100aa974d5cac0c0c10','RULE_NODE','1e8f15a872cc910aa974d5cac0c0c10','RULE_NODE','RULE_NODE','Post telemetry',NULL),('1e8f15a55e10100aa974d5cac0c0c10','RULE_NODE','1e8f15a872cc910aa974d5cac0c0c10','RULE_NODE','RULE_NODE','Other',NULL),('1e9040990fb8410b3afc9079dd98e22','DEVICE','1e926bcab9693708a1c03ab83aa6b73','DEVICE','COMMON','Created',NULL),('1e938e56421972083cac53ef61e68eb','RULE_CHAIN','1e938e5b4f2ad6083cac53ef61e68eb','RULE_NODE','RULE_CHAIN','Contains',NULL),('1e8cdf81407a9309dbe4fab9d59c703','RULE_CHAIN','1e9696a40f2bad0a6a041a6fe650eef','RULE_NODE','RULE_CHAIN','Contains',NULL),('1e8cdf81407a9309dbe4fab9d59c703','RULE_CHAIN','1e8cdf85d9b91609dbe4fab9d59c703','RULE_NODE','RULE_CHAIN','Contains',NULL),('1e8cdf85d9b91609dbe4fab9d59c703','RULE_NODE','1e9696a40f2bad0a6a041a6fe650eef','RULE_NODE','RULE_NODE','RPC Request to Device',NULL);
insert  into `rule_chain`(`uuid`,`additional_info`,`configuration`,`name`,`first_rule_node_id`,`root`,`debug_mode`,`search_text`,`tenant_id`,`chain_id`,`status`) values ('1e8cdf81407a9309dbe4fab9d59c703','null','null','Root Rule Chain','1e8cdf85d9b91609dbe4fab9d59c703',1,0,'root rule chain','1e8cdf813e295009dbe4fab9d59c703',NULL,'disable'),('1e8f15a22e517f0aa974d5cac0c0c10','null','null','ROOT RULE','1e8f15a55e10100aa974d5cac0c0c10',1,0,'root rule','1e8f159f481f0e0aa974d5cac0c0c10',NULL,'disable');
insert  into `rule_node`(`uuid`,`rule_chain_id`,`additional_info`,`configuration`,`type`,`name`,`debug_mode`,`search_text`,`action_type`) values ('1e8cdf85d9b91609dbe4fab9d59c703','1e8cdf81407a9309dbe4fab9d59c703','{\"description\":\"\",\"layoutX\":369,\"layoutY\":148}','{\"version\":0}','com.jdcloud.iothub.rule.engine.filter.TbMsgTypeSwitchNode','iot msg type switch',0,'iot msg type switch',NULL),('1e9696a40f2bad0a6a041a6fe650eef','1e8cdf81407a9309dbe4fab9d59c703','{\"layoutX\":537,\"layoutY\":429}','{\"timeoutInSeconds\":60}','com.jdcloud.iothub.rule.engine.rpc.TbSendRPCRequestNode','rpc',0,'rpc',NULL);

