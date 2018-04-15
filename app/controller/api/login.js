'use strict';

const Controller = require('egg').Controller;
const serviceHandle = 'login';  // 处理该controller的service

class LoginController extends Controller {
  async login() {
    const ctx = this.ctx;

    const result = await ctx.service[`${serviceHandle}`].login(this.ctx.request.body);

    ctx.body = result;
    ctx.status = 200;
  }

  async currentUser() {
    // TODO: 当前没有做用户的 TOKEN 暂时反馈用户信息
    this.ctx.status = 200;
    this.ctx.body = {
      name: 'admin',
      avatar: '/public/images/favicon.png',
      userid: '00000001',
      notifyCount: 0,
    };
  }
}

module.exports = LoginController;
