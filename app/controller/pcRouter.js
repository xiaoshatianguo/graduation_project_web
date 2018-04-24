'use strict';

const Controller = require('egg').Controller;

const tools = require('../utils/tool.js');

class RouterController extends Controller {
    async index() {
        const activity = await this.app.mysql.query(
            'SELECT * FROM activity_info ORDER BY create_time desc limit 0,3;'
        );

        const sort = await this.app.mysql.query(
            'SELECT * FROM production_type_info ORDER BY create_time desc limit 0,3;'
        );

        const certifiedArchitect = await this.app.mysql.query(
            'SELECT * FROM user_info where sort = 2 ORDER BY create_time desc limit 0,3;'
        );

        const production = await this.app.mysql.query(
            'SELECT * FROM production_info ORDER BY create_time desc limit 0,3;'
        );

        await this.ctx.render('pc/index.tpl', {
            activityData: JSON.parse(JSON.stringify(activity)),
            sortData: JSON.parse(JSON.stringify(sort)),
            certifiedArchitectData: JSON.parse(JSON.stringify(certifiedArchitect)),
            productionData: JSON.parse(JSON.stringify(production)),
        });
    }

    async activity() {
        await this.ctx.render('pc/activity.tpl');
    }

    async certifiedArchitect() {
        await this.ctx.render('pc/certified_architect.tpl');
    }

    async personalSpace () {
        await this.ctx.render('pc/personal_space.tpl');
    }

    async activityDetail () {
        // 活动详情
        const id = this.ctx.query.activityId;
        const result = await this.app.mysql.get('activity_info', { id });
        tools.formatTime([result]);
        let data = JSON.parse(JSON.stringify(result));

        // 活动所属种类
        const sort = await this.app.mysql.get('production_type_info', { number: data.sort });
        let sortData = JSON.parse(JSON.stringify(sort));

        // 参加该活动的作品信息
        let productionIds = [];
        let productionDataArr = [];

        if(!!data.productionIds) {
            productionIds = data.productionIds.split(',');
    
            for (let i = 0; i < productionIds.length; i++) {
                let productionData = await this.app.mysql.get('production_info', { id: productionIds[i] });
                tools.formatTime([productionData]);
                productionDataArr.push(JSON.parse(JSON.stringify(productionData)));
            }
        }

        data.sort = sortData.name;
        data.productionDataArr = productionDataArr;

        await this.ctx.render('pc/activity_detail.tpl', {
            activityDetailData: data,
        });
    }

    async joinActivity () {
        await this.ctx.render('pc/join_activity.tpl');
    }

    async applyActivity () {
        await this.ctx.render('pc/apply_activity.tpl');
    }

    async activityManage () {
        await this.ctx.render('pc/activity_manage.tpl');
    }

    async applyCertifiedArchitect () {
        await this.ctx.render('pc/apply_certified_architect.tpl');
    }

    async sort () {
        const id = this.ctx.query.sortId;
        const productionData = await this.app.mysql.query(
            `SELECT * FROM production_info WHERE sort = ${id} ORDER BY create_time desc;`
        );
        for (let i = 0; i < productionData.length; i++) {
            tools.formatTime([productionData[i]]);
        }

        await this.ctx.render('pc/sort.tpl', {
            productionData: JSON.parse(JSON.stringify(productionData)),
        });
    }

    async productionDetail () {
        await this.ctx.render('pc/production_detail.tpl');
    }
}

module.exports = RouterController;