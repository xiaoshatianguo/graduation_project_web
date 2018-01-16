'use strict';

const Service = require('egg').Service;

class RegisterService extends Service {
  //   constructor(ctx) {
  //     super(ctx);
  //   }

  async signUp(params) {
    const result = await this.app.mysql.insert('user_info', {
      name: params.password,
      password: params.username,
    });

    // console.info("result" + result);

    // const checkSuccess = this.checkSuccess(result);

    // console.log("checkSuccess" + checkSuccess);

    // const insertSuccess = result.affectedRows === 1;

    // console.info("insertSuccess" + insertSuccess);

    // return insertSuccess;
  }

  checkSuccess(result) {
    if (result.status !== 200) {
      const errorMsg =
        result.data && result.data.error_msg
          ? result.data.error_msg
          : 'unknown error';
      this.ctx.throw(result.status, errorMsg);
    }
    if (!result.data.success) {
      // 远程调用返回格式错误
      this.ctx.throw(500, 'remote response error', { data: result.data });
    }
  }
}

module.exports = RegisterService;
