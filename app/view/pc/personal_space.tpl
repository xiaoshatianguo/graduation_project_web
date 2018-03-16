{% extends "./template/template.tpl" %}

{% block banner %}
    <div class="personal-banner">
        <div class="banner-img" style="background-image: url('/public/images/banner.jpg');">
            <div class="author-portraits">
                <img class="img" src="/public/images/1.jpg" alt="">
            </div>
            <a class="attention-btn" href="javascript:;">关注</a>
        </div>
    </div>
{% endblock %}

{% block top %}
    <div class="author-info flex-box jc-s jc-ce fd-col">
        <div class="container">
            <p class="author-name">叶筱莎</p>
            <p class="author-motto">世界以痛吻我，我要回报以歌……</p>
            <div class="author-data-statistics flex-b-sbc">
                <div class="data-list">
                    <p class="item-name">热度</p>
                    <span class="item-number">3777777</span>
                </div>|
                <div class="data-list">
                    <p class="item-name">积分</p>
                    <span class="item-number">5555</span>
                </div>|
                <div class="data-list">
                    <p class="item-name">粉丝</p>
                    <span class="item-number">5556623</span>
                </div>|
                <div class="data-list">
                    <p class="item-name">关注</p>
                    <span class="item-number">111</span>
                </div>
            </div>
        </div>
    </div>
{% endblock %}

{% block middle %}
    
{% endblock %}

{% block bottom %}
    
{% endblock %}