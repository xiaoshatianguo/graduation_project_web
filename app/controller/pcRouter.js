'use strict';

const Controller = require('egg').Controller;

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
        await this.ctx.render('pc/activity_detail.tpl');
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
        await this.ctx.render('pc/sort.tpl');
    }

    async productionDetail () {
        await this.ctx.render('pc/production_detail.tpl');
    }
}

module.exports = RouterController;