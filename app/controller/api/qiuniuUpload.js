'use strict';

const qiniu = require('qiniu');
const Controller = require('egg').Controller;

/**
 *  将域名token 返回给前端用于服务器上传图片
 *
 * @class QiuniuUploadController
 * @extends {Controller}
 */
class QiuniuUploadController extends Controller {
  async qiuniuUpload() {
    const accessKey = 'ht4iKDMezt5ABEkd6srAVLE9ZcN6wV5X2acMe4SL';
    const secretKey = 'rWQWu39hG2JXxhjvmLOLhzqN5dqYhBsXxGYkAnys';
    const mac = new qiniu.auth.digest.Mac(accessKey, secretKey);

    const options = {
      scope: 'xiaosha', //  存储空间名称
      expires: 7200,
    };

    const putPolicy = new qiniu.rs.PutPolicy(options);
    const uploadToken = putPolicy.uploadToken(mac);

    if (uploadToken) {
      this.ctx.body = uploadToken;
    }
  }
}

module.exports = QiuniuUploadController;
