{% extends "./template/template.tpl" %}

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
                    <div class="list-item" href="sort?sortId={{ item.id }}">
                        <div class="item-text zx310">
                            <h3 class="t-title">{{ item.name }}</h3>
                        </div>
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url({{ item.cover }})"></div>
                            <div class="item-cover"></div>
                        </div>
                    </div>
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
                {# TODO: 此处需要更换activityId #}
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                    </div>
                    <div class="item-text">
                        <h3 class="t-title">来参加活动啦！</h3>
                        <p class="t-describe">这场活动将会带你走向美丽的世界。这场活动将会带你走向美丽的世界。这场活动将会带你走向美丽的世界。</p>
                        <div class="t-type">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-zuixinlianzai"></use>
                            </svg>
                            官方活动
                        </div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                    </div>
                    <div class="item-text">
                        <h3 class="t-title">来参加活动啦！</h3>
                        <p class="t-describe">这场活动将会带你走向美丽的世界。这场活动将会带你走向美丽的世界。这场活动将会带你走向美丽的世界。</p>
                        <div class="t-type">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-zuixinlianzai"></use>
                            </svg>
                            官方活动
                        </div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                    </div>
                    <div class="item-text">
                        <h3 class="t-title">来参加活动啦！</h3>
                        <p class="t-describe">这场活动将会带你走向美丽的世界。这场活动将会带你走向美丽的世界。这场活动将会带你走向美丽的世界。</p>
                        <div class="t-type">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-zuixinlianzai"></use>
                            </svg>
                            官方活动
                        </div>
                    </div>
                </div>
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
                {# TODO: 此处需要更换activityId #}
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                    </div>
                </div>
            </div>
            <div class="activity-bottom flex-box jc-s ai-ce fd-col">
                <p class="activity-bottom-en">Popular Package</p>
                <p class="activity-bottom-zh">——珍藏最动人的时刻，留存最迷人的瞬间——</p>
            </div>
        </div>
    </div>
{% endblock %}