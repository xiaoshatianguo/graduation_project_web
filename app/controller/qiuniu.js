'use strict';

const Controller = require('egg').Controller;
const tools = require('../utils/tool.js');
const qiniu = require('qiniu');

class QiuniuController extends Controller {
    async qiuniuUpload() {
        // 获取文件流
        const stream = await this.ctx.getFileStream();

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

        let key = tools.getUuidFileName();

        var config = new qiniu.conf.Config();
        // 空间对应的机房  华南机房
        config.zone = qiniu.zone.Zone_z2;

        var formUploader = new qiniu.form_up.FormUploader(config);
        var putExtra = new qiniu.form_up.PutExtra();
        var readableStream = stream; // 可读的流
        formUploader.putStream(uploadToken, key, readableStream, putExtra, function (respErr,
            respBody, respInfo) {
            if (respErr) {
                throw respErr;
            }
            if (respInfo.statusCode == 200) {
                console.log(respBody);
            } else {
                console.log(respInfo.statusCode);
                console.log(respBody);
            }
        });

        this.ctx.body = uploadToken;
    }
}

module.exports = QiuniuController;