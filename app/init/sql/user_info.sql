CREATE TABLE IF NOT EXISTS `user_info` (
  `uuid` INT(11) NOT NULL,
  `number` VARCHAR(255) DEFAULT '' comment '会员/认证师编号',
  `email` VARCHAR(255) DEFAULT '' comment '会员/认证师email',
  `phone` INT(20) DEFAULT 0 comment '会员/认证师电话',
  `password` VARCHAR(255) DEFAULT '' comment '会员/认证师密码',
  `nickname` VARCHAR(255) DEFAULT '' comment '会员/认证师昵称',
  `name` VARCHAR(255) DEFAULT '' comment '会员/认证师真实名字',
  `sex` INT(2) DEFAULT 0 comment '会员/认证师性别 - 0 男 - 1 女',
  `age` INT(3) DEFAULT 0 comment '会员/认证师年龄',
  `address` VARCHAR(255) DEFAULT '' comment '会员/认证师地址',
  -- TODO: 这里需要更换默认值为默认头像
  `portrait` VARCHAR(255) DEFAULT '' comment '会员/认证师头像',
  `personal_statement` VARCHAR(255) DEFAULT '挥一挥衣袖，不留一句宣言' comment '个人宣言',
  `create_time` DATETIME comment '会员/认证师注册时间',
  `update_time` DATETIME comment '会员/认证师信息更新时间',
  `Lastest_login_time` DATETIME comment '会员/认证师最后登录时间',
  `integral` INT(11) DEFAULT 0 comment '会员/认证师积分',
  `status` INT(2) DEFAULT 0 comment '会员/认证师账号状态 - 0 未激活 - 1 正常 - 2 禁用',
  `sort` INT(2) DEFAULT 0  comment '区分会员/认证师 - 0 会员 - 2 认证师',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
