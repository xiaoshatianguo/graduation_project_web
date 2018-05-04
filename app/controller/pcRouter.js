'use strict';

const Controller = require('egg').Controller;
const tools = require('../utils/tool.js');

class RouterController extends Controller {
    async index() {
        // 最新活动
        const activity = await this.app.mysql.query(
            'SELECT * FROM activity_info ORDER BY create_time desc limit 0,3;'
        );

        // 热门分类
        const sort = await this.app.mysql.query(
            'SELECT * FROM production_type_info ORDER BY create_time desc limit 0,3;'
        );

        // 优秀认证师
        const certifiedArchitect = await this.app.mysql.query(
            'SELECT * FROM user_info where sort = 2 ORDER BY create_time desc limit 0,3;'
        );

        // 会员优秀作品
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
        const activity = await this.app.mysql.query(
            'SELECT * FROM activity_info ORDER BY create_time desc limit 0,3;'
        );

        const activityAll = await this.app.mysql.query(
            'SELECT * FROM activity_info ORDER BY create_time desc;'
        );

        const activityEnd = await this.app.mysql.query(
            'SELECT * FROM activity_info ORDER BY create_time desc;'
        );

        await this.ctx.render('pc/activity.tpl', {
            activityData: JSON.parse(JSON.stringify(activity)),
            activityAllData: JSON.parse(JSON.stringify(activityAll)),
            activityEndData: JSON.parse(JSON.stringify(activityEnd)),
        });
    }

    async certifiedArchitect() {
        const user = await this.app.mysql.query(
            'SELECT * FROM user_info where sort = 2 ORDER BY create_time desc limit 0,3;'
        );

        const userAll = await this.app.mysql.query(
            'SELECT * FROM user_info where sort = 2 ORDER BY create_time desc'
        );

        await this.ctx.render('pc/certified_architect.tpl', {
            userData: JSON.parse(JSON.stringify(user)),
            userAllData: JSON.parse(JSON.stringify(userAll)),
        });
    }

    async personalSpace () {
        const id = this.ctx.query.userId;
        const personal = await this.app.mysql.get('user_info', { id });
        let personalData = JSON.parse(JSON.stringify(personal));

        // 我的收藏
        let myCollection = personalData.collectionIds;
        let collectionIds = [];
        let collectionDataArr = [];

        if(!!personalData.collectionIds) {
            collectionIds = personalData.collectionIds.split(',');
    
            for (let i = 0; i < collectionIds.length; i++) {
                let productionData = await this.app.mysql.get('production_info', { id: collectionIds[i] });
                tools.formatTime([productionData]);
                collectionDataArr.push(JSON.parse(JSON.stringify(productionData)));
            }
        }

        // 我的作品
        const productionData = await this.app.mysql.query(
            `SELECT * FROM production_info WHERE authorId = ${id} ORDER BY create_time desc;`
        );

        for (let i = 0; i < productionData.length; i++) {
            tools.formatTime([productionData[i]]);
        }

        await this.ctx.render('pc/personal_space.tpl', {
            personalData,
            productionData: JSON.parse(JSON.stringify(productionData)),
            collectionData: collectionDataArr,
        });
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

        // 参加该活动的作品及信息
        const production = await this.app.mysql.query(
            `SELECT p.*,u.nickname FROM production_info p inner join user_info u on p.author_id = u.id where activity_id=${id};`
        );
        var productionData = JSON.parse(JSON.stringify(production));
        tools.formatTime(productionData);

        // 活动评论处理
        const comments = await this.app.mysql.query(
            `SELECT c.*,u.nickname,u.portrait FROM comments_info c inner join user_info u on c.user_id = u.id where c.activity_id=${id} and c.father_id = 0;`
        );
        comments.reverse();
        var commentsData = JSON.parse(JSON.stringify(comments));
        tools.formatTime(commentsData);

        data.sort = sortData.name;
        data.productionData = productionData;
        data.commentsData = commentsData;

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
        const id = this.ctx.query.productionId;
        const result = await this.app.mysql.get('production_info', { id });
        tools.formatTime([result]);
        let data = JSON.parse(JSON.stringify(result));

        await this.ctx.render('pc/production_detail.tpl', {
            productionData: data,
        });
    }

    async login () {
        await this.ctx.render('/pc/login.tpl');
    }

    async register () {
        await this.ctx.render('/pc/register.tpl');
    }

    async loginVerify () {
        const ctx = this.ctx;
        const userData = ctx.request.body;

        let psd = userData.password;
        let d = tools.getMD5Password(psd);

        const result = await this.app.mysql.get('user_info', {
            email: userData.email,
        });

        if(result) {
            let record = JSON.parse(JSON.stringify(result));

            // 生成token并存储到session
            let info = userData.email + psd + new Date().valueOf();
            let token = tools.getMD5Password(info);
            ctx.cookies.set(userData.email, token, {
                maxAge: 24 * 3600 * 1000,
            });
            // console.log(ctx.cookies.get(userData.email));
            if(record.password == d) {
                // 登录成功
                let newRecord = {
                    id: result.id,
                    email: result.email,
                    // phone: result.phone,
                    nickname: result.nickname,
                    // name: result.name,
                    // sex: result.sex,
                    // age: result.age,
                    // address: result.address,
                    portrait: result.portrait,
                    // personal_statement: result.personal_statement,
                    // bgcover: result.bgcover,
                    token,
                };
                ctx.body = newRecord;
                ctx.status = 200;
            } else {
                ctx.body = {
                    msg: '密码错误！'
                };
                ctx.status = 403;
            }
        } else {
            ctx.body = {
                msg: '用户不存在'
            };
            ctx.status = 404;
        }
    }

    async logout () {
        const ctx = this.ctx;
        const userData = ctx.request.body;

        let email = userData.eamil;
        let token = userData.token;

        let curToken = ctx.cookies.get(userData.email);

        if(token == curToken) {
            ctx.cookies.set(userData.email, null);

            ctx.status = 201;
        }
    }

    async registerUser () {
        const ctx = this.ctx;
        const userData = ctx.request.body;

        let psd = userData.password;
        let d = tools.getMD5Password(psd);

        const result = await this.app.mysql.insert('user_info', {
            email: userData.eamil,
            nickname: '普通会员' + newDate().valueOf(),
            number: newDate().valueOf(),
            password: d,
            create_time: new Date().valueOf(),
        });

        const newRecord = await this.app.mysql.get(
            'user_info',
            {id: result.insertId}
        );

        ctx.body = JSON.parse(JSON.stringify(newRecord));
        ctx.status = 200;
    }
}

module.exports = RouterController;