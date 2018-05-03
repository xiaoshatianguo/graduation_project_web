'use strict';

const Controller = require('egg').Controller;
const tools = require('../utils/tool.js');

class OperationController extends Controller {
    // 上传作品处理
    async uploadProduction() {
        const ctx = this.ctx;
        const productionData = ctx.request.body;

        const result = await this.app.mysql.insert('production_info', {
            name: productionData.name,
            author_id: productionData.author_id,
            activity_id: productionData.activity_id,
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

    // 申请活动处理
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

    // 申请认证师处理
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

    // 分类信息返回
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

        // 插入评论表
        const result = await this.app.mysql.insert('comments_info', {
            user_id: commentData.user_id,
            reply_id: commentData.reply_id || 0,
            production_id: commentData.production_id || 0,
            activity_id: commentData.activity_id || 0,
            personal_id: commentData.personal_id || 0,
            content: commentData.content,
            create_time: new Date().valueOf(),
        });

        if(result.insertId) {
            ctx.status = 200;
            ctx.body = {
                msg: '评论成功',
                comment_id: result.insertId,
            };
        } else {
            ctx.status = 403;
            ctx.body = {
                err: result.message,
                msg: '评论失败',
            };
        }
    }
}

module.exports = OperationController;