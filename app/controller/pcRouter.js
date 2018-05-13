'use strict';

const Controller = require('egg').Controller;
const tools = require('../utils/tool.js');

class RouterController extends Controller {
    async index() {
        // 最新活动
        const activity = await this.app.mysql.query(
            `
            SELECT a.*, u.nickname
            FROM activity_info a INNER JOIN user_info u on a.initiator = u.id
            ORDER BY create_time desc
            limit 0,6;
            `
        );

        // 热门分类
        const sort = await this.app.mysql.query(
            `
            SELECT p.id, count(*) pcount, pt.*
            FROM production_info p INNER JOIN production_type_info pt on p.sort = pt.id
            group by sort
            ORDER BY pcount DESC
            LIMIT 0,6;
            `
        );

        // 优秀认证师
        const certifiedArchitect = await this.app.mysql.query(
            `
            SELECT id, nickname, portrait, personal_statement, integral
            FROM user_info
            where sort = 2
            ORDER BY integral DESC
            limit 0,3;
            `
        );

        // 会员优秀作品
        const production = await this.app.mysql.query(
            `
            SELECT p.id, p.cover, p.comment_number, p.view_number, p.create_time
            FROM production_info p
            ORDER BY (p.comment_number+p.view_number) DESC,p.create_time DESC
            LIMIT 0,6;
            `
        );

        await this.ctx.render('pc/index.tpl', {
            activityData: JSON.parse(JSON.stringify(activity)),
            sortData: JSON.parse(JSON.stringify(sort)),
            certifiedArchitectData: JSON.parse(JSON.stringify(certifiedArchitect)),
            productionData: JSON.parse(JSON.stringify(production)),
        });
    }

    async activity() {
        // 热门进行中活动
        const activity = await this.app.mysql.query(
            `
            SELECT a.id, a.banner, a.comment_number, a.view_number, a.create_time
            FROM activity_info a
            WHERE from_unixtime(a.end_time/1000) > CURRENT_TIMESTAMP
            ORDER BY (a.comment_number+a.view_number) DESC,a.create_time DESC
            LIMIT 0,3;
            `
        );

        // 全部进行中活动
        const activityAll = await this.app.mysql.query(
            `
            SELECT a.*
            FROM activity_info a
            WHERE from_unixtime(a.end_time/1000) > CURRENT_TIMESTAMP
            ORDER BY (a.comment_number+a.view_number) DESC,a.create_time DESC
            LIMIT 3,1000;
            `
        );

        // 已结束活动
        const activityEnd = await this.app.mysql.query(
            `
            SELECT a.*
            FROM activity_info a
            WHERE  from_unixtime(a.end_time/1000) < CURRENT_TIMESTAMP
            ORDER BY (a.comment_number+a.view_number) DESC,a.create_time DESC
            LIMIT 0,3;
            `
        );

        await this.ctx.render('pc/activity.tpl', {
            activityData: JSON.parse(JSON.stringify(activity)),
            activityAllData: JSON.parse(JSON.stringify(activityAll)),
            activityEndData: JSON.parse(JSON.stringify(activityEnd)),
        });
    }

    async certifiedArchitect() {
        const user = await this.app.mysql.query(
            `
            SELECT id, nickname, portrait, personal_statement, integral
            FROM user_info
            where sort = 2
            ORDER BY integral DESC
            limit 0,6;
            `
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
        const collectionData = await this.app.mysql.query(
            `SELECT c.user_id,c.status as c_status,p.* FROM collection_info c INNER JOIN production_info p ON c.object_id = p.id WHERE c.user_id = ${id} ORDER BY create_time desc;`
        );

        // 我的作品
        const productionData = await this.app.mysql.query(
            `SELECT * FROM production_info WHERE author_id = ${id} ORDER BY create_time desc;`
        );

        for (let i = 0; i < productionData.length; i++) {
            tools.formatTime([productionData[i]]);
        }

        // 我的留言
        const comments = await this.app.mysql.query(
            `SELECT c.*,u.nickname,u.portrait FROM comments_info c inner join user_info u on c.user_id = u.id where c.personal_id=${id} and c.father_id = 0;`
        );
        comments.reverse();
        var commentsData = JSON.parse(JSON.stringify(comments));
        tools.formatTime(commentsData);

        await this.ctx.render('pc/personal_space.tpl', {
            personalData,
            productionData: JSON.parse(JSON.stringify(productionData)),
            collectionData,
            commentsData,
        });
    }

    async mySpace() {
        const id = this.ctx.query.userId;
        const personal = await this.app.mysql.get('user_info', { id });
        let personalData = JSON.parse(JSON.stringify(personal));
        tools.formatTime([personalData]);

        // 我的收藏
        const collectionData = await this.app.mysql.query(
            `SELECT c.user_id,c.status as c_status,p.* FROM collection_info c INNER JOIN production_info p ON c.object_id = p.id WHERE c.user_id = ${id} ORDER BY create_time desc;`
        );

        // 我的作品
        const productionData = await this.app.mysql.query(
            `SELECT * FROM production_info WHERE author_id = ${id} ORDER BY create_time desc;`
        );
        
        for (let i = 0; i < productionData.length; i++) {
            tools.formatTime([productionData[i]]);
        }

        // 我的留言
        const comments = await this.app.mysql.query(
            `SELECT c.*,u.nickname,u.portrait FROM comments_info c inner join user_info u on c.user_id = u.id where c.personal_id=${id} and c.father_id = 0;`
        );
        comments.reverse();
        var commentsData = JSON.parse(JSON.stringify(comments));
        tools.formatTime(commentsData);

        await this.ctx.render('pc/my_space.tpl', {
            personalData,
            productionData: JSON.parse(JSON.stringify(productionData)),
            collectionData,
            commentsData,
        });
    }

    async publishProduction() {
        await this.ctx.render('pc/publish_production.tpl');
    }

    async activityDetail () {
        // 活动详情
        const id = this.ctx.query.activityId;

        // 浏览量+1
        const updateViewNumber = await this.app.mysql.query(
            `update activity_info set view_number = view_number+1 where id = ${id};`
        );

        const result = await this.app.mysql.get('activity_info', { id });
        tools.formatTime([result]);
        let data = JSON.parse(JSON.stringify(result));

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

        data.productionData = productionData;
        data.commentsData = commentsData;

        await this.ctx.render('pc/activity_detail.tpl', {
            activityDetailData: data,
        });
    }

    async activityRule() {
        const id = this.ctx.query.activityId;

        const result = await this.app.mysql.get('activity_info', { id });
        tools.formatTime([result]);
        let data = JSON.parse(JSON.stringify(result));

        await this.ctx.render('pc/activity_rule.tpl', {
            activityDetailData: data,
        });
    }

    async joinActivity () {
        const id = this.ctx.query.activityId;
        const activity = await this.app.mysql.get('activity_info', { id });
        let activityData = JSON.parse(JSON.stringify(activity));
        tools.formatTime([activityData]);

        await this.ctx.render('pc/join_activity.tpl', {
            activityData,
        });
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
        const productionData = await this.handlePagination('production_info');

        await this.ctx.render('pc/sort.tpl', {
            productionData,
        });
    }

    async productionDetail () {
        const id = this.ctx.query.productionId;

        // 浏览量+1
        const updateViewNumber = await this.app.mysql.query(
            `update production_info set view_number = view_number+1 where id = ${id};`
        );

        const result = await this.app.mysql.query(
            `SELECT p.*,u.id as uid,u.nickname,u.portrait FROM production_info p inner join user_info u on p.author_id = u.id where p.id=${id};`
        );
        tools.formatTime([result[0]]);
        let data = JSON.parse(JSON.stringify(result[0]));

        // 作品留言
        const comments = await this.app.mysql.query(
            `SELECT c.*,u.nickname,u.portrait FROM comments_info c inner join user_info u on c.user_id = u.id where c.production_id=${id} and c.father_id = 0;`
        );
        comments.reverse();
        var commentsData = JSON.parse(JSON.stringify(comments));
        tools.formatTime(commentsData);

        let productionData = {
            data,
            commentsData,
        }

        productionData.data.production = productionData.data.production.split(',');

        await this.ctx.render('pc/production_detail.tpl', {
            productionData,
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

    /**
     * 根据前端请求分页返回数据
     * @param  {string} tableName     需要进行分页处理的表名
     * @return {object}     返回请求指定页数的响应体
     */
    async handlePagination(tableName) {
        const content = [];
        const query = this.ctx.request.query;
        query.currentPage = 0;
        query.curPageSize = 8;

        const total = await this.app.mysql.query(
            `SELECT COUNT(*) total FROM production_info WHERE sort = ${query.sortId};`
        );

        const totalRecord = JSON.parse(JSON.stringify(total))[0].total;
        let currentPage; // 返回当前请求的页数
        let curPageSize; // 返回当前页数据量
        const totalPages = parseInt(totalRecord / query.curPageSize);

        // 请求的页数大于数据总页数, 返回内容为空
        if (query.currentPage > totalPages + 1) {
            return {
                content,
                currentPage: query.currentPage,
                curPageSize: query.curPageSize,
                totalElements: totalRecord,
            };
        }

        if (totalPages > 0) {
            currentPage = query.currentPage * 1;
            curPageSize =
                query.currentPage > totalPages
                ? totalRecord - totalPages * query.curPageSize
                : query.curPageSize * 1;
        } else {
            currentPage = 1;
            curPageSize = totalRecord;
        }

        const limit = curPageSize * 1;
        const offset = currentPage > 1 ? (currentPage - 1) * query.curPageSize : 0;

        const result = await this.app.mysql.query(
            `SELECT * FROM production_info WHERE sort = ${query.sortId} ORDER BY create_time DESC limit ${offset},${limit};`
        );

        result.forEach(record => {
            content.push(JSON.parse(JSON.stringify(record))); // 将 RowDataPacket 对象转成 JSON 对象
        });

        return {
            content,
            currentPage,
            curPageSize,
            totalElements: totalRecord,
        };
    }
}

module.exports = RouterController;