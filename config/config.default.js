'use strict';

module.exports = appInfo => {
  const config = (exports = {});

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1513238745718_9212';

  config.view = {
    defaultViewEngine: 'nunjucks',
    mapping: {
      '.tpl': 'nunjucks',
    },
  };

  config.security = {
    csrf: {
      enable: false,
      domainWhiteList: [
        'http://localhost:8000',
        'http://localhost:7100',
        'http://localhost:7200',
        'http://p1s12lchv.bkt.clouddn.com',
      ],
    },
  };

  /** 允许跨域 */
  config.cors = {
    allowMethods: 'GET,HEAD,PUT,POST,DELETE,PATCH',
    origin: '*',
  };

  config.middleware = [ 'errorHandle' ];

  config.errorHandle =  {
    match: '/api',
  };

  return config;
};
