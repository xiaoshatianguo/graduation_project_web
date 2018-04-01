'use strict';

const Service = require('egg').Service;
const currentEditTable = 'attention_info'; // 当前操作的表名

class AttentionService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 点赞关注列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 添加点赞关注
     */
    async create(params) {
        const result = await this.app.mysql.insert(currentEditTable, {
            method: 'post',
            data:params,
            dataType: 'json',
            contentType: 'json',
            create_time: new Date().valueOf(),
        });

        this.app.checkSuccess(result);

        return result.data.id;
    }

    /**
     * 修改点赞关注信息
     */
    async update(params) {
        const result = await this.app.mysql.update(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 删除点赞关注
     */
    async delete(params) {
        const result = await this.app.mysql.delete(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }
}

module.exports = AttentionService;