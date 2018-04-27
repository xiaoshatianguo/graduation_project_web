'use strict';

const Controller = require('egg').Controller;
// const serviceHandle = 'vertifyCode';  // 处理该controller的service

/**
 *  验证验证码
 *
 * @class vertifyCodeController
 * @extends {Controller}
 */
class VertifyCodeController extends Controller {
    async vertifyCode() {
        const ctx = this.ctx;
        const userData = ctx.request.body;
        let email = userData.email;
        let code = userData.code;

        let codeValue = ctx.cookies.get(email);
        if(codeValue == code) {
            ctx.body = {
                email,
                code,
            };
            ctx.status = 200;
        } else {
            ctx.body = {
                msg: '验证码错误，验证不通过',
            };
            ctx.status = 403;
        }
    }
}

module.exports = VertifyCodeController;
