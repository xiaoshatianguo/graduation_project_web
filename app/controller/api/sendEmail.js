'use strict';

const Controller = require('egg').Controller;
const serviceHandle = 'sendEmail';  // 处理该controller的service

/**
 *  发送邮件
 *
 * @class sendEmailController
 * @extends {Controller}
 */
class sendEmailController extends Controller {
    async sendEmail() {
        const userData = this.ctx.request.body;
        let email = userData.email;
        const ctx = this.ctx;

        const checkUserExist = await this.app.mysql.get(
            'user_info',
            { email }
        );

        if(checkUserExist == null) {
            const result = await ctx.service[`${serviceHandle}`].index(email);
            ctx.body = result;
            ctx.status = 200;
        } else {
            ctx.body = {
                msg: '该用户已存在！',
            };
            ctx.status = 403;
        }
    }
}

module.exports = sendEmailController;
