'use strict';

const Service = require('egg').Service;
const currentEditTable = 'admin_info'; // 当前操作的表名

class LoginService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 管理后台登录处理
     */
    async login(reqBody) {
        const ctx = this.ctx;
        const type = reqBody.type;
        const data = {
            nick_name: reqBody.userName,
            password: reqBody.password,
        };

        let result = {};

        try {
            const record = await this.app.mysql.get('admin_info', data);

            if(record) {
                result = {
                    status: 'ok',
                    type,
                    // TODO: 权限有待进一步处理
                    // currentAuthority: record.manage_categories,
                    currentAuthority: 'admin',
                };
            } else {
                result = {
                    status: 'error',
                    type,
                    currentAuthority: 'guest',
                };
            }
        } catch (err) {
            result = {
                status: 'error',
                type,
                currentAuthority: 'guest',
            };
        }

        return JSON.parse(JSON.stringify(result));
    }
}

module.exports = LoginService;