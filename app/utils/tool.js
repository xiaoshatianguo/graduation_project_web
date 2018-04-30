'use strict';

const crypto=require('crypto');    // md5加密算法
const moment = require('moment');
const uuid = require('uuid');

/**
 * 删除字符串左边或者右边的指定字符
 * @param {*} char 需要去掉的字符
 * @param {*} type left right
 * @return {*} 处理完的字符串
 */
exports.trim = function(char, type) {
    if (char) {
      if (type === 'left') {
        return this.replace(new RegExp('^\\' + char + '+', 'g'), '');
      } else if (type === 'right') {
        return this.replace(new RegExp('\\' + char + '+$', 'g'), '');
      }
      return this.replace(
        new RegExp('^\\' + char + '+|\\' + char + '+$', 'g'),
        ''
      );
    }
    return this.replace(/^\s+|\s+$/g, '');
};

/**
 * 后台时间戳转换成时间格式返回给前端
 * @param {*} arr 需要传入一个数组，成员为需要进行时间戳转换的
 */
exports.formatTime = function(arr = []) {
    arr.forEach(item => {
        if (item.create_time) {
        item.create_time = moment(item.create_time).format('YYYY-MM-DD hh:mm:ss');
        }
        if (item.update_time) {
        item.update_time = moment(item.update_time).format('YYYY-MM-DD hh:mm:ss');
        }
        if (item.start_time) {
        item.start_time = moment(item.start_time).format('YYYY-MM-DD hh:mm:ss');
        }
        if (item.end_time) {
        item.end_time = moment(item.end_time).format('YYYY-MM-DD hh:mm:ss');
        }
    })
};

/**
 * 用户登录注册工具方法
 */
// md5加密方法
exports.getMD5Password = function(content) {
  var md5 = crypto.createHash('md5');//定义加密方式:md5不可逆,此处的md5可以换成任意hash加密的方法名称；
  md5.update(content);
  var d = md5.digest('hex');  //加密后的值d
  return d;
};

// 生成唯一文件名方法
exports.getUuidFileName = () => {
    const nowDate = new Date();
    const year = nowDate.getFullYear();
    let month = nowDate.getMonth() + 1;
    let date = nowDate.getDate();
    let curr = '';
    const suffix = uuid.v4();

    month = month < 10 ? `0${month}` : month;
    date = date < 10 ? `0${date}` : date;
    curr = `${year}${month}${date}`;

    return encodeURI(`${curr}/${suffix}`);
};