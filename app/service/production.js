'use strict';

const Service = require('egg').Service;
const currentEditTable = 'production_info'; // 当前操作的表名

class ProductionService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 作品列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 添加作品
     */
    async create(params) {
        const result = await this.app.mysql.insert(currentEditTable, {
            method: 'post',
            data:params,
            dataType: 'json',
            contentType: 'json',
            create_time: new Date(),
        });

        this.app.checkSuccess(result);

        return result.data.id;
    }

    /**
     * 修改作品信息
     */
    async update(params) {
        const result = await this.app.mysql.update(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 删除作品
     */
    async delete(params) {
        const result = await this.app.mysql.delete(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }
}

module.exports = ProductionService;