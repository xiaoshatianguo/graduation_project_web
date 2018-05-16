{% extends "./template/template.tpl" %}
{% import "pc/macro/tip_cover.tpl" as tipCover %}

{% block tip %}
<div class="login-out-tip">
    {{ tipCover.tip(type="alert", msg ='确定退出当前账号？', time="", style="", opration="logout()") }}
</div>
<div class="no-login">
    {{ tipCover.tip(type="noLogin", msg = '', time="", style="", opration="") }}
</div>
{% endblock %}

{% block top %}
    
{% endblock %}

{% block middle %}
    <div class="activity-ing-hot">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">热门进行中活动</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
                {% for item in activityData %}
                    <p>No: {{ loop.index }}</p>
                    <a href="activity_detail?activityId={{ item.id }}" class="list-item" style="background-image:url({{ item.banner }})">
                    </a>
                {% endfor %}
            </div>
        </div>
    </div>

    <div class="activity-ing">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">全部进行中活动</span>/
            </div>
            <div class="activity-list">
                <ul class="join_d clear-f flex-b-sac fw-wr">
                    {% for item in activityAllData %}
                        <li class="fl">
                            <div class="tu" style="background-image: url({{ item.cover }})"></div>
                            <div class="wen">
                                <div class="item-title">
                                    <a href="activity_detail?activityId={{ item.id }}" class="title">{{ item.name }}</a>
                                    <div class="about-activity flex-b-sac fr">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">{{ item.view_number }}</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">{{ item.comment_number }}</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="des">
                                    <p>活动发起者：{{ item.u_nickname }}</p>
                                    <p>活动主题：{{ item.topic }}</p>
                                    <p>活动简介：{{ item.describe }}</p>
                                    <p>活动时间：{{ item.start_time }} - {{ item.end_time }}</p>
                                </div>
                            </div>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>
    </div>
{% endblock %}

{% block bottom %}
    <div class="activity-ed">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">结束活动回顾</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
                {% for item in activityEndData %}
                    <a class="work" href="/activity_detail?activityId={{ item.id }}">
                        <div class="work-grid" style="background-image:url({{ item.cover }});">
                            <div class="inner">
                                <div class="desc">
                                <h3>{{ item.name }}</h3>
                                <p class="cat">{{ item.describe | truncate(30) }}</p>
                            </div>
                            </div>
                        </div>
                    </a>
                {% endfor %}
            </div>
        </div>
    </div>
    <a class="publish-activity-btn" href="javascript:;">发布活动</a>
{% endblock %}

{% block script %}
    <script>
        var mySwiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            autoplay : 3000,
            speed: 1000,
            loop : true,
        })

        // 是否显示发布活动按钮
        var userLoginInfo = cacheGet('userLoginInfo');
        var caBtn = $('.publish-activity-btn');
        if(userLoginInfo) {
            $.ajax({
                url: '/operation/get_personal_data?id='+cacheGet('userLoginInfo').id,
                type: 'get',
                success: function(result) {
                    if(result.sort == 0) {
                        caBtn.hide();
                    }
                }
            })
        }

        $('.publish-activity-btn').on('click', function() {
            if(cacheGet('userLoginInfo')) {
                location.href = '/apply_activity';
            } else {
                $('.no-login .cover').fadeIn();
            }
        })
    </script>
{% endblock %}