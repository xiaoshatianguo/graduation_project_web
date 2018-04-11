'use strict';

const Controller = require('egg').Controller;
const serviceHandle = 'production';  // 处理该controller的service

// 定义创建接口的请求参数规则
const createRule = {
    number: 'string',
    name: 'string',
    author: 'string',
    sort: 'string',
    describe: 'string',
    content: 'string',
};

class ProductionController extends Controller {
  
    /**
     * 获取作品列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await ctx.service[`${serviceHandle}`].index(ctx.request.query);

        ctx.body = result;
        ctx.status = 200;
    }

    /**
     * 添加作品
     */
    async create() {
        const ctx = this.ctx;

        const reqBody = ctx.request.body;

        // ctx.validate(createRule);

        const result = await ctx.service[`${serviceHandle}`].create(reqBody);

        ctx.body = result;
        ctx.status = 200;
    }

    /**
     * 修改作品信息
     */
    async update() {
        const ctx = this.ctx;

        const reqBody = ctx.request.body;

        const row = await this.app.handleParams(reqBody.id, reqBody);

        const result = await ctx.service[`${serviceHandle}`].update(row);

        ctx.body = result;
        ctx.status = 200;
    }

    /**
     * 删除作品
     */
    async destroy() {
        const ctx = this.ctx;

        const result = await ctx.service[`${serviceHandle}`].delete(ctx.params.id);

        ctx.body = result;
        ctx.status = 204;
    }
}

module.exports = ProductionController;