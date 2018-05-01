'use strict';

const Controller = require('egg').Controller;
const tools = require('../utils/tool.js');

class OperationController extends Controller {
    async uploadProduction() {
        const ctx = this.ctx;
        const productionData = ctx.request.body;

        const result = await this.app.mysql.insert('production_info', {
            name: productionData.name,
            author: productionData.author,
            // sort: productionData.sort,
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

    async applyActivity() {
        const ctx = this.ctx;
        const productionData = ctx.request.body;

        console.log(productionData);

        const result = await this.app.mysql.insert('activity_info', {
            name: productionData.name,
            initiator: productionData.initiator,
            // sort: uploadData.sort,
            topic: productionData.topic,
            describe: productionData.describe,
            content: productionData.content,
            rule: productionData.rule,
            cover: productionData.cover,
            banner: productionData.banner,
            create_time: new Date().valueOf(),
            start_time: new Date(productionData.start_time).valueOf(),
            end_time: new Date(productionData.end_time).valueOf(),
        });

        this.ctx.body = {
            msg: '申请活动信息提交成功',
        }
    }

    async sort() {
        const ctx = this.ctx;
        const result = await this.app.mysql.select('production_type_info');

        let resultData = JSON.parse(JSON.stringify(result));
        tools.formatTime(resultData);
            
        ctx.status = 200;
        ctx.body = resultData;
    }
}

module.exports = OperationController;