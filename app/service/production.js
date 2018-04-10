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

        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 添加作品
     */
    async create(params) {
        const result = await this.app.mysql.insert(currentEditTable, {
            number: params.number,
            name: params.name,
            initiator: params.initiator,
            sort: params.sort,
            topic: params.topic,
            content: params.content,
            create_time: new Date().valueOf(),
            start_time: new Date().valueOf(),
            end_time: new Date().valueOf(),
        });

        const newRecord = await this.app.mysql.get(
            currentEditTable,
            {id: result.insertId}
        );

        this.app.checkSuccess(newRecord);

        return JSON.parse(JSON.stringify(newRecord));
    }

    /**
     * 修改作品信息
     */
    async update(params) {
        await this.app.mysql.update(currentEditTable, params);
        
        const result = await this.app.mysql.get(currentEditTable, {
            id: params.id,
        });
            
        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 删除作品
     */
    async delete(params) {
        const result = await this.app.mysql.delete(
            currentEditTable, 
            {id: params},
        );

        this.app.checkSuccess(result);

        return result;
    }
}

module.exports = ProductionService;