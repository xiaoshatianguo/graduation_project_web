'use strict';

const Service = require('egg').Service;
const moment = require('moment');
const currentEditTable = 'activity_info'; // 当前操作的表名

// 查询过滤字段
const filter = [
    'initiator',
    'name',
    'sort',
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
            number: params.number,
            name: params.name,
            initiator: params.initiator,
            sort: params.sort,
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
}

module.exports = ActivityService;