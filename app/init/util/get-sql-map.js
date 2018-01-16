'use strict';

// const fs = require('fs');
const walkFile = require('./walk-file');

/**
 * 获取sql目录下的文件目录数据
 */

function getSqlMap() {
  let basePath = __dirname;
  // basePath:C:\syy\nodejs\koa-project\init\util
  basePath = basePath.replace(/\\/g, '/');
  // basePath:C:/syy/nodejs/koa-project/init/util
  let pathArr = basePath.split('/');
  // pathArr:C:,syy,nodejs,koa-project,init,util
  pathArr = pathArr.splice(0, pathArr.length - 1);
  // pathArr:C:,syy,nodejs,koa-project,init
  // TODO: 可修改存放sql文件的目录路径，默认统一存放在init下面的sql文件夹，尽量不要修改整个数据库初始化的目录架构，如果修改，这个文件的内容基本都要修改
  basePath = pathArr.join('/') + '/sql/';
  // basePath:C:/syy/nodejs/koa-project/init/sql/

  const fileList = walkFile(basePath, 'sql');
  // 最后返回的是walkFile()方法的结果，即所有sql文件的[文件名,绝对路径]
  return fileList;
}

module.exports = getSqlMap;
