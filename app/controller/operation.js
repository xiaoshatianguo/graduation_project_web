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

    async applyCertifiedArchitect() {
        const ctx = this.ctx;
        const productionData = ctx.request.body;

        const result = await this.app.mysql.update('user_info', {
            id: productionData.id,
            name: productionData.name,
            qq: productionData.qq,
            wechat: productionData.wechat,
            personal_describe: productionData.personal_describe,
            prize: productionData.prizeSrc,
            certificate: productionData.certificateSrc,
            update_time: new Date().valueOf(),
            is_apply_certificate: 1,
        });

        this.ctx.body = {
            msg: '申请认证师提交成功',
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

    //评论处理
    async comment() {
        const ctx = this.ctx;
        const commentData = ctx.request.body;

        // 评论表
        const result = await this.app.mysql.insert('comments_info', {
            reviewers: commentData.reviewers,
            receiver: commentData.receiver,
            sort: commentData.sort,
            content: commentData.content,
            create_time: new Date().valueOf(),
        });

        // 作品评论入库
        if(commentData.sort == 0) {
            
        }

        // 活动评论入库
        if(commentData.sort == 1) {

        }

        // 个人中心评论入库
        if(commentData.sort == 2) {
            
        }

        console.log(commentData.triggerId);

        console.log(result);

        const newRecord = await this.app.mysql.get(
            'comments_info',
            {id: result.insertId}
        );

        let resultData = JSON.parse(JSON.stringify(result));
        tools.formatTime(resultData);
            
        ctx.status = 200;
        ctx.body = resultData;
    }
}

module.exports = OperationController;