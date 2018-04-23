{% extends "./template/template.tpl" %}

{% block banner %}
    
{% endblock %}

{% block top %}
   <div class="production-detail-div">
       <div class="container clear-f">
           <div class="production-left fl">
                <p class="production-title">作品标题</p>
                <p class="production-text">2018-4-23发布</p>
                <p class="production-text">原创作品/插画/其他插画</p>
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
            </div>
           <div class="about-author fl">
               <div class="portrait-img fl" style="background-image:url('/public/images/banner/pc (3).jpg')"></div>
               <div class="author-right fl">
                   <p class="author-name">小宋宋</p>
                   <span class="author-sort">上海/插画师</span>
                   <div class="btn-list flex-b-sbc">
                        <button class="attention-btn">关注</button>
                        <button class="detail-btn">主页</button>
                   </div>
               </div>
           </div>
       </div>
   </div>
{% endblock %}

{% block middle %}
   <div class="production-img-list">
       <div class="container">
           <div class="list-describe">
               <p class="describe">抽空以自己日常穿着画动态练习
                    所用软件：SAI+Photoshop（听说最近不能说ps）
                    春天万物生长，头发也让它重新长，要不要来约一波光头，不过我现在已经变寸头了hh
                </p>
           </div>
           <div class="img-list">
               <img class="img" src="/public/images/cover/4.jpg" alt="">
               <img class="img" src="/public/images/cover/5.jpg" alt="">
           </div>
       </div>
   </div>
{% endblock %}

{% block bottom %}
    <div class="production-detail-comment">
        <div class="container">
            <div class="comment-div">
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
        </div>
    </div>
{% endblock %}