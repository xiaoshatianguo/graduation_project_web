'use strict';

const Controller = require('egg').Controller;
const tools = require('../utils/tool.js');
const qiniu = require('qiniu');

class QiuniuController extends Controller {
    async qiuniuUpload() {
        const ctx = this.ctx;
        // 获取文件流
        const stream = await this.ctx.getFileStream();

        let n = stream.filename.split(".");
        let suffix = n[n.length-1];

        // 七牛云的密钥
        const accessKey = 'ht4iKDMezt5ABEkd6srAVLE9ZcN6wV5X2acMe4SL';
        const secretKey = 'rWQWu39hG2JXxhjvmLOLhzqN5dqYhBsXxGYkAnys';
        const mac = new qiniu.auth.digest.Mac(accessKey, secretKey);
    
        const options = {
          scope: 'xiaosha', //  存储空间名称
          expires: 7200,
        };
    
        const putPolicy = new qiniu.rs.PutPolicy(options);
        const uploadToken = putPolicy.uploadToken(mac);

        let key = tools.getUuidFileName() + '.' + suffix;

        let config = new qiniu.conf.Config();
        // 空间对应的机房  华南机房
        config.zone = qiniu.zone.Zone_z2;

        let formUploader = new qiniu.form_up.FormUploader(config);
        let putExtra = new qiniu.form_up.PutExtra();
        let readableStream = stream; // 可读的流

        formUploader.putStream(uploadToken, key, readableStream, putExtra, function (respErr, respBody, respInfo) {
            if (respErr) {
                throw respErr;
            }
            if (respInfo.statusCode == 200) {
                console.log('respBody:'+ respBody);
            } else {
                console.log('respInfo.statusCode:'+respInfo.statusCode);
                console.log('respBody:'+respBody);
            }
        });

        ctx.status = 200;
        ctx.body = {
            "code": 0, //0表示成功，其它失败
            "msg": "",
            "data": {
                "src": 'http://p1s12lchv.bkt.clouddn.com/' + key,
            }
        };
    }
}

module.exports = QiuniuController;