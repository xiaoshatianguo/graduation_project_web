{% extends "./template/template.tpl" %}

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
                <div class="list-item" style="background-image:url('/public/images/banner/timg.jpg')">
                </div>
                <div class="list-item" style="background-image:url('/public/images/banner/pc (3).jpg')">
                </div>
                <div class="list-item" style="background-image:url('/public/images/banner/timg (1).jpg')">
                </div>
            </div>
        </div>
    </div>

    <div class="activity-ing">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">全部进行中活动</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
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
                        <div class="item-img" style="background-image:url('/public/images/cover/1.jpg')"></div>
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
                        <div class="item-img" style="background-image:url('/public/images/cover/2.jpg')"></div>
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
                        <div class="item-img" style="background-image:url('/public/images/cover/3.jpg')"></div>
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
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/1.jpg')"></div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/2.jpg')"></div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/3.jpg')"></div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/4.jpg')"></div>
                    </div>
                </div>
                <div class="list-item" href="activity_detail?activityId=1">
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url('/public/images/cover/5.jpg')"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="publish-activity-btn" href="javascript:;">发布活动</a>
{% endblock %}