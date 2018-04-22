{% extends "./template/template.tpl" %}

{% block banner %}
    <div class="personal-banner">
        <div class="banner-img" style="background-image: url('/public/images/banner/timg.jpg');">
            <div class="author-portraits">
                <img class="img" src="/public/images/cover/1.jpg" alt="">
            </div>
            <a class="attention-btn" href="javascript:;">关注</a>
        </div>
    </div>
{% endblock %}

{% block top %}
    <div class="author-info flex-box jc-s jc-ce fd-col">
        <div class="container">
            <p class="author-name">叶筱莎<small class="grade">【顶级设计师】</small></p>
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
        <div class="tag-div">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title">
                    <li class="layui-this">作品</li>
                    <li>资料</li>
                    <li>收藏</li>
                    <li>留言</li>
                    <li>创作</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show personal-product">
                        <div class="product-show flex-b-sc fw-wr">
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-tab-item personal-data">
                        
                    </div>
                    <div class="layui-tab-item personal-collection">
                        <div class="product-show flex-b-sc fw-wr">
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item" href="activity_detail?activityId=1">
                                <div class="list-img-div">
                                    <div class="item-img" style="background-image:url('/public/images/cover/0.jpg')"></div>
                                    <div class="item-cover"></div>
                                </div>
                                <div class="item-text">
                                    <h3 class="t-title">
                                        我的作品
                                        <svg class="icon fr" aria-hidden="true">
                                            <use xlink:href="#icon-zuixinlianzai"></use>
                                        </svg>
                                    </h3>
                                    <p class="t-describe">插画-商业插画</p>
                                    <div class="about-production flex-b-sbc">
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-yanjing"></use>
                                            </svg>
                                            <span class="about-num">4.6万</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-comment1"></use>
                                            </svg>
                                            <span class="about-num">196</span>
                                        </div>
                                        <div class="about-item">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-chakandianzan"></use>
                                            </svg>
                                            <span class="about-num">4299</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="clear-f">
                                        <span class="fr product-create-time">16天前</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-tab-item personal-message">
                        <div class="commentAll">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="Please enter a comment&hellip;" onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <div class="comment-show-con-img pull-left"><img src="/public/images/cover/1.jpg" alt=""></div>
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a>
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span>
                                        </div>
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>
                    </div>
                    <div class="layui-tab-item personal-product-line">
                        <div class="line-contetn">
                            <section id="cd-timeline" class="cd-container">
                                <div class="cd-timeline-block">
                                    <div class="cd-timeline-img cd-picture">
                                        <img src="/public/images/cd-icon-picture.svg" alt="Picture">
                                    </div><!-- cd-timeline-img -->
                        
                                    <div class="cd-timeline-content">
                                        <h2>html5时间表 1</h2>
                                        <p>jQuery 团队在官博中再次提醒用户，jQuery 2.0 不再支持IE 6/7/8 了，但是 jQuery 1.9 会继续支持。因为旧版 IE 浏览器在整个互联网中还有很大部分市场，所以他们非常期望大部分网站能继续使用 jQuery 1.x 一段时间。jQuery 团队也将同时支持 jQuery 1.x 和 2.x 。1.9 和 2.0 版的 API 是相同的，所以不必因为你们网站还在用 jQuery 1.9，就感觉好像错过了什么，或者是落后了。</p>
                                        <a href="#" class="cd-read-more">阅读更多</a>
                                        <span class="cd-date">Jan 14</span>
                                    </div> <!-- cd-timeline-content -->
                                </div> <!-- cd-timeline-block -->
                                <div class="cd-timeline-block">
                                    <div class="cd-timeline-img cd-picture">
                                        <img src="/public/images/cd-icon-picture.svg" alt="Picture">
                                    </div><!-- cd-timeline-img -->
                        
                                    <div class="cd-timeline-content">
                                        <h2>html5时间表 1</h2>
                                        <p>jQuery 团队在官博中再次提醒用户，jQuery 2.0 不再支持IE 6/7/8 了，但是 jQuery 1.9 会继续支持。因为旧版 IE 浏览器在整个互联网中还有很大部分市场，所以他们非常期望大部分网站能继续使用 jQuery 1.x 一段时间。jQuery 团队也将同时支持 jQuery 1.x 和 2.x 。1.9 和 2.0 版的 API 是相同的，所以不必因为你们网站还在用 jQuery 1.9，就感觉好像错过了什么，或者是落后了。</p>
                                        <a href="#" class="cd-read-more">阅读更多</a>
                                        <span class="cd-date">Jan 14</span>
                                    </div> <!-- cd-timeline-content -->
                                </div> <!-- cd-timeline-block -->
                            </section> <!-- cd-timeline -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}

{% block middle %}

{% endblock %}

{% block bottom %}
    
{% endblock %}

{% block footer %}
    
{% endblock %}

{% block script %}
    <script>
        layui.use('element', function(){
            
        });
    </script>
{% endblock %}