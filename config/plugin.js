'use strict';

// had enabled by egg
// exports.static = true;
exports.mysql = {
  enable: true,
  package: 'egg-mysql',
};

exports.validate = {
  enable: true,
  package: 'egg-validate',
};

exports.nunjucks = {
  enable: true,
  package: 'egg-view-nunjucks',
};

// exports.webpack = {
//   enable: true,
//   package: 'egg-webpack',
// };

exports.cors = {
  enable: true,
  package: 'egg-cors',
};


exports.passport = {
  enable: true,
  package: 'egg-passport',
};
