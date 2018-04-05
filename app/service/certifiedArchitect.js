'use strict';

const Service = require('egg').Service;
const currentEditTable = 'user_info'; // 当前操作的表名

class CertifiedArchitectService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 用户列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await this.handlePagination(currentEditTable);

        this.app.checkSuccess(result);

        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 添加用户
     */
    async create(params) {
        const result = await this.app.mysql.insert(currentEditTable, {
            number: params.number,
            password: params.password,
            phone: params.phone,
            integral: params.integral,
            create_time: new Date(),
            status: params.status,
            sort: "1",
        });

        const newRecord = await this.app.mysql.get(
            currentEditTable,
            {id: result.insertId}
        );

        this.app.checkSuccess(newRecord);

        return JSON.parse(JSON.stringify(newRecord));
    }

    /**
     * 修改用户信息
     */
    async update(params) {
        await this.app.mysql.update(currentEditTable, params);

        const result = await this.app.mysql.get(currentEditTable, {
            id: params.id,
          });
          
        return JSON.parse(JSON.stringify(result));
    }

    /**
     * 删除用户
     */
    async delete(params) {
        const result = await this.app.mysql.delete(
            currentEditTable, 
            {id: params},
        );

        this.app.checkSuccess(result);

        return result;
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
            `SELECT COUNT(*) total FROM ${tableName} where sort=2;`
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

        const result = await this.app.mysql.query(
            `SELECT * from ${tableName} where sort=2 ORDER BY id desc;`
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

module.exports = CertifiedArchitectService;