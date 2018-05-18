'use strict';

const Service = require('egg').Service;
const currentEditTable = 'production_info'; // 当前操作的表名

// 查询过滤字段
const filter = [
    'name',
    'sort',
    'status',
]

class ProductionService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 作品列表
     */
    async index(query) {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable, query, filter);

        // this.app.checkSuccess(result);

        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 添加作品
     */
    async create(params) {
        const result = await this.app.mysql.insert(currentEditTable, {
            number: params.number,
            name: params.name,
            author: params.author,
            sort: params.sort,
            cover: params.cover,
            describe: params.describe,
            photography_props: params.photography_props,
            photography_site: params.photography_site,
            content: params.content,
            create_time: new Date().valueOf(),
        });

        const newRecord = await this.app.mysql.get(
            currentEditTable,
            {id: result.insertId}
        );

        // this.app.checkSuccess(newRecord);

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

        // this.app.checkSuccess(result);

        return result;
    }
}

module.exports = ProductionService;