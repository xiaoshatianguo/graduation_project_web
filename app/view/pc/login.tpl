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
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入手机号" class="layui-input">
                            </div>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入密码" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <input type="checkbox" name="" lay-skin="primary" title="记住密码(7天)">
                            </div>
                            <div class="layui-inline forget-psd">
                                <a href="" class="forget-psd-link">忘记密码？</a>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" lay-submit="" lay-filter="demo2">注册</button>
                            <a href="" class="login-link">免费注册</a>
                        </div>
                    </form>
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
    </script>
{% endblock %}