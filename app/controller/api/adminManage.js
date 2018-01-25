'use strict';

const Controller = require('egg').Controller;

// 定义创建接口的请求参数规则
const createRule = {
    accesstoken: 'string',
    title: 'string',
    tab: { type: 'enum', values: [ 'ask', 'share', 'job' ], required: false },
    content: 'string',
};

class AdminController extends Controller {
  
    /**
     * 获取管理员列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await ctx.service.adminManage.index();

        ctx.body = {
            data: result,
        }
        ctx.status = 201;
    }

    /**
     * 添加管理员
     */
    async create() {
        const ctx = this.ctx;

        ctx.validate(createRule);

        const id = await ctx.service.adminManage.create(ctx.request.body);

        ctx.body = {
            admin_id: id,
        };
        ctx.status = 201;
    }
}

module.exports = AdminController;