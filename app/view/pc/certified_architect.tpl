{% extends "./template/template.tpl" %}
{% import "pc/macro/tip_cover.tpl" as tipCover %}

{% block tip %}
<div class="login-out-tip">
    {{ tipCover.tip(type="alert", msg ='确定退出当前账号？', time="", style="", opration="logout()") }}
</div>
{% endblock %}

{% block top %}
    <div class="best-certified-architect">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">优秀认证师</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
                {% for item in userData %}
                    <div class="list-item" href="personal_space?userId={{ item.id }}">
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url({{ item.portrait }})"></div>
                            <div class="item-cover"></div>
                        </div>
                        <div class="item-text">
                            <h3 class="t-title">{{ item.nickname }}</h3>
                            <p class="t-describe">{{ item.personal_statement }}</p>
                        </div>
                    </div>
                {% endfor %}
            </div>
        </div>
    </div>
{% endblock %}

{% block middle %}
    <div class="all-certified-architect">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">所有认证师</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
                {% for item in userAllData %}
                    <div class="list-item clear-f">
                        <div class="content">
                            <div class="describe fl flex-b-sc">
                                <div class="portrait" style="background-image:url({{ item.portrait }})"></div>
                                <div class="detail">
                                    <p class="nick-name">{{ item.nickname }}</p>
                                    <p class="post">北京 | 设计师</p>
                                    <p class="grade">创作 <i class="number">225</i> | 粉丝 <i class="number">66713</i></p>
                                    <div class="btn-div">
                                        <button class="attent-btn">关注</button>
                                        <button class="home-btn">主页</button>
                                    </div>
                                </div>
                            </div>
                            <div class="product fr">
                                <div class="img-list flex-b-ec">
                                    <div class="img"  style="background-image:url('/public/images/cover/0.jpg')">
                                    </div>
                                    <div class="img"  style="background-image:url('/public/images/cover/1.jpg')">
                                    </div>
                                    <div class="img"  style="background-image:url('/public/images/cover/2.jpg')">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                {% endfor %}
            </div>
        </div>
    </div>
{% endblock %}

{% block bottom %}
    <a class="become-certified-architect" href="javascript:;">成为认证师</a>
{% endblock %}