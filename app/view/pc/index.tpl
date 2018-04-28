{% extends "./template/template.tpl" %}
{% import "pc/macro/tip_cover.tpl" as tipCover %}

{% block tip %}
<div class="login-out-tip">
    {{ tipCover.tip(type="alert", msg ='确定退出当前账号？', time="", style="", opration="logout()") }}
</div>
{% endblock %}

{% block top %}
    <div class="new-activity clear-f">
        <div class="container">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">最新活动</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
                {% for item in activityData %}
                    <a class="list-item" href="activity_detail?activityId={{ item.id }}">
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url({{ item.cover }})"></div>
                            <div class="item-cover"></div>
                        </div>
                        <div class="item-text">
                            <h3 class="t-title">{{ item.name }}</h3>
                            <p class="t-describe">{{ item.describe }}</p>
                            <div class="t-type">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-zuixinlianzai"></use>
                                </svg>
                                {{ item.initiator }}
                            </div>
                        </div>
                    </a>
                {% endfor %}
            </div> 
            <div class="activity-bottom flex-box jc-s ai-ce fd-col">
                <p class="activity-bottom-en">Popular Package</p>
                <p class="activity-bottom-zh">——珍藏最动人的时刻，留存最迷人的瞬间——</p>
            </div>
        </div>
    </div>
{% endblock %}

{% block middle %}
    <div class="hot-classify">
        <div class="container">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">热门分类</span>/
            </div>
            <div class="classify-list flex-b-sbc fw-wr">
                {% for item in sortData %}
                    <a class="list-item" href="sort?sortId={{ item.id }}">
                        <div class="item-text zx310">
                            <h3 class="t-title">{{ item.name }}</h3>
                        </div>
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url({{ item.cover }})"></div>
                            <div class="item-cover"></div>
                        </div>
                    </a>
                {% endfor %}
            </div>
            <div class="activity-bottom flex-box jc-s ai-ce fd-col">
                <p class="activity-bottom-en">Popular Package</p>
                <p class="activity-bottom-zh">——珍藏最动人的时刻，留存最迷人的瞬间——</p>
            </div>
        </div>
    </div>
{% endblock %}

{% block bottom %}
    <div class="active-certified-architect">
        <div class="container">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">活跃认证师</span>/
            </div>
            <div class="certified-architect-list flex-b-sbc fw-wr">
                {% for item in certifiedArchitectData %}
                    <a class="list-item" href="personal_space?userId={{ item.id }}">
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url({{ item.portrait }})"></div>
                        </div>
                        <div class="item-text">
                            <h3 class="t-title">{{ item.nickname }}</h3>
                            <p class="t-describe">{{ item.personal_statement }}</p>
                        </div>
                    </a>
                {% endfor %}
            </div>
            <div class="activity-bottom flex-box jc-s ai-ce fd-col">
                <p class="activity-bottom-en">Popular Package</p>
                <p class="activity-bottom-zh">——珍藏最动人的时刻，留存最迷人的瞬间——</p>
            </div>
        </div>
    </div>

    <div class="member-good-production">
        <div class="container">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">会员优秀作品</span>/
            </div>
            <div class="production-list flex-b-sbc fw-wr">
                {% for item in productionData %}
                    <a class="list-item" href="production_detail?productionId={{ item.id }}">
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url({{ item.cover }})"></div>
                        </div>
                    </a>
                {% endfor %}
            </div>
            <div class="activity-bottom flex-box jc-s ai-ce fd-col">
                <p class="activity-bottom-en">Popular Package</p>
                <p class="activity-bottom-zh">——珍藏最动人的时刻，留存最迷人的瞬间——</p>
            </div>
        </div>
    </div>
{% endblock %}