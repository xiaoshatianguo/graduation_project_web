-- 点赞表
CREATE TABLE IF NOT EXISTS `like_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(255) DEFAULT '' comment '点赞者',
  `object_id` VARCHAR(255) DEFAULT '' comment '被点赞对象',
  `sort` INT(2) DEFAULT 0 comment '点赞分类 - 0 点赞作品 - 1 点赞活动',
  `like_id` VARCHAR(255) DEFAULT '' comment '触发的id',
  `create_time` bigint comment '评论或留言发布时间',
  `status` INT(2) DEFAULT 0 comment '状态 - 0 有效点赞 - 1 取消点赞',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
