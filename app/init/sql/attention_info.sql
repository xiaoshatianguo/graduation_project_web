CREATE TABLE IF NOT EXISTS `attention_info` (
  `id` varchar(64) NOT NULL,
  `trigger` VARCHAR(255) DEFAULT '' comment '发起者编号',
  `receiver` VARCHAR(255) DEFAULT '' comment '接收者编号',
  `sort` VARCHAR(255) DEFAULT '' comment '类别 - 0 关注作品 - 1 关注活动 - 2 点赞作品 - 3 点赞活动 - 4 举报作品 - 5 举报活动 - 6 举报会员 - 7 举报认证师',
  `trigger_number` VARCHAR(255) DEFAULT '' comment '触发的id',
  `create_time` DATETIME comment '发起时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;