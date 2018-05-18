'use strict';

const Service = require('egg').Service;
const moment = require('moment');
const currentEditTable = 'activity_info'; // 当前操作的表名

// 查询过滤字段
const filter = [
    'initiator',
    'name',
    'status',
]

class ActivityService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 活动列表
     */
    async index(query) {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable, query, filter);
        
        // this.app.checkSuccess(result);

        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 添加活动
     */
    async create(params) {
        const result = await this.app.mysql.insert(currentEditTable, {
            name: params.name,
            initiator: params.initiator,
            topic: params.topic,
            describe: params.describe,
            content: params.content,
            rule: params.rule,
            cover: params.cover,
            banner: params.banner,
            create_time: new Date().valueOf(),
            start_time: new Date().valueOf(),
            end_time: new Date().valueOf(),
        });

        const newRecord = await this.app.mysql.get(
            currentEditTable,
            {id: result.insertId}
        );

        // this.app.checkSuccess(newRecord);

        return JSON.parse(JSON.stringify(newRecord));
    }

    /**
     * 修改活动信息
     */
    async update(params) {
        await this.app.mysql.update(currentEditTable, params);
        
        const result = await this.app.mysql.get(currentEditTable, {
            id: params.id,
        });
            
        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 删除活动
     */
    async delete(params) {
        const result = await this.app.mysql.delete(
            currentEditTable, 
            {id: params},
        );

        // this.app.checkSuccess(result);

        return result;
    }

    /**
     * 根据前端请求分页返回数据
     * @param  {string} tableName     需要进行分页处理的表名
     * @return {object}     返回请求指定页数的响应体
     */
    async handlePagination(tableName, query, filter) {
        const content = [];
        // 生成查询字段sql
        let filterSQL = '';
        let finalSQL = '';
        if(!!filter) {
            for(let i=0; i<filter.length; i++) {
                let filterElement = filter[i];
                let queryValue = query[`${filterElement}`];
                if(!!queryValue) {
                    filterSQL += `${filterElement} = '${queryValue}' and `;
                }
            }
            if(!!filterSQL) {
                finalSQL = `where ${filterSQL}`;
            }
        }
        finalSQL = finalSQL.substring(0, finalSQL.length-4);

        const total = await this.app.mysql.query(
            `SELECT COUNT(*) total FROM ${tableName} ${finalSQL};`
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
        const orders = [[ 'create_time', 'desc' ], [ 'id', 'desc' ]];

        const result = await this.app.mysql.query(
            `SELECT * from ${tableName} ${finalSQL} ORDER BY id desc limit ${offset},${limit};`
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
}

module.exports = ActivityService;