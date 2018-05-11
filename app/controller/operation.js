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

    // 申请活动处理
    async applyActivity() {
        const ctx = this.ctx;
        const productionData = ctx.request.body;

        const result = await this.app.mysql.insert('activity_info', {
            name: productionData.name,
            initiator: productionData.initiator,
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

        if(commentData.father_id != 0) {
            const changeReplyNumber = await this.app.mysql.query(
                `update comments_info set number = number+1 WHERE id = ${commentData.father_id};`
            );
        }

        if(commentData.to_id != 0) {
            if(commentData.child_father_id != 0) {
                const changeReplyChildNumber = await this.app.mysql.query(
                    `update comments_info set number = number+1 WHERE id = ${commentData.child_father_id};`
                );
            }
        }

        // 插入评论表
        const result = await this.app.mysql.insert('comments_info', {
            user_id: commentData.user_id,
            father_id: commentData.father_id || 0,
            to_id: commentData.to_id || 0,
            production_id: commentData.production_id || 0,
            activity_id: commentData.activity_id || 0,
            personal_id: commentData.personal_id || 0,
            content: commentData.content,
            create_time: new Date().valueOf(),
        });

        // 作品留言量+1
        if(commentData.production_id != 0) {
            const updateCommentNumber = await this.app.mysql.query(
                `update production_info set comment_number = comment_number+1 where id = ${commentData.production_id};`
            );
        }

        // 活动留言量+1
        if(commentData.activity_id != 0) {
            const updateCommentNumber = await this.app.mysql.query(
                `update activity_info set comment_number = comment_number+1 where id = ${commentData.activity_id};`
            );
        }

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

    // 展示子评论
    async childComment() {
        const ctx = this.ctx;
        const fatherId = ctx.query.father_id;

        const comment = await this.app.mysql.query(
            `SELECT c1.*,u1.nickname as u1_nickname,null as u2_nickname,null as c2_id,null as c2_content from comments_info c1,user_info u1
            where c1.user_id=u1.id and c1.to_id=0 and c1.father_id=${fatherId}
            UNION ALL
            select c1.*,u1.nickname as u1_nickname,u2.nickname u2_nickname,c2.id as c2_id,c2.content as c2_content from comments_info c1,user_info u1,comments_info c2,user_info u2
            where c1.user_id=u1.id and c1.to_id=c2.id and c2.user_id=u2.id and c1.father_id=${fatherId}
            `
        );
        comment.reverse();

        var commentData = JSON.parse(JSON.stringify(comment));
        tools.formatTime(commentData);

        ctx.status = 200;
        ctx.body = commentData;
    }

    // 评论点赞处理
    async commentLike() {
        const ctx = this.ctx;
        const likeData = ctx.request.body;

        if(!!likeData.comment_id && !!likeData.user_id) {
            // 查询点赞表，是否重复点赞
            const likeGet = await this.app.mysql.get('like_info', {
                user_id: likeData.user_id,
                comment_id: likeData.comment_id,
            });
    
            let like;
            if(!!likeGet) {
                like = await this.app.mysql.query(
                    `update like_info set status = !status where id = ${likeGet.id};`
                );

                ctx.status = 200;
                ctx.body = {
                    msg: '点赞成功或取消点赞',
                }
            } else {
                // 插入点赞表
                like = await this.app.mysql.insert('like_info', {
                    user_id: likeData.user_id,
                    comment_id: likeData.comment_id,
                    create_time: new Date().valueOf(),
                })
    
                // 评论点赞数+1
                const changeStarNumber = await this.app.mysql.query(
                    `update comments_info set star = star+1 where id = ${likeData.comment_id};`
                );

                if(!!like.insertId) {
                    ctx.status = 200;
                    ctx.body = {
                        msg: '点赞成功',
                    }
                }
            }
        } else {
            ctx.status = 403;
            ctx.body = {
                msg: '点赞失败',
            }
        }
    }

    // 评论删除处理
    async commentDelete() {
        const ctx = this.ctx;
        const deleteData = ctx.request.body;

        if(!!deleteData.delete_id) {
            const deleteComment = await this.app.mysql.update(
                'comments_info',
                {
                    id: deleteData.delete_id,
                    is_delete: 1,
                }
            );
            console.log(deleteComment);
        }

        ctx.status = 200;
        ctx.body = {
            msg: '删除评论成功',
        }
    }

    // 关注处理
    async attention() {
        const ctx = this.ctx;
        const attentionData = ctx.request.body;

        // 查询关注表，是否重复关注
        const attentionGet = await this.app.mysql.get('attention_info', {
            user_id: attentionData.user_id,
            object_id: attentionData.object_id,
            activity_id: attentionData.activity_id,
        });

        let attention;
        if(!!attentionGet) {
            attention = await this.app.mysql.query(
                `update attention_info set status = !status where id = ${attentionGet.id};`
            );

            ctx.status = 200;
            ctx.body = {
                attentionGet,
                msg: '关注成功或取消关注',
            }
        } else {
            // 插入关注表
            attention = this.app.mysql.insert('attention_info', {
                user_id: attentionData.user_id,
                object_id: attentionData.object_id || 0,
                activity_id: attentionData.activity_id || 0,
            })

            ctx.status = 200;
            ctx.body = {
                msg: '关注成功',
            }
        }
    }

    // 获取关注信息处理
    async attentionGet() {
        const ctx = this.ctx;
        const attentionData = ctx.request.body;

        // 查询关注表
        const attentionGet = await this.app.mysql.get('attention_info', {
            user_id: attentionData.user_id,
            object_id: attentionData.object_id || 0,
            activity_id: attentionData.activity_id || 0,
        });

        if(!!attentionGet) {
            if(attentionGet.status == 0) {
                ctx.status = 200;
                ctx.body = {
                    msg: '已关注',
                }
            } else {
                ctx.status = 200;
                ctx.body = {
                    msg: '未关注',
                }
            }
            
        } else {
            ctx.status = 200;
            ctx.body = {
                msg: '未关注',
            }
        }
    }

    // 个人中心修改资料
    async updatePersonalData() {
        const ctx = this.ctx;
        const personData = ctx.request.body;

        const updatePersonalData = this.app.mysql.update('user_info',{
            id: personData.id,
            nickname: personData.nickname,
            email: personData.email,
            phone: personData.phone,
            name: personData.name,
            sex: personData.sex,
            age: personData.age,
            address: personData.address,
            bgcover: personData.bgcover,
            portrait: personData.portrait,
            update_time: new Date().valueOf(),
        });

        ctx.status = 200;
        ctx.body = {
            msg: '修改成功',
        }
    }

    // 处理作品分类页面流加载数据
    async flowLoad() {
        const productionData = await this.handlePagination('production_info');

        this.ctx.status = 200;
        this.ctx.body = productionData;
    }

    /**
     * 根据前端请求分页返回数据
     * @param  {string} tableName     需要进行分页处理的表名
     * @return {object}     返回请求指定页数的响应体
     */
    async handlePagination(tableName) {
        const content = [];
        const query = this.ctx.request.query;

        const total = await this.app.mysql.query(
            `SELECT COUNT(*) total FROM production_info WHERE sort = ${query.id};`
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
            `SELECT * FROM production_info WHERE sort = ${query.id} ORDER BY create_time DESC, id DESC limit ${offset},${limit};`
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

module.exports = OperationController;