-- 关注表
CREATE TABLE IF NOT EXISTS `attention_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `user_id` int(64) NOT NULL comment '关注发起者',
  `object_id` int(64) NOT NULL comment '被关注对象',
  `sort` int(2) NOT NULL comment '关注分类 - 0 关注用户 - 1 关注活动',
  `attention_id` int(64) NOT NULL comment '关注id',
  `create_time` bigint comment '创建时间',
  `status` bigint comment '状态 - 0 有效关注 - 1 取消关注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;