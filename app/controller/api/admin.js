'use strict';

const Controller = require('egg').Controller;
const serviceHandle = 'admin';  // 处理该controller的service

// 定义创建接口的请求参数规则
const createRule = {
    number: 'string',
    password: 'string',
    nickname: 'string',
    integral: { type: 'enum', values: [ '0', '1' ], required: true },
    manage_categories: 'int',
};

class AdminController extends Controller {
  
    /**
     * 获取管理员列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await ctx.service[`${serviceHandle}`].index();

        ctx.body = result;
        ctx.status = 200;
    }

    /**
     * 添加管理员
     */
    async create() {
        const ctx = this.ctx;

        // ctx.validate(createRule);

        const id = await ctx.service[`${serviceHandle}`].create(ctx.request.body);

        ctx.body = {
            admin_id: id,
        };
        ctx.status = 201;
    }

    /**
     * 修改管理员信息
     */
    async update() {
        const ctx = this.ctx;

        const reqBody = ctx.request.body;

        const row = await this.app.handleParams(reqBody.id, reqBody);

        const result = await ctx.service[`${serviceHandle}`].update(row);

        ctx.body = result;
        ctx.status = 204;
    }

    /**
     * 删除管理员
     */
    async destroy() {
        const ctx = this.ctx;

        const result = await ctx.service[`${serviceHandle}`].delete(ctx.params.id);

        ctx.body = {
            result,
        };
        ctx.status = 204;
    }
}

module.exports = AdminController;