'use strict';

const fs = require('fs');
const getSqlMap = require('./get-sql-map');

const sqlContentMap = {};

/**
 * 读取sql文件内容
 * @param  {string} fileName 文件名称
 * @param  {string} path     文件所在的路径
 */
function getSqlContent(fileName, path) {
  // fileName:user_info.sql
  // path:C:/syy/nodejs/koa-project/init/sql/user_info.sql
  const content = fs.readFileSync(path, 'binary');
  // content = user_info.sql文件的文本内容
  sqlContentMap[fileName] = content;
}

/**
 * 封装所有sql文件脚本内容
 * @return {object} 最后返回的是所有sql文件的脚本内容对象
 */
function getSqlContentMap() {
  const sqlMap = getSqlMap();
  // sqlMap:所有sql文件的[文件名,绝对路径]
  for (const key in sqlMap) {
    // key:user_info.sql
    // sqlMap[key]:C:/syy/nodejs/koa-project/init/sql/user_info.sql
    getSqlContent(key, sqlMap[key]);
  }

  return sqlContentMap;
  // 最后返回的是所有sql文件的脚本内容对象
}

module.exports = getSqlContentMap;
