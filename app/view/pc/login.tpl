{% extends "./template/template.tpl" %}
{% import "pc/macro/tip_cover.tpl" as tipCover %}

{% block tip %}
<div class="login-out-tip">
    {{ tipCover.tip(type="alert", msg ='确定退出当前账号？', time="", style="", opration="logout()") }}
</div>
<div class="email-error">
    {{ tipCover.tip(type="confirm", msg ='请输入合法的邮箱！', time="", style="", opration="") }}
</div>
<div class="login-success">
    {{ tipCover.tip(type="confirm", msg ='登录成功', time="", style="", opration="") }}
</div>
<div class="psd-error">
    {{ tipCover.tip(type="confirm", msg ='密码错误', time="", style="", opration="") }}
</div>
<div class="no-user">
    {{ tipCover.tip(type="confirm", msg ='该用户不存在', time="", style="", opration="") }}
</div>
<div class="user-psd-input">
    {{ tipCover.tip(type="confirm", msg ='请输入账号或密码！', time="", style="", opration="") }}
</div>
{% endblock %}

{% block banner %}
    
{% endblock %}

{% block top %}
    <div class="register-page flex-b-cc" style="background-image: url('/public/images/banner/10.jpg')">
        <div class="register-div">
            <div class="fl leader-left">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-imagevector"></use>
                </svg>
                <span class="l-title">YY摄影</span>
                <div class="leader-detail">
                    <p class="text1">yy website</p>
                    <p class="text2">定制，一场暖心的摄影之旅</p>
                    <p class="text3">打造美丽宁静的生活,等待您！</p>
                    <p class="text4">从yy摄影开始</p>
                    <p class="text4">来吧</p>
                </div>
            </div>
            <div class="fl register-right">
                用户登录
                <div class="register-form">
                    <div class="layui-form">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="text" placeholder="请输入邮箱" class="layui-input email-input">
                            </div>
                            <div class="layui-input-block">
                                <input type="password" placeholder="请输入密码" class="layui-input psd-input">
                            </div>
                            <div class="layui-inline">
                                <!-- <input type="checkbox" name="" lay-skin="primary" title="记住密码(7天)"> -->
                            </div>
                            <div class="layui-inline forget-psd fr">
                                <a href="" class="forget-psd-link">忘记密码？</a>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn login-btn">登&nbsp;&nbsp;&nbsp;录</button>
                            <a href="/register" class="login-link">免费注册</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}

{% block middle %}

{% endblock %}

{% block bottom %}

{% endblock %}

{% block footer %}

{% endblock %}

{% block script %}
    <script>
        layui.use(['form'], function(){

        });

        var email = $('.email-input');
        var psd = $('.psd-input');
        var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");

        $('.login-btn').on('click', function() {
            if(!!email.val()&&!!psd.val()) {
                if(!reg.test(email.val())) {
                    tipController('.email-error .cover');
                } else {
                    $.ajax({
                        type: 'post',
                        url: '/api/login',
                        data: {
                            email: email.val(),
                            password: psd.val(),
                        },
                        success: function(result){
                            tipController('.login-success .cover');
                            cacheSet('userLoginInfo', result);
                            setTimeout(function() {
                                pageJumpsHandle();
                            },1000)
                        },
                        error: function(err) {
                            if(err.status == 403){
                                tipController('.psd-error .cover');
                            } else if(err.status == 404) {
                                tipController('.no-user .cover');
                            }
                        }
                    })
                }
            } else {
                tipController('.user-psd-input .cover');
            }
        })
    </script>
{% endblock %}