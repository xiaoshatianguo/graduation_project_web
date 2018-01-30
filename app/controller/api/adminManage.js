'use strict';

const Controller = require('egg').Controller;
const serviceHandle = 'adminManage';  // 处理该controller的service

// 定义创建接口的请求参数规则
//TODO: 修改规则
const createRule = {
    accesstoken: 'string',
    number: 'string',
    password: 'string',
    tab: { type: 'enum', values: [ 'ask', 'share', 'job' ], required: false },
    content: 'string',
};

class AdminController extends Controller {
  
    /**
     * 获取管理员列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await ctx.service.serviceHandle.index();

        ctx.body = {
            data: result,
        };
        ctx.status = 200;
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

    /**
     * 修改管理员信息
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