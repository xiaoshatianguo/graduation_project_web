'use strict';

const Controller = require('egg').Controller;
const serviceHandle = 'certifiedArchitect';  // 处理该controller的service

// 定义创建接口的请求参数规则
const createRule = {
    number: 'string',
    phone: 'string',
    // password: 'string',
    integral: 'string',
    // status: 'string',
    // sort: 'string',
};

class CertifiedArchitectController extends Controller {
  
    /**
     * 获取认证师列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await ctx.service[`${serviceHandle}`].index(ctx.request.query);

        ctx.body = result;
        ctx.status = 200;
    }

    /**
     * 添加认证师
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
     * 修改认证师信息
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
     * 删除认证师
     */
    async destroy() {
        const ctx = this.ctx;

        const result = await ctx.service[`${serviceHandle}`].delete(ctx.params.id);

        ctx.body = result;
        ctx.status = 204;
    }
}

module.exports = CertifiedArchitectController;