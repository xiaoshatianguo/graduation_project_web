{% macro tip(type="", msg="", time="", style="", opration="") %}

{# type：
        confirm简单提示，也可以把任意html代码塞到msg中，会解析出来,
        alert确定取消弹框，需要传opration回调方法,
        noLogin未登录提示遮罩,
        inputTip带一个输入框和确定取消按钮的遮罩，需要传opration回调方法,
        prompt提示框;
    opration:
        alert类型的弹框点击确认后回调的方法;
#}

<div class="cover zx310">
    <div class="tip-cover-content">
        <div class="main-body">
            {% if type=='confirm' %}

                {{msg | safe}}

            {% elif type=='alert' %}

                <div class="alert-div">
                    <div class="tip-content" id="tipContent">
                        {{msg | safe}}
                    </div>
                    <a class="tip-cancel fl" href="javascript:;">取消</a>
                    <a class="tip-submit fr" opration="{{opration}}" href="javascript:;">确定</a>
                </div>

            {% elif type=='noLogin' %}

                <div class="shopping-cart-noLogin">
                    <p class="login-text">您尚未登录</p>
                    <p class="select-text">选择</p>
                    <a class="login-link" href="/login">
                        <span class="link-zh">快速登录</span>QUICK LOGIN
                    </a>
                    <a class="register-link" href="/register">
                        <span class="link-zh">马上注册</span>QUICK RESGISTRATION
                    </a>
                </div>

            {% elif type=='inputTip' %}

                <div class="tip-input-div clear-f">
                    <div class="title">
                        <p class="text">{{ msg | safe }}</p>
                    </div>
                    <div class="info-box">
                        <div class="tip-content" id="tipContent">
                            <input class="tip-input" type="text" name="" autofocus maxlength="25">
                        </div>
                        <a class="tip-input-cancel fl" href="javascript:;">取消</a>
                        <a class="tip-input-submit fr" opration="{{opration}}" href="javascript:;">确认</a>
                    </div>
                    <div class="tip-error-show">输入不能为空！</div>
                </div>

            {% else %}

                <div class="loading">
                    <div><span></span></div>
                    <div><span></span></div>
                    <div><span></span></div>
                </div>
                <div class="tip-content" id="tipContent">
                    {{msg | safe}}
                </div>

            {% endif %}
        </div>
    </div>
</div>

{# 宏统一的js触发事件控制在login.js中 #}
{% endmacro %}