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
                邮箱注册
                <div class="register-form">
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="text" placeholder="请输入邮箱" class="layui-input email-input">
                            </div>
                            <div class="layui-input-block">
                                <input type="text" placeholder="请输入验证码" class="layui-input code-input">
                                <button class="layui-btn send-code-btn">发送验证码</button>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" lay-submit="" lay-filter="demo2">验&nbsp;&nbsp;&nbsp;证</button>
                        </div>
                        <div class="layui-form-item">
                            <a href="/login" class="login-link">直接登录</a>
                        </div>
                    </form>
                </div>
            </div>
            <!-- <div class="fl register-right">
                用户注册
                <div class="register-form">
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入邮箱" class="layui-input">
                            </div>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入密码" class="layui-input">
                            </div>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请再次输入密码" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <input type="checkbox" name="" lay-skin="primary" title="记住密码(7天)">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" lay-submit="" lay-filter="demo2">注册</button>
                            <a href="" class="login-link">直接登录</a>
                        </div>
                    </form>
                </div>
            </div> -->
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
        var code = $('.code-input');
        var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");

        $('.send-code-btn').on('click', function() {
            var emailValue = email.val();
            console.log(emailValue);
            var codeValue = code.val();

            if(!!emailValue) {
                if(!reg.test(emailValue)) {
                    alert('请输入合法的邮箱！');
                } else {
                    console.log("发送验证码成功");
                    $.ajax({
                        type: 'post',
                         url: '/api/send_email',
                         data: {
                             email: emailValue,
                         },
                         success: function(result){
                             console.log(result);
                         }
                    })
                }
            } else {
                alert('请输入邮箱！');
            }
        })
    </script>
{% endblock %}