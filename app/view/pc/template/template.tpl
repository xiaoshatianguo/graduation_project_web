<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <script src="//at.alicdn.com/t/font_631371_ld3wb508rgt4kj4i.js"></script>
    <script src="/public/jquery-3.2.1.min.js"></script>
    <script src="/public/scripts/jquery.flexText.js"></script>
    <link rel="stylesheet" href="/public/layui.css">
    <link rel="stylesheet" href="/public/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="/public/pc/app.css">
    <link rel="stylesheet" href="/public/timeline.css">

    <title>大型摄影社区</title>
</head>
<body class="body">
    {% block header %}
        <header class="header">
            <div class="container clear-f">
                <div class="logo-img fl">
                    <img class="img" src="/public/images/favicon.png" alt="">
                    YY摄影
                </div>
                <ul class="header-nav-right flex-b-sc fl">
                    <a href="/" class="nav-li">首页</a>
                    <a href="/activity" class="nav-li">活动</a>
                    <a href="/certified_architect" class="nav-li">认证师</a>
                    <a href="/personal_space" class="nav-li">个人中心</a>
                </ul>
                <ul class="header-login flex-b-sc fr">
                    <a href="/" class="nav-li">登录</a>
                    <a href="/activity" class="nav-li">注册</a>
                </ul>
                <!-- <div class="logo flex-box jc-s ai-ce fd-col">
                    <span class="logo-top"></span>
                    <span class="logo-en">a big photo web</span>
                    <span class="logo-zh">YY的大型摄影社区</span>
                </div> -->
            </div>
        </header>
    {% endblock %}

    {% block banner %}
        <div class="banner">
            <div class="container swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" style="background-image: url('/public/images/banner/pc (7).jpg');">
                    </div>
                    <div class="swiper-slide" style="background-image: url('/public/images/banner/pc (3).jpg');">
                    </div>
                </div>
                <div class ="swiper-pagination"></div>
            </div>
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
                    {# TODO: 此处需要更换activityId #}
                    <div class="list-item" href="activity_detail?activityId=1">
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                            <div class="item-cover"></div>
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
                            <div class="item-cover"></div>
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
                            <div class="item-cover"></div>
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
                            <div class="item-cover"></div>
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
                            <div class="item-img" style="background-image:url('/public/images/cover/4.jpg')"></div>
                            <div class="item-cover"></div>
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
                            <div class="item-img" style="background-image:url('/public/images/cover/5.jpg')"></div>
                            <div class="item-cover"></div>
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
    {% endblock %}

    {% block middle %}
        <div class="hot-classify">
            <div class="container">
                <div class="title">
                    /<span class="title-sm">YY摄影</span>
                    <span class="title-bg">热门分类</span>/
                </div>
                <div class="classify-list flex-b-sbc fw-wr">
                    {# TODO: 此处需要更换activityId #}
                    <div class="list-item" href="activity_detail?activityId=1">
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                            <div class="item-cover"></div>
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
                            <div class="item-cover"></div>
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
                            <div class="item-cover"></div>
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
                            <div class="item-cover"></div>
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
                            <div class="item-img" style="background-image:url('/public/images/cover/4.jpg')"></div>
                            <div class="item-cover"></div>
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
                            <div class="item-img" style="background-image:url('/public/images/cover/5.jpg')"></div>
                            <div class="item-cover"></div>
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

    {% block footer %}
        <footer class="footer">
            <div class="footer-top" style="background-image:url('/public/images/banner/timg (1).jpg')">
                <p class="title">YY摄影</p>
            </div>
            <div class="footer-bottom">
                <p class="text">2018 YI&YI Photo Web</p>
                <p class="text">YY摄影网，大型摄影交流网站</p>
            </div>
        </footer>
    {% endblock %}

    {% block slide %}
        
    {% endblock %}
    
    <script src="/public/swiper-3.4.2.min.js"></script>
    <script src="/public/layui.js"></script>
    <script src="/public/modernizr.js"></script>
    <script src="/public/scripts/comment.js"></script>

    {% block script %}
        <script>
            var mySwiper = new Swiper('.swiper-container', {
                pagination: '.swiper-pagination',
                paginationClickable: true,
            })
        </script>
    {% endblock %}
</body>
</html>