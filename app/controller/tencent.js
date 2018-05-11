'use strict';

const Controller = require('egg').Controller;
const tools = require('../utils/tool.js');
const COS = require('cos-nodejs-sdk-v5');

class TencentController extends Controller {
    async tencentUpload() {
        const ctx = this.ctx;
        // 获取文件流
        const stream = await this.ctx.getFileStream();

        let n = stream.filename.split(".");
        let suffix = n[n.length-1];
        let name = tools.getUuidFileName() + '.' + suffix;

        let cos = new COS({
            AppId: '1253637808',
            SecretId: 'AKIDJRL0ResIjupUt2oYu3wZwBBwTlqgLdle',
            SecretKey: 'nMiqjOq43nTv86pKabNvEI7j6D4f05uT',
        });

        let params = {
            Bucket : 'xiaosha-1253637808',
            Region : 'ap-guangzhou',
            Key: name,
            ContentLength : '1024000',
            Body: stream,
            onProgress: function (progressData) {
                console.log(progressData);
            },
        };
        cos.putObject(params, function(err, data) {
            if(err) {
                console.log('err:'+JSON.parse(err));
            } else {
                console.log('data:'+data);
            }
        });

        ctx.status = 200;
        ctx.body = {
            "code": 0, //0表示成功，其它失败
            "msg": "",
            "data": {
                "src": 'http://p1s12lchv.bkt.clouddn.com/',
            }
        };
    }
}

module.exports = TencentController;