'use strict';

const Service = require('egg').Service;
const currentEditTable = 'admin_info'; // 当前操作的表名

// 查询过滤字段
const filter = [
    'integral',
    'manage_categories',
]

class AdminService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 管理员列表
     */
    async index(query) {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable, query, filter);

        this.app.checkSuccess(result);

        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 添加管理员
     */
    async create(params) {
        const result = await this.app.mysql.insert(currentEditTable, {
            number: params.number,
            password: params.password,
            nick_name: params.nick_name,
            sex: params.sex,
            create_time: new Date(),
            integral: params.integral,
            manage_categories: params.manage_categories,
        });

        const newRecord = await this.app.mysql.get(
            currentEditTable,
            {id: result.insertId}
        );

        this.app.checkSuccess(newRecord);

        return JSON.parse(JSON.stringify(newRecord));
    }

    /**
     * 修改管理员信息
     */
    async update(params) {
        await this.app.mysql.update(currentEditTable, params);

        const result = await this.app.mysql.get(currentEditTable, {
            id: params.id,
          });
          
        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 删除管理员
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

module.exports = AdminService;