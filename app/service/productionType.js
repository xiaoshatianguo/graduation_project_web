'use strict';

const Service = require('egg').Service;
const currentEditTable = 'production_type_info'; // 当前操作的表名

// 查询过滤字段
const filter = [
    
]

class ProductionTypeService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 作品类型列表
     */
    async index(query) {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable, query, filter);

        // this.app.checkSuccess(result);

        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 添加作品类型
     */
    async create(params) {
        const result = await this.app.mysql.insert(currentEditTable, {
            number: params.number,
            name: params.name,
            create_time: new Date().valueOf(),
        });

        const newRecord = await this.app.mysql.get(
            currentEditTable,
            {id: result.insertId}
        );

        // this.app.checkSuccess(result);

        return JSON.parse(JSON.stringify(newRecord));
    }

    /**
     * 修改作品类型信息
     */
    async update(params) {
        await this.app.mysql.update(currentEditTable, params);
        
        const result = await this.app.mysql.get(currentEditTable, {
            id: params.id,
        });

        // this.app.checkSuccess(result);

        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 删除作品类型
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

module.exports = ProductionTypeService;