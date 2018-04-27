'use strict';

const Service = require('egg').Service;
const nodemailer = require('nodemailer');

class sendEmailService extends Service {
    constructor(ctx) {
        super(ctx);
    }

    async index(email) {
        let code;

        if(this.check(email)) {
            code = await this.createCode();
            // 存储到cookies
            this.ctx.cookies.set(email, code, {
                maxAge: 5 * 60 * 1000,
            });
            this.sendEmail(code, email);
        }

        return code;
    }

    // 邮箱校验
    check(obj) {
        let reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
        if (obj === "") {
            //输入不能为空
            console.log("邮箱输入不能为空!");
            return false;
        } else if (!reg.test(obj)) {
            //正则验证不通过，格式不对
            console.log("邮箱验证不通过!");
            return false;
        } else {
            console.log("邮箱校验通过！");
            return true;
        }
    }

    /**
     * 验证码生成
     */
    createCode() {
        /*随机生成4位验证码*/
        /*step1:将所有字母，数字装入一个数组备用*/
        var codes=[];
        //数字:48-57;unicode编码
        for(var i=48;i<57;codes.push(i),i++);
        //大写字母:65-90;unicode编码
        for(var i=60;i<90;codes.push(i),i++);
        //小写字母:97-122;unicode编码
        for(var i=97;i<122;codes.push(i),i++);
        var arr=[];
        for(var i=0;i<4;i++) {   //从0-61之间取随机数
            var index = Math.floor(Math.random() * (61 - 0 + 1) + 0);
            var char = String.fromCharCode(codes[index]);
            arr.push(char);
        }
        /*console.log(arr);*/
        var code=arr.join("");
        return code;
    }

    /**
       * 邮件发送
       *
       * @param {object} result 需要发送的数据对象
       */
    sendEmail(code, email) {
        // Generate test SMTP service account from ethereal.email
        // Only needed if you don't have a real mail account for testing
        nodemailer.createTestAccount((err, account) => {
            // create reusable transporter object using the default SMTP transport
            const transporter = nodemailer.createTransport({
                host: 'smtp.qq.com',
                port: 465,
                secure: true, // true for 465, false for other ports
                auth: {
                    user: '869074486@qq.com', // generated ethereal user
                    pass: 'onwdajjarjqabeha', // generated ethereal password
                },
            });

            // setup email data with unicode symbols
            const mailOptions = {
                from: `【YY摄影】   <869074486@qq.com>`, // sender address
                to: `${email}`, // list of receivers
                subject: 'Hello,Here is yy website.', // Subject line
                text: `【YY摄影】验证码`, // plain text body
                html: `<p>您好，您的yy摄影网站验证码为：<b>${code}</b>，请在五分钟内进行校验！</p>
               `, // html body
            };

            // send mail with defined transport object
            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    return console.log(error);
                }
                console.log('Message sent: %s', info.messageId);
                // Preview only available when sending through an Ethereal account
                console.log('Preview URL: %s', nodemailer.getTestMessageUrl(info));

                // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>
                // Preview URL: https://ethereal.email/message/WaQKMgKddxQDoou...
            });
        });
    }
}

module.exports = sendEmailService;