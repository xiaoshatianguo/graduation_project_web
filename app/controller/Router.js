'use strict';

const Controller = require('egg').Controller;

class RouterController extends Controller {
    async index() {
        await this.ctx.render('index.tpl');
    }

    async activity() {
        await this.ctx.render('activity.tpl');
    }

    async certifiedArchitect() {
        await this.ctx.render('certified_architect.tpl');
    }

    async personalSpace () {
        await this.ctx.render('personal_space.tpl');
    }

    async activityDetail () {
        await this.ctx.render('activity_detail.tpl');
    }

    async joinActivity () {
        await this.ctx.render('join_activity.tpl');
    }

    async applyActivity () {
        await this.ctx.render('apply_activity.tpl');
    }

    async activityManage () {
        await this.ctx.render('activity_manage.tpl');
    }

    async applyCertifiedArchitect () {
        await this.ctx.render('apply_certified_architect.tpl');
    }

    async sort () {
        await this.ctx.render('sort.tpl');
    }

    async productionDetail () {
        await this.ctx.render('production_detail.tpl');
    }
}

module.exports = RouterController;