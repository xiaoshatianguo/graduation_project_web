'use strict';

const Controller = require('egg').Controller;
const serviceHandle = 'sendEmail';  // 处理该controller的service

/**
 *  将域名token 返回给前端用于服务器上传图片
 *
 * @class QiuniuUploadController
 * @extends {Controller}
 */
class sendEmailController extends Controller {
    async sendEmail() {
        const userData = this.ctx.request.body;
        const ctx = this.ctx;

        const result = await ctx.service[`${serviceHandle}`].sendEmail(userData);

        ctx.body = result;
        ctx.status = 200;
    }
}

module.exports = sendEmailController;
