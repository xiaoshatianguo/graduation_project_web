CREATE TABLE IF NOT EXISTS `attention_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `userId` int(64) NOT NULL comment '发起者编号',
  `trggerId` int(64) NOT NULL comment '接收者编号',
  `create_time` bigint comment '发起时间',
  `status` int comment '点赞状态 - 0 已取消赞 - 1 有效赞',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;