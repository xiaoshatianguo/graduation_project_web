CREATE TABLE IF NOT EXISTS `activity_info` (
  `uuid` varchar(64) NOT NULL,
  `number` VARCHAR(255) DEFAULT '' comment '活动编号',
  `name` VARCHAR(255) DEFAULT '' comment '活动名称',
  `initiator` VARCHAR(255) DEFAULT '' comment '活动发起者',
  `sort` VARCHAR(255) DEFAULT '' comment '活动所属类别',
  `topic` VARCHAR(255) DEFAULT '' comment '活动主题',
  `content` LONGTEXT DEFAULT '' comment '活动内容',
  `content_markdown` LONGTEXT DEFAULT '' comment '活动内容markdown格式',
  `create_time` DATETIME comment '活动创建申请时间',
  `update_time` DATETIME comment '活动信息编辑时间',
  `start_time` DATETIME comment '活动开始时间',
  `eng_time` DATETIME comment '活动结束时间',
  `status` CHAR(1) DEFAULT 0 comment '是否审核通过 - 0 通过 - 1 不通过',
  `auditor` VARCHAR(255) DEFAULT '' comment '审核通过管理员编号',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
