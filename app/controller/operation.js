'use strict';

const Controller = require('egg').Controller;
const tools = require('../utils/tool.js');

class OperationController extends Controller {
    async uploadProduction() {
        const ctx = this.ctx;
        const productionData = ctx.request.body;
        console.log(productionData);

        const result = await this.app.mysql.insert('production_info', {
            name: productionData.name,
            author: productionData.author,
            sort: productionData.sort,
            production: productionData.production,
            cover: productionData.cover,
            banner: productionData.banner,
            describe: productionData.describe,
            photography_props: productionData.photography_props,
            photography_site: productionData.photography_site,
            content: productionData.content,
            create_time: new Date().valueOf(),
        });

        this.ctx.body = {
            msg: '提交作品成功',
        }
    }
}

module.exports = OperationController;