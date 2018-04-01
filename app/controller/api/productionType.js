'use strict';

const Controller = require('egg').Controller;
const serviceHandle = 'productionType';  // 处理该controller的service

// 定义创建接口的请求参数规则
const createRule = {
    number: 'string',
    password: 'string',
    nickname: 'string',
    integral: { type: 'enum', values: [ '0', '1' ], required: true },
    manage_categories: 'int',
};

class ProductionTypeController extends Controller {
  
    /**
     * 获取作品类型列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await ctx.service[`${serviceHandle}`].index();

        ctx.body = {
            data: result,
        };
        ctx.status = 200;
    }

    /**
     * 添加作品类型
     */
    async create() {
        const ctx = this.ctx;

        ctx.validate(createRule);

        const id = await ctx.service[`${serviceHandle}`].create(ctx.request.body);

        ctx.body = {
            admin_id: id,
        };
        ctx.status = 201;
    }

    /**
     * 修改作品类型信息
     */
    async update() {
        const ctx = this.ctx;
        const row = await ctx.handleArticleParams(ctx.params.id);

        ctx.validate(row);

        const result = await ctx.service[`${serviceHandle}`].update(row);

        ctx.body = {
            result,
        };
        ctx.status = 204;
    }

    /**
     * 删除作品类型
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

module.exports = ProductionTypeController;