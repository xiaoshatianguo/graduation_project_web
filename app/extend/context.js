const Controller = require('egg').Controller;

module.exports = {
    /**
     * 根据前端请求分页返回数据
     * @param  {string} tableName     需要进行分页处理的表名
     * @return {object}     返回请求指定页数的响应体
     */
    async handlePagination(tableName) {
        const content = [];
        const query = this.request.query;

        const total = await this.mysql.query(
            `SELECT COUNT(*) total FROM ${tableName};`
            // `SELECT a.*,d.sort_name FROM department_detail d inner join ${tableName} a on a.department = d.id;`
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
            `SELECT * from ${currentEditTable} ORDER BY id desc;`
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