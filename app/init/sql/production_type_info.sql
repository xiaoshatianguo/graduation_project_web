CREATE TABLE IF NOT EXISTS `production_type_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(255) DEFAULT '' comment '作品分类编号',
  `name` VARCHAR(255) DEFAULT '' comment '作品分类名称',
  `is_show` INT(2) DEFAULT "1" comment '是否显示分类 - 0 显示 - 1 隐藏',
  `create_time` bigint comment '分类创建时间',
  `update_time` bigint comment '分类修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
