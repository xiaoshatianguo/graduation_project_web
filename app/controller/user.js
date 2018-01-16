'use strict';

const Controller = require('egg').Controller;

const createRule = {
    username: {
        type: 'email',
        required: true,
    },
    password: {
        type: 'password',
        required: true,
    },
};

class RegisterController extends Controller {
    /**
     * 注册操作
     * @param   {obejct} ctx 上下文对象
     */
    async signUp() {
        // this.ctx.validate(createRule);

        const insertSuccess = await this.ctx.service.user.signUp(this.ctx.request.body);

        this.ctx.body = "注册成功";
    }
}

module.exports = RegisterController;