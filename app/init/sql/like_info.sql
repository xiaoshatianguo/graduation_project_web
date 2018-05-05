-- 点赞表
CREATE TABLE IF NOT EXISTS `like_info` (
  `id` INT(64) NOT NULL AUTO_INCREMENT,
  `user_id` INT(64) DEFAULT '' comment '点赞者',
  `object_id` INT(64) DEFAULT '' comment '被点赞用户id',
  `activity_id` INT(64) DEFAULT '' comment '被点赞活动id',
  `production_id` INT(64) DEFAULT '' comment '被点赞作品id',
  `comment_id` INT(64) DEFAULT '' comment '被点赞评论id',
  `create_time` bigint comment '评论或留言发布时间',
  `status` INT(2) DEFAULT 0 comment '状态 - 0 有效点赞 - 1 取消点赞',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
