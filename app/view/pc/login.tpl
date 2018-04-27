{% extends "./template/template.tpl" %}

{% block banner %}
    
{% endblock %}

{% block top %}
    <div class="register-page flex-b-cc" style="background-image: url('/public/images/banner/timg.jpg')">
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
                                <input type="text" placeholder="请输入密码" class="layui-input psd-input">
                            </div>
                            <div class="layui-inline">
                                <input type="checkbox" name="" lay-skin="primary" title="记住密码(7天)">
                            </div>
                            <div class="layui-inline forget-psd">
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
                    alert('请输入合法的邮箱！');
                } else {
                    $.ajax({
                        type: 'post',
                        url: '/api/login',
                        data: {
                            email: email.val(),
                            password: psd.val(),
                        },
                        success: function(result){
                            alert('登录成功');
                            cacheSet('userLoginInfo', result);
                            location.href = '/';
                        },
                        error: function(err) {
                            if(err.status == 403){
                                alert('密码错误');
                            } else if(err.status == 404) {
                                alert('该用户不存在');
                            }
                        }
                    })
                }
            } else {
                alert('请输入账号或密码！');
            }
        })
    </script>
{% endblock %}