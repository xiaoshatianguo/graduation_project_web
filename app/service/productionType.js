'use strict';

const Service = require('egg').Service;
const currentEditTable = 'production_type_info'; // 当前操作的表名

class ProductionTypeService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 作品类型列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 添加作品类型
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
     * 修改作品类型信息
     */
    async update(params) {
        const result = await this.app.mysql.update(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 删除作品类型
     */
    async delete(params) {
        const result = await this.app.mysql.delete(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }
}

module.exports = ProductionTypeService;