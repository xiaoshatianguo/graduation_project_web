CREATE TABLE IF NOT EXISTS `comments_info` (
  `uuid` varchar(64) NOT NULL,
  `reviewers` VARCHAR(255) DEFAULT '' comment '评论或留言者',
  `receiver` VARCHAR(255) DEFAULT '' comment '接收评论或留言者',
  `sort` VARCHAR(255) DEFAULT '' comment '评论或留言分类 - 0 评论作品 - 1 评论活动 - 2 个人空间留言',
  `trigger_number` VARCHAR(255) DEFAULT '' comment '触发的uuid',
  `content` VARCHAR(255) DEFAULT '' comment '评论或留言内容',
  `create_time` DATETIME comment '评论或留言发布时间',
  `update_time` DATETIME comment '评论修改时间',
  `status` VARCHAR(255) DEFAULT 0 comment '是否被禁 - 0 禁 - 1 无禁',
  `auditor` VARCHAR(255) DEFAULT '' comment '处理管理员编号',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
