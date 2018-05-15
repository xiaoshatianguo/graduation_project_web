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
                            <div class="item-cover flex-b-cc">
                                <div class="look-detail">
                                    <p>查看本期</p>
                                </div>
                            </div>
                        </div>
                        <div class="item-text">
                            <h3 class="t-title">{{ item.name }}</h3>
                            <p class="t-describe">{{ item.describe | truncate(36) }}</p>
                            <div class="t-type clear-f">
                                <div class="t-portrait fl" style="background-image: url({{ item.portrait }})">
                                </div>
                                <span>{{ item.nickname }}</span>
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
                        </div>
                    </a>
                {% endfor %}
            </div> 
            <a href="/activity" class="activity-bottom flex-box jc-s ai-ce fd-col">
                <p class="activity-bottom-en">Enjoy More Popular Activity</p>
                <p class="activity-bottom-zh">——查看更多精彩活动，享受更多活动的精彩——</p>
            </a>
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
            <a href="javascript:;" class="activity-bottom flex-box jc-s ai-ce fd-col more-sort">
                <p class="activity-bottom-en">Look For More Sort</p>
                <p class="activity-bottom-zh">——查看更多分类作品，分类查看更精彩——</p>
            </a>
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
                    <div class="grid_3">
                        <p class="grade">第{{ loop.index }}名</p>
                        <div class="ih-item circle effect2 left_to_right">
                            <a href="/personal_space?userId={{ item.id }}">
                                <div class="img">
                                    <img src="{{ item.portrait }}" alt="img">
                                </div>
                                <div class="info">
                                    <h3>{{ item.nickname }}</h3>
                                    <p>{{ item.personal_statement }}</p>
                                </div>
                            </a>
                        </div>
                        <div class="certified-info flex-b-sac">
                            <div class="about-item">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-jifen01"></use>
                                </svg>
                                <span class="about-num">{{ item.integral }}</span>
                            </div>
                            <div class="about-item">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-redu"></use>
                                </svg>
                                <span class="about-num">{{ item.hot }}</span>
                            </div>
                            <div class="about-item">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-fensipa"></use>
                                </svg>
                                <span class="about-num">4299</span>
                            </div>
                        </div>
                    </div>
                {% endfor %}
            </div>
            <a href="/certified_architect" class="activity-bottom flex-box jc-s ai-ce fd-col">
                <p class="activity-bottom-en">Know More certified Architect</p>
                <p class="activity-bottom-zh">——去了解更多认证师，找寻志同道合的师者——</p>
            </a>
        </div>
    </div>

    <div class="member-good-production">
        <div class="container">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">优秀作品</span>/
            </div>
            <div class="production-list flex-b-sbc fw-wr">
                {% for item in productionData %}
                    <a class="list-item" href="production_detail?productionId={{ item.id }}">
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url({{ item.cover }})"></div>
                            <div class="production-info flex-b-sac">
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
                    </a>
                {% endfor %}
            </div>
            <div class="activity-bottom flex-box jc-s ai-ce fd-col">
                <p class="activity-bottom-en">Popular Package</p>
                <p class="activity-bottom-zh">——珍藏最优秀的作品，留存最迷人的瞬间——</p>
            </div>
        </div>
    </div>
{% endblock %}


{% block script %}
<script>
    var mySwiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        autoplay : 3000,
        speed: 1000,
        loop : true,
        effect : 'cube',
        cube: {
        slideShadows: true,
        shadow: true,
        shadowOffset: 100,
        shadowScale: 0.6
        }
    })

    $('.more-sort').on('click', function() {
        if($('.slider-sort-div').css('display') == 'block'){
            $('.slider-sort-div').fadeOut();
        } else {
            $('.slider-sort-div').fadeIn();
        }
    })
</script>
{% endblock %}