<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <script src="/public/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="/public/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="/public/pc/app.css">

    <title>大型摄影社区</title>
</head>
<body class="body">
    {% block header %}
        <header class="header">
            <div class="container clear-f">
                <ul class="header-nav-left flex-b-sc fl">
                    <a href="/" class="nav-li">首页</a>
                    <a href="/activity" class="nav-li">活动</a>
                    <a href="/certified_architect" class="nav-li">认证师</a>
                    <a href="/personal_space" class="nav-li">个人中心</a>
                </ul>
                <div class="logo flex-box jc-s ai-ce fd-col">
                    <span class="logo-top"></span>
                    <span class="logo-en">a big photo web</span>
                    <span class="logo-zh">叶艺的大型摄影社区</span>
                </div>
            </div>
        </header>
    {% endblock %}

    {% block banner %}
        <div class="banner">
            <div class="container swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" style="background-image: url('/public/images/banner/pc.jpg');">
                    </div>
                    <div class="swiper-slide" style="background-image: url('/public/images/banner/pc (1).jpg');">
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
                    <a class="item-img" href="activity_detail?activityId=1" style="background-image:url('/public/images/cover/0.jpg')">
                    </a>
                    <a class="item-img" href="activity_detail?activityId=1" style="background-image:url('/public/images/cover/1.jpg')">
                    </a>
                    <a class="item-img" href="activity_detail?activityId=1" style="background-image:url('/public/images/cover/2.jpg')">
                    </a>
                    <a class="item-img-big" href="activity_detail?activityId=1" style="background-image:url('/public/images/cover/3.jpg')">
                    </a>
                </div> 
                <div class="activity-bottom flex-box jc-s ai-ce fd-col">
                    <p class="activity-bottom-en">Popular Package</p>
                    <p class="activity-bottom-zh">——珍藏最动人的时刻，留存最迷人的瞬间——</p>
                </div>

                <div class="title">
                    /<span class="title-sm">YY摄影</span>
                    <span class="title-bg">人气套系</span>/
                </div>
                <div class="activity-list flex-b-sbc fw-wr">
                    {# TODO: 此处需要更换activityId #}
                    <a class="item-img-big" href="activity_detail?activityId=1" style="background-image:url('/public/images/cover/1.jpg')">
                    </a>
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
                <div class="classify">

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
                <div class="certified-architect-list">
                    
                </div>
            </div>
        </div>
    {% endblock %}

    {% block footer %}
        <footer class="footer">
            <div class="footer-top" style="background-image:url('/public/images/cover/1.jpg')">
                <p class="title">YY摄影</p>
            </div>
            <div class="footer-bottom">
                <p class="text">2018 KUN&YI Photo Web</p>
                <p class="text">YY摄影网，大型摄影交流网站</p>
            </div>
        </footer>
    {% endblock %}

    {% block slide %}
        
    {% endblock %}
    
    <script src="/public/swiper-3.4.2.min.js"></script>
    <script>

    </script>

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