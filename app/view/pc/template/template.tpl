<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <script src="//at.alicdn.com/t/font_631371_ld3wb508rgt4kj4i.js"></script>
    <script src="/public/jquery-3.2.1.min.js"></script>
    <script src="/public/scripts/jquery.flexText.js"></script>
    <link rel="stylesheet" href="/public/layui/css/layui.css">
    <link rel="stylesheet" href="/public/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="/public/pc/app.css">
    <link rel="stylesheet" href="/public/timeline.css">

    <title>大型摄影社区</title>
</head>
<body class="body">
    {% block tip %}
    
    {% endblock %}

    {% block header %}
        <header class="header">
            <div class="container clear-f">
                <a href="/" class="logo-img fl">
                    <img class="img" src="/public/images/favicon.png" alt="">
                    YY摄影
                </a>
                <ul class="header-nav-right flex-b-sc fl">
                    <!-- <a href="/" class="nav-li">首页</a> -->
                    <a href="/activity" class="nav-li">活动</a>
                    <a href="/certified_architect" class="nav-li">认证师</a>
                    <!-- <a href="/personal_space" class="nav-li">个人中心</a> -->
                </ul>
                <ul class="header-login flex-b-sc fr">
                </ul>
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
       
    {% endblock %}

    {% block middle %}
       
    {% endblock %}

    {% block bottom %}
        
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
    <script src="/public/layui/layui.js"></script>
    <script src="/public/modernizr.js"></script>
    <script src="/public/scripts/comment.js"></script>
    <script src="/public/scripts/login.js"></script>

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