CREATE TABLE IF NOT EXISTS `admin_info` (
  `uuid` VARCHAR(64) NOT NULL,
  `number` VARCHAR(255) DEFAULT '' comment '管理员编号',
  `password` VARCHAR(255) DEFAULT '' comment '管理员密码',
  `nick_name` VARCHAR(255) DEFAULT '' comment '管理员昵称',
  `sex` INT(2) DEFAULT 0 comment '管理员性别 - 0 男 - 1 女',
  -- TODO: 这里需要更换默认值为默认头像
  `create_time` DATETIME comment '管理员创建时间',
  `update_time` DATETIME comment '管理员更新时间',
  `lastest_login_time` DATETIME comment '管理员最后登录时间',
  `integral` INT(2) DEFAULT 0 comment '管理员权限 - 0 超级管理员 - 1 二级管理员',
  `manage_categories` INT(11) DEFAULT 0 comment '管理类别',
  `status` INT(2) DEFAULT 0 comment '管理员状态 - 0 可用 - 1 禁用',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
