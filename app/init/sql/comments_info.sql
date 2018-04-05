CREATE TABLE IF NOT EXISTS `comments_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `reviewers` VARCHAR(255) DEFAULT '' comment '评论或留言者',
  `receiver` VARCHAR(255) DEFAULT '' comment '接收评论或留言者',
  `sort` INT(2) DEFAULT 0 comment '评论或留言分类 - 0 评论作品 - 1 评论活动 - 2 个人空间留言',
  `trigger_number` VARCHAR(255) DEFAULT '' comment '触发的id',
  `content` VARCHAR(255) DEFAULT '' comment '评论或留言内容',
  `create_time` DATETIME comment '评论或留言发布时间',
  `update_time` DATETIME comment '评论修改时间',
  `status` INT(2) DEFAULT 0 comment '是否被禁 - 0 无禁 - 1 禁',
  `auditor` VARCHAR(255) DEFAULT '' comment '处理管理员编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
