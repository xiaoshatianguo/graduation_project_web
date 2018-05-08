-- 关注表
CREATE TABLE IF NOT EXISTS `attention_info` (
  `id` INT(64) NOT NULL AUTO_INCREMENT,
  `user_id` INT(64) NOT NULL comment '关注发起者',
  `object_id` INT(64) NOT NULL comment '被关注用户id',
  `activity_id` INT(64) NOT NULL comment '被关注活动id',
  `create_time` bigint comment '创建时间',
  `status` bigint comment '状态 - 0 有效关注 - 1 取消关注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;