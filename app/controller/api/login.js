'use strict';

const Controller = require('egg').Controller;

class LoginController extends Controller {
  async login() {
    const reqBody = this.ctx.request.body;
    const type = reqBody.type;
    const data = {
      userName: reqBody.userName,
      password: reqBody.password,
    };

    try {
      const result = await this.app.mysql.get('user_info', data);

      this.ctx.status = 200;
      this.ctx.body = {
        status: 'ok',
        type,
        currentAuthority: result.level,
      };
    } catch (err) {
      this.ctx.status = 200;
      this.ctx.body = {
        status: 'error',
        type,
        currentAuthority: 'guest',
      };
    }
  }

  async currentUser() {
    // TODO: 当前没有做用户的 TOKEN 暂时反馈用户信息
    this.ctx.status = 200;
    this.ctx.body = {
      name: 'admin',
      avatar: 'http://www.talkmoney.cn/public/images/luwei_logo.png',
      userid: '00000001',
      notifyCount: 0,
    };
  }
}

module.exports = LoginController;
