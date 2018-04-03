CREATE TABLE IF NOT EXISTS `production_info` (
  `id` varchar(64) NOT NULL,
  `number` VARCHAR(255) DEFAULT '' comment '作品编号',
  `name` VARCHAR(255) DEFAULT '' comment '作品标题',
  `author` VARCHAR(255) DEFAULT '' comment '作品作者',
  `sort` VARCHAR(255) DEFAULT '' comment '作品所属类别',
  `cover` VARCHAR(255) DEFAULT '' comment '作品上传',
  `describe` VARCHAR(255) DEFAULT '' comment '作品简述',
  `photography_props` VARCHAR(255) DEFAULT '' comment '摄影道具',
  `photography_site` VARCHAR(255) DEFAULT '' comment '摄影地点',
  `content` VARCHAR(255) DEFAULT '' comment '作品描述详情',
  `content_markdown` VARCHAR(255) DEFAULT '' comment '作品描述详情markdown格式',
  `create_time` DATETIME comment '作品发布时间',
  `update_time` DATETIME comment '作品信息编辑时间',
  `status` INT(2) DEFAULT 0 comment '是否审核通过 - 0 通过 - 1 不通过',
  `auditor` VARCHAR(255) DEFAULT '' comment '审核通过管理员编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
