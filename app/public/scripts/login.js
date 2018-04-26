$('head').prepend("<script src='/public/tool.js' />");

/**
 * 登录登出相关操作及方法
 */
var userLoginInfo = cacheGet('userLoginInfo');

// 登录态显示
if(userLoginInfo) {
    logoutStatus(userLoginInfo);
    showCartNumber();
} else {
    loginStatus();
}

// 登出操作
$('#logout').on('click', function() {
    $('.login-out-tip .cover').fadeIn();
})

// qq登录
$(document).on('click', '.login-qq', function() {
    qqLogin();
})

// wechat登录
$(document).on('click', '.login-wechat', function() {
    wechatLogin();
})

// 购物车操作处理
$(document).on('click', '.login-cart', function(){
    if(userLoginInfo) {
        token = userLoginInfo.token;
        location.href = `/shopping_cart?t=${token}`;
    } else {
        location.href = '/shopping_cart';
    }
})

/**
 * 显示购物车商品数量
 */
function showCartNumber() {
    $.get({
        url: 'http://web.daolimen.com/api/shopCart/list',
        headers: {
            Accept: "application/json; charset=utf-8",
            Authorization: "token " + userLoginInfo.token
        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(result) {
            $('.cart-number').text(result.length);
        }
    })
}

/**
 * 调用登出接口
 * @param {*} token 用户登录的token
 */
function logout() {
    var token = userLoginInfo.token;
    $.ajax({
        type: 'PUT',
        url: 'http://web.daolimen.com/api/user',
        headers: {
            Accept: "application/json; charset=utf-8",
            Authorization: "token " + token
        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        complete: function(response) {
            location.href = '/';
            // 清除session的用户登录信息
            sessionStorage.removeItem('userLoginInfo');
            loginStatus();
        }
    })
}

/**
 * 未登录显示
 */
function loginStatus() {
    var token = userLoginInfo.token;
    
    $('.login').html(
        `
        <a href="/login" class="login-btn">登录<br><span class="login-btn-en">LOGIN</span></a>
        <a class="login-qq login-icon" href="javascript:;">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-qq"></use>
            </svg>
        </a>
        <a class="login-wechat login-icon" href="javascript:;">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-wechat"></use>
            </svg>
        </a>
        <a class="login-phone login-icon" href="/fast_login">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-tel-copy"></use>
            </svg>
        </a>
        <a class="login-cart" href="javascript:;">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-gouwuche1"></use>
            </svg>
        </a>
        <a class="cart-number" href="javascript:;">0</a>
        `
    );
}

/**
 * 已登录显示，点击登出操作
 * @param {*} userName 用户登录的userName
 */
function logoutStatus(userName) {
    var token = userLoginInfo.token;
    $('.login').html(
        `
        <a class="username single-ellipsis" href="/personal_center?userLoginInfo=${token}">${userLoginInfo.userName || userLoginInfo.qqnickName || userLoginInfo.weChatNickName || ''}</a>
        <a href="javascript:;" class="login-btn" id="logout">登出<br><span class="login-btn-en">LOG OUT</span></a>
        <a class="login-cart" href="javascript:;">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-gouwuche1"></use>
            </svg>
        </a>
        <a class="cart-number" href="javascript:;">0</a>
        `
    )
}

/**
 * qq登录处理
 */
function qqLogin() {
    var state = 'http://web.daolimen.com';
    $.get({
        url: 'http://web.daolimen.com/api/QQ/url?state='+state,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        complete: function(response) {
            location.href = JSON.parse(response.responseText).authorizeURL;
        }
    })
}

/**
 * wechat登录处理
 */
function wechatLogin() {
    var state = 'http://web.daolimen.com';
    $.get({
        url: 'http://web.daolimen.com/api/WeChat/uri?stats='+state,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        complete: function(response) {
            location.href = JSON.parse(response.responseText).authorizeURL;
        }
    })
}


/**
 * 发送验证码操作
 */
function sendCode(type) {
    if(type === 'phone') {
        phone = $('.phone-input').val().trim();
        var phoneReg = /^[1][3,4,5,7,8][0-9]{9}$/;
    
        if(phoneReg.test(phone)) {
            setTimeout(function() {
                $('.circle-loading-ctr').show();
            });

            $.ajax({
                type: 'get',
                url: 'http://web.daolimen.com/api/user/verCode?phone='+phone,
                complete: function(response) {
                    if (response.status * 1 === 200) {
                        setTimeout(function() {
                            tipController('.vercode-sended-tip .cover');
                            $('.get-code-btn').hide();
                            $('.count-down-btn').show();
                            changeTimeInterval = setInterval(changeTime, 1000);
                            $('.circle-loading-ctr').hide();
                        }, 1000);
                    } else {
                        $('.error-tip .content').text(response.responseJSON.msg)
                        tipController('.error-tip .cover');
                    }
                }
            })
        } else {
            $('.error-tip .content').text('请填写正确的手机号！')
            tipController('.error-tip .cover');
        }
    } else if(type === 'email'){
        email = $('.email-input').val().trim();
        var emailReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        
        if(emailReg.test(email)) {
            setTimeout(function() {
                $('.circle-loading-ctr').show();
            });

            $.ajax({
                type: 'get',
                url: 'http://web.daolimen.com/api/user/verCode?mail='+email,
                complete: function(response) {
                    if (response.status * 1 === 200) {
                        setTimeout(function() {
                            tipController('.vercode-sended-tip .cover');
                            $('.get-code-btn').hide();
                            $('.count-down-btn').show();
                            changeTimeInterval = setInterval(changeTime, 1000);
                            $('.circle-loading-ctr').hide();
                        }, 1000);

                    } else {
                        setTimeout(function() {
                            $('.circle-loading-ctr').hide();

                            $('.error-tip .content').text(response.responseJSON.msg);
                            tipController('.error-tip .cover');
                        }, 1000);
                    }
                }
            })
        } else {
            $('.error-tip .content').text('请填写正确的邮箱！')
            tipController('.error-tip .cover');
        }
    }
}

/**
 * 绑定手机操作
 */
function bindPhone() {
    var phone = $('.bind-phone-input').find('.tip-input').val().trim();
    var phoneReg = /^[1][3,4,5,7,8][0-9]{9}$/;
    
    if(phoneReg.test(phone)) {
        $.ajax({
            type: 'put',
            url: 'http://web.daolimen.com/api/user/bind',
            headers: {
                Accept: "application/json; charset=utf-8",
                Authorization: "token " + userLoginInfo.token
            },
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                phone
            }),
            success: function(result) {
                var userLoginInfo = cacheGet('userLoginInfo');
                userLoginInfo.phone = result.phone
                cacheSet('userLoginInfo', userLoginInfo);
                $('.cover').fadeOut();
                $('.bind-phone-input').find('.tip-input').val('');
            },
            error: function(response) {
                $('.tip-error-show').fadeOut();
                $('.bind-phone-input .cover').fadeOut();

                $('.error-tip .content').text(response.responseJSON.msg)
                tipController('.error-tip .cover', 2000);

                setTimeout(function() {
                    $('.bind-phone-input').find('.tip-input').val('');
                    $('.bind-phone-input .cover').fadeIn();
                }, 2000);
            }
        })
    } else {
        $('.tip-error-show').text('请输入正确的手机号！')
        $('.tip-error-show').fadeIn();
    }
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