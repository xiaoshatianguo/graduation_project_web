-- 消息处理表
CREATE TABLE IF NOT EXISTS `news_info` (
  `id` INT(64) NOT NULL AUTO_INCREMENT,
  `user_id` INT(64) DEFAULT 0 comment '发起操作者id',
  `activity_id` INT(64) DEFAULT 0 comment '发布活动id',
  `production_id` INT(64) DEFAULT 0 comment '发布作品id',
  `status` INT(2) DEFAULT 0 comment '作品、活动审核状态 - 0 待审核 - 1 审核通过 - 2 审核不通过',
  `apply_certificate` INT(64) DEFAULT 0 comment '申请认证师处理 - 0 待处理 - 1 已处理',
  `comment_id` INT(64) DEFAULT 0 comment '评论留言被禁处理 - 0 被禁 - 1 解除禁',
  `create_time` bigint comment '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
