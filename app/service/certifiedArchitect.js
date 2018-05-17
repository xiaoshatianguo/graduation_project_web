'use strict';

const Service = require('egg').Service;
const currentEditTable = 'user_info'; // 当前操作的表名

// 查询过滤字段
const filter = [
    // 'number',
    // 'nickname',
    // 'status',
    // 'sort',
]

class CertifiedArchitectService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 认证师列表
     */
    async index(query) {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable, query, filter);

        // this.app.checkSuccess(result);

        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 添加认证师
     */
    async create(params) {
        const result = await this.app.mysql.insert(currentEditTable, {
            number: params.number,
            email: params.email,
            phone: params.phone,
            password: params.password,
            nickname: params.nickname,
            name: params.name,
            sex: params.sex,
            age: params.age,
            address: params.address,
            portrait: params.portrait,
            personal_statement: params.personal_statement,
            integral: params.integral,
            create_time: new Date().valueOf(),
            status: 0,
            sort: 2,
        });

        const newRecord = await this.app.mysql.get(
            currentEditTable,
            {id: result.insertId}
        );

        // this.app.checkSuccess(newRecord);

        return JSON.parse(JSON.stringify(newRecord));
    }

    /**
     * 修改认证师信息
     */
    async update(params) {
        await this.app.mysql.update(currentEditTable, params);

        const result = await this.app.mysql.get(currentEditTable, {
            id: params.id,
          });
          
        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 删除认证师
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

module.exports = CertifiedArchitectService;