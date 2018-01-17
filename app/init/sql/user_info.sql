CREATE TABLE IF NOT EXISTS `user_info` (
  `uuid` INT(11) NOT NULL,
  `number` VARCHAR(255) DEFAULT '' comment '会员编号',
  `email` VARCHAR(255) DEFAULT '' comment '会员email',
  `phone` INT(11) DEFAULT '' comment '会员电话',
  `password` VARCHAR(255) DEFAULT '' comment '会员密码',
  `nickname` VARCHAR(255) DEFAULT '' comment '会员昵称',
  `name` VARCHAR(255) DEFAULT '' comment '会员真实名字',
  `sex` INT(2) DEFAULT 0 comment '会员性别 - 0 男 - 1 女',
  `age` INT(2) DEFAULT 0 comment '会员年龄',
  `address` VARCHAR(255) DEFAULT 0 comment '会员地址',
  -- TODO: 这里需要更换默认值为默认头像
  `portrait` VARCHAR(255) DEFAULT '' comment '会员头像',
  `personal_statement` VARCHAR(255) DEFAULT '挥一挥衣袖，不留一句宣言' comment '个人宣言',
  `create_time` DATETIME comment '会员注册时间',
  `update_time` DATETIME comment '会员信息更新时间',
  `Lastest_login_time` DATETIME comment '会员最后登录时间',
  `integral` INT(11) DEFAULT 0 comment '会员积分',
  `status` INT(11) DEFAULT 0 comment '会员账号状态 - 0 未激活 - 1 正常 - 2 禁用',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
