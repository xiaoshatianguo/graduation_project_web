'use strict';

const Service = require('egg').Service;
const currentEditTable = 'user_info'; // 当前操作的表名

class UserService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 用户列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 添加用户
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
     * 修改用户信息
     */
    async update(params) {
        const result = await this.app.mysql.update(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 删除用户
     */
    async delete(params) {
        const result = await this.app.mysql.delete(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }
}

module.exports = UserService;