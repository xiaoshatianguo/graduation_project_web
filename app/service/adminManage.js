'use strict';

const Service = require('egg').Service;
const currentEditTable = 'admin_info'; // 当前操作的表名
const tools = require('../utils/tool.js');

class AdminService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 管理员列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await tools.handlePagination(currentEditTable);

        tools.checkSuccess(result);

        return result;
    }

    /**
     * 添加管理员
     */
    async create(params) {
        const result = await this.app.mysql.insert('admin_info', {
            method: 'post',
            data:params,
            dataType: 'json',
            contentType: 'json',
            create_time: new Date().valueOf(),
        });

        tools.checkSuccess(result);

        return result.data.id;
    }
}

module.exports = AdminService;