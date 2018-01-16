'use strict';

const Controller = require('egg').Controller;

class RegisterController extends Controller {
  /**
   * 跳转到注册页面
   */
  async register() {
    await this.ctx.render('register.tpl');
  }
}

module.exports = RegisterController;
