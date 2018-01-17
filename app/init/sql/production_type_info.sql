CREATE TABLE IF NOT EXISTS `production_type_info` (
  `id` varchar(64) NOT NULL,
  `number` VARCHAR(255) DEFAULT '' comment '作品分类',
  `auditor` VARCHAR(255) DEFAULT '' comment '设置分类管理员编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
