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

// 封装统一的调用检查函数，可以在查询、创建和更新等 Service 中复用
exports.checkSuccess = function(result) {
    if (result.status !== 200) {
        const errorMsg = result.data && result.data.error_msg ? result.data.error_msg : 'unknown error';
        this.ctx.throw(result.status, errorMsg);
    }
    if (!result.data.success) {
        // 远程调用返回格式错误
        this.ctx.throw(500, 'remote response error', { data: result.data });
    }
}

    /**
 * 根据前端请求分页返回数据
 * @param  {string} tableName     需要进行分页处理的表名
 * @return {object}     返回请求指定页数的响应体
 */
exports.handlePagination = function(tableName) {
    const content = [];
    const query = this.ctx.request.query;

    const total = await this.app.mysql.query(
        `SELECT COUNT(*) total FROM ${tableName};`
        // `SELECT a.*,d.sort_name FROM department_detail d inner join ${tableName} a on a.department = d.id;`
    );

    const totalRecord = JSON.parse(JSON.stringify(total))[0].total;
    let currentPage; // 返回当前请求的页数
    let curPageSize; // 返回当前页数据量
    const totalPages = parseInt(totalRecord / query.curPageSize);

    // 请求的页数大于数据总页数, 返回内容为空
    if (query.currentPage > totalPages + 1) {
        return {
            content,
            currentPage: query.currentPage,
            curPageSize: query.curPageSize,
            totalElements: totalRecord,
        };
    }

    if (totalPages > 0) {
        currentPage = query.currentPage * 1;
        curPageSize =
            query.currentPage > totalPages
                ? totalRecord - totalPages * query.curPageSize
                : query.curPageSize * 1;
    } else {
        currentPage = 1;
        curPageSize = totalRecord;
    }

    const limit = curPageSize * 1;
    const offset = currentPage > 1 ? (currentPage - 1) * query.curPageSize : 0;
    const orders = [['create_time', 'desc'], ['id', 'desc']];

    const result = await this.app.mysql.query(
        `SELECT * from ${currentEditTable} ORDER BY id desc;`
    );

    result.forEach(record => {
        content.push(JSON.parse(JSON.stringify(record))); // 将 RowDataPacket 对象转成 JSON 对象
    });

    return {
        content,
        currentPage,
        curPageSize,
        totalElements: totalRecord,
    };
}