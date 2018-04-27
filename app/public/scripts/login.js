$('head').prepend("<script src='/public/tool.js' />");

/**
 * 登录登出相关操作及方法
 */
var userLoginInfo = cacheGet('userLoginInfo');

// 登录态显示
if(userLoginInfo) {
    logoutStatus(userLoginInfo);
} else {
    loginStatus();
}

// 登出操作
$(document).on('click', ".logout",function(){
    logout();
});

/**
 * 调用登出接口
 * @param {*} token 用户登录的token
 */
function logout() {
    var eamil = userLoginInfo.eamil;
    var token = userLoginInfo.token;

    $.ajax({
        type: 'post',
        url: '/api/logout',
        headers: {
            Accept: "application/json; charset=utf-8",
            Authorization: "token " + token
        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: {
            eamil,
            token,
        },
        complete: function(response) {
            // 清除session的用户登录信息
            sessionStorage.removeItem('userLoginInfo');
            loginStatus();
            location.href = '/';
        }
    })
}

/**
 * 未登录显示
 */
function loginStatus() {
    var token = userLoginInfo.token;
    
    $('.header-login').html(
        `
        <a href="/login" class="nav-li location-to-login">登录</a>
        <a href="/register" class="nav-li location-to-register">注册</a>
        `
    );
}

/**
 * 已登录显示，点击登出操作
 * @param {*} userLoginInfo 用户登录的userLoginInfo
 */
function logoutStatus(userLoginInfo) {
    var email = userLoginInfo.email;
    
    $('.header-login').html(
        `
        <a href="/login" class="nav-li">${email}</a>
        <a href="javascript:;" class="nav-li logout">登出</a>
        `
    );
}

/**
 * macro tip宏的统一事件触发
 */
$('.tip-cancel, .tip-input-cancel').on('click', function() {
    $('.cover').fadeOut();
    $('.tip-input').val('');
    $('.tip-error-show').fadeOut();
})

// type为alert时点击确定按钮操作
$('.tip-submit').on('click', function() {
    $('.cover').fadeOut();
    eval($(this).attr('opration'));
});

// type为inputTip时点击确定按钮操作
$('.tip-input-submit').click(function() {
    eval($(this).attr('opration'));
    // $('.tip-input').val('');
});

/**
 * qq登录处理
 */
// function qqLogin() {
//     var state = 'http://web.daolimen.com';
//     $.get({
//         url: 'http://web.daolimen.com/api/QQ/url?state='+state,
//         contentType: "application/json; charset=utf-8",
//         dataType: "json",
//         complete: function(response) {
//             location.href = JSON.parse(response.responseText).authorizeURL;
//         }
//     })
// }

/**
 * wechat登录处理
 */
// function wechatLogin() {
//     var state = 'http://web.daolimen.com';
//     $.get({
//         url: 'http://web.daolimen.com/api/WeChat/uri?stats='+state,
//         contentType: "application/json; charset=utf-8",
//         dataType: "json",
//         complete: function(response) {
//             location.href = JSON.parse(response.responseText).authorizeURL;
//         }
//     })
// }


/**
 * 发送验证码操作
 */
// function sendCode(type) {
//     if(type === 'phone') {
//         phone = $('.phone-input').val().trim();
//         var phoneReg = /^[1][3,4,5,7,8][0-9]{9}$/;
    
//         if(phoneReg.test(phone)) {
//             setTimeout(function() {
//                 $('.circle-loading-ctr').show();
//             });

//             $.ajax({
//                 type: 'get',
//                 url: 'http://web.daolimen.com/api/user/verCode?phone='+phone,
//                 complete: function(response) {
//                     if (response.status * 1 === 200) {
//                         setTimeout(function() {
//                             tipController('.vercode-sended-tip .cover');
//                             $('.get-code-btn').hide();
//                             $('.count-down-btn').show();
//                             changeTimeInterval = setInterval(changeTime, 1000);
//                             $('.circle-loading-ctr').hide();
//                         }, 1000);
//                     } else {
//                         $('.error-tip .content').text(response.responseJSON.msg)
//                         tipController('.error-tip .cover');
//                     }
//                 }
//             })
//         } else {
//             $('.error-tip .content').text('请填写正确的手机号！')
//             tipController('.error-tip .cover');
//         }
//     } else if(type === 'email'){
//         email = $('.email-input').val().trim();
//         var emailReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        
//         if(emailReg.test(email)) {
//             setTimeout(function() {
//                 $('.circle-loading-ctr').show();
//             });

//             $.ajax({
//                 type: 'get',
//                 url: 'http://web.daolimen.com/api/user/verCode?mail='+email,
//                 complete: function(response) {
//                     if (response.status * 1 === 200) {
//                         setTimeout(function() {
//                             tipController('.vercode-sended-tip .cover');
//                             $('.get-code-btn').hide();
//                             $('.count-down-btn').show();
//                             changeTimeInterval = setInterval(changeTime, 1000);
//                             $('.circle-loading-ctr').hide();
//                         }, 1000);

//                     } else {
//                         setTimeout(function() {
//                             $('.circle-loading-ctr').hide();

//                             $('.error-tip .content').text(response.responseJSON.msg);
//                             tipController('.error-tip .cover');
//                         }, 1000);
//                     }
//                 }
//             })
//         } else {
//             $('.error-tip .content').text('请填写正确的邮箱！')
//             tipController('.error-tip .cover');
//         }
//     }
// }

/**
 * 绑定手机操作
 */
// function bindPhone() {
//     var phone = $('.bind-phone-input').find('.tip-input').val().trim();
//     var phoneReg = /^[1][3,4,5,7,8][0-9]{9}$/;
    
//     if(phoneReg.test(phone)) {
//         $.ajax({
//             type: 'put',
//             url: 'http://web.daolimen.com/api/user/bind',
//             headers: {
//                 Accept: "application/json; charset=utf-8",
//                 Authorization: "token " + userLoginInfo.token
//             },
//             contentType: "application/json; charset=utf-8",
//             data: JSON.stringify({
//                 phone
//             }),
//             success: function(result) {
//                 var userLoginInfo = cacheGet('userLoginInfo');
//                 userLoginInfo.phone = result.phone
//                 cacheSet('userLoginInfo', userLoginInfo);
//                 $('.cover').fadeOut();
//                 $('.bind-phone-input').find('.tip-input').val('');
//             },
//             error: function(response) {
//                 $('.tip-error-show').fadeOut();
//                 $('.bind-phone-input .cover').fadeOut();

//                 $('.error-tip .content').text(response.responseJSON.msg)
//                 tipController('.error-tip .cover', 2000);

//                 setTimeout(function() {
//                     $('.bind-phone-input').find('.tip-input').val('');
//                     $('.bind-phone-input .cover').fadeIn();
//                 }, 2000);
//             }
//         })
//     } else {
//         $('.tip-error-show').text('请输入正确的手机号！')
//         $('.tip-error-show').fadeIn();
//     }
// }

