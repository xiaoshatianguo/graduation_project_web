-- 评论表
CREATE TABLE IF NOT EXISTS `comments_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(255) DEFAULT '' comment '评论或留言者',
  `reply_id` VARCHAR(255) DEFAULT '' comment '评论父id',
  `production_id` VARCHAR(255) DEFAULT '' comment '评论的作品id',
  `activity_id` VARCHAR(255) DEFAULT '' comment '评论的活动id',
  `personal_id` VARCHAR(255) DEFAULT '' comment '留言的用户id',
  `content` VARCHAR(255) DEFAULT '' comment '评论或留言内容',
  `star` VARCHAR(255) DEFAULT '' comment '评论被赞数量',
  `create_time` bigint comment '评论或留言发布时间',
  `status` INT(2) DEFAULT 0 comment '是否被禁 - 0 否 - 1 禁',
  `is_delete` INT(2) DEFAULT 0 comment '是否删除 - 0 否 - 1 删',
  `auditor` VARCHAR(255) DEFAULT '' comment '处理管理员编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
