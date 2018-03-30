'use strict';

const Service = require('egg').Service;
const currentEditTable = 'admin_info'; // 当前操作的表名

class AdminService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 管理员列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 添加管理员
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
     * 修改管理员信息
     */
    async update(params) {
        const result = await this.app.mysql.update(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 删除管理员
     */
    async delete(params) {
        const result = await this.app.mysql.delete(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }
}

module.exports = AdminService;