'use strict';

const moment = require('moment');

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
        item.create_time = moment(item.create_time).format('YYYY-MM-DD');
        }
        if (item.update_time) {
        item.update_time = moment(item.update_time).format('YYYY-MM-DD');
        }
    })
}

