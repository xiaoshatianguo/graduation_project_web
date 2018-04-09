const Controller = require('egg').Controller;

module.exports = {
    /**
     * 更新和添加接口，对 body 参数进行处理
     * @param  {int} id     添加或更新时的 ID 值
     * @return {object}     返回经过处理的对象，用于插入数据库
     */
    async handleParams(id, reqBody) {
        const row = reqBody; // 表更新字段对象

        row.update_time = new Date();// 修改时间戳

        if (id) row.id = id;

        // 是否更新项目案例富文本
        // if (reqBody.mainbody) {
        // row.mainbody_mark = marked(reqBody.mainbody).replace(/\n|\r/g, '<br/>');
        // }

        // if (reqBody.case_link) {
        // // 拼接项目案例详情 URL, 生成二维码
        // const base64 = await QRCode.toDataURL(reqBody.case_link, {
        //     margin: 2,
        //     width: 200,
        // });
        // row.qrcode = base64;
        // }

        return row;
    },

    /**
     * 根据前端请求分页返回数据
     * @param  {string} tableName     需要进行分页处理的表名
     * @param  {string} query     api请求携带的url参数
     * @param  {string} filter     需要过滤的查询字段
     * @return {object}     返回请求指定页数的响应体
     */
    async handlePagination(tableName, query, filter) {
        const content = [];
        // 生成查询字段sql
        let filterSQL = '';
        let finalSQL = '';
        if(!!filter) {
            for(let i=0; i<filter.length; i++) {
                let filterElement = filter[i];
                let queryValue = query[`${filterElement}`];
                if(!!queryValue) {
                    filterSQL += `${filterElement} = ${queryValue} and `;
                }
            }
            if(!!filterSQL) {
                finalSQL = `where ${filterSQL}`;
            }
        }
        finalSQL = finalSQL.substring(0, finalSQL.length-4);

        const total = await this.mysql.query(
            `SELECT COUNT(*) total FROM ${tableName} ${finalSQL};`
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
        const orders = [['create_time', 'desc'], ['id', 'desc']];

        const result = await this.mysql.query(
            `SELECT * from ${tableName} ${finalSQL} ORDER BY id desc limit ${offset},${limit};`
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
    },

    /**
     * 封装统一的调用检查函数，可以在查询、创建和更新等 Service 中复用
     * @param {*} result 返回结果
     */
    async checkSuccess(result) {
        if (result.status !== 200) {
            const errorMsg = result.data && result.data.error_msg ? result.data.error_msg : 'unknown error';
            this.ctx.throw(result.status, errorMsg);
        }
        if (!result.data.success) {
            // 远程调用返回格式错误
            this.ctx.throw(500, 'remote response error', { data: result.data });
        }
    }
}