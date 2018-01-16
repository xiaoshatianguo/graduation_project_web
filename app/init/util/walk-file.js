'use strict';

const fs = require('fs');

/**
 * 遍历目录下的文件目录
 * @param  {string} pathResolve  需进行遍历的目录路径
 * @param  {string} mime         遍历文件的后缀名
 * @return {object}              返回遍历后的目录结果
 */
const walkFile = function(pathResolve, mime) {
  // pathResolve = C:/syy/nodejs/koa-project/init/sql/
  const files = fs.readdirSync(pathResolve);
  // files = [ 'user_info.sql' ]
  const fileList = {};

  for (const [i, item] of files.entries()) {
    // i:0   item:user_info.sql   files.entries():[object Array Iterator]
    const itemArr = item.split('.');
    // itemArr = [ 'user_info', 'sql' ]
    const itemMime =
      itemArr.length > 1 ? itemArr[itemArr.length - 1] : 'undefined';
    // itemMine:sql
    const keyName = item + '';
    // keyName:user_info.sql
    if (mime === itemMime) {
      fileList[item] = pathResolve + item;
    }
    // 最后返回的是所有sql文件的[文件名,绝对路径] 如fileList = C:/syy/nodejs/koa-project/init/sql/user_info.sql
  }

  return fileList;
};

module.exports = walkFile;
