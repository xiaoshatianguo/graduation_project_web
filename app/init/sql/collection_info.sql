-- 收藏表
CREATE TABLE IF NOT EXISTS `collection_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `user_id` int(64) NOT NULL comment '收藏发起者',
  `object_id` int(64) NOT NULL comment '被收藏作品id',
  `create_time` bigint comment '创建时间',
  `status` bigint comment '状态 - 0 有效收藏 - 1 取消收藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;