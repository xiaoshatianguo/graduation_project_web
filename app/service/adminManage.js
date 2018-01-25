'use strict';

const Service = require('egg').Service;

class AdminService extends Service {
    async index() {
        try {
            const response = await this.handlePagination('admin_info');

            this.ctx.status = 200;
            this.ctx.body = response;
        } catch(err) {
            this.ctx.status = 500;
            this.ctx.body = err;
        }
    }

    /**
     * 添加管理员
     */
    async create() {
        try {
            const result = await this.app.mysql.insert('admin_info', {
                create_time: new Date().valueOf(),
            });

            this.checkSuccess(result);

            return result.data.id;
        } catch(err) {
            this.ctx.status = 500;
            this.ctx.body = err;
        }
    }

    // 封装统一的调用检查函数，可以在查询、创建和更新等 Service 中复用
    checkSuccess(result) {
        if (result.status !== 200) {
            const errorMsg = result.data && result.data.error_msg ? result.data.error_msg : 'unknown error';
            this.ctx.throw(result.status, errorMsg);
        }
        if (!result.data.success) {
            // 远程调用返回格式错误
            this.ctx.throw(500, 'remote response error', { data: result.data });
        }
    }
}

module.exports = AdminService;