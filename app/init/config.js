/**
 * 数据库初始化区域配置
 */
'use strict';

const config = {
  port: 3001,

  database: {
    DATABASE: 'egg_mysql',
    USERNAME: 'root',
    PASSWORD: 'root',
    PORT: '3306',
    HOST: 'localhost',
  },
};

module.exports = config;
