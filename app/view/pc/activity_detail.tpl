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

{% block banner %}
    
{% endblock %}

{% block top %}
    <div class="activity-detail-describe">
        <div class="container clear-f">
            <div class="fl describe-img" style="background-image:url({{ activityDetailData.cover }})">
            </div>
            <div class="fl describe-text">
                <p class="t-title">{{ activityDetailData.name }}</p>
                <p class="t-text">活动时间：{{ activityDetailData.start_time }} 至 {{ activityDetailData.end_time }}</p>
                <p class="t-text">活动发起者：{{ activityDetailData.initiator }}</p>
                <p class="t-describe">{{ activityDetailData.describe }}</p>
                <div class="btn-list flex-b-sc">
                    <a href="javascript:;" class="t-btn upload-btn">
                        上传活动作品
                    </a>
                    <a class="t-btn detail-btn">查看活动详情</a>
                </div>
            </div>
        </div>
    </div>
{% endblock %}

{% block middle %}
    <div class="activity-production-list">
        <div class="container">
            <p class="title">活动作品</p>
            <div class="product-show flex-b-sc fw-wr">
                {% if activityDetailData.productionData.length > 0 %}
                    {% for item in activityDetailData.productionData %}
                        <a class="list-item" href="production_detail?productionId={{ item.id }}">
                            <div class="list-img-div">
                                <div class="item-img" style="background-image:url({{ item.cover }})"></div>
                                <div class="item-cover"></div>
                            </div>
                            <div class="item-text">
                                <h3 class="t-title">
                                    {{ item.name }}
                                    <svg class="icon fr" aria-hidden="true">
                                        <use xlink:href="#icon-zuixinlianzai"></use>
                                    </svg>
                                </h3>
                                <p class="t-describe">{{ item.nickname }}</p>
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
                                    <span class="fr product-create-time">{{ item.create_time }}</span>
                                </div>
                            </div>
                        </a>
                    {% endfor %}
                {% else %}
                    <div class="no-production">
                        <p class="text">该活动暂无作品提交!</p>
                    </div>
                {% endif %}
            </div>
            <div class="comment-div">
                <div class="commentAll">
                    <!--评论区域 begin-->
                    <div class="reviewArea clear-f">
                        <textarea class="content comment-input" placeholder="说点什么吧！&hellip;" onkeyup="keyUP(this)"></textarea>
                        <a href="javascript:;" class="plBtn">评论</a>
                    </div>
                    <!--评论区域 end-->
                    <!--回复区域 begin-->
                    <div class="comment-show">
                        {% if activityDetailData.commentsData.length > 0 %}
                            {% for item in activityDetailData.commentsData %}
                                <div class="comment-show-con clear-f" commentId={{ item.id }}>
                                    <div class="comment-show-con-img fl" style="background-image:url({{ item.portrait }})"></div>
                                    <div class="comment-show-con-list fl clear-f">
                                        <div class="pl-text clear-f">
                                            <a href="#" class="comment-size-name" userId="{{ item.user_id }}">{{ item.nickname }}：</a>
                                            <span class="my-pl-con">&nbsp;{{ item.content }}</span>
                                        </div>
                                        <div class="date-dz">
                                            <span class="date-dz-left fl comment-time">{{ item.create_time }}</span>
                                            <div class="date-dz-right fr comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                {% if item.number>0 %}
                                                    <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block fl">查看<i class="z-num">{{ item.number }}</i>条回复</a>
                                                {% else %}
                                                    <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block fl">回复(<i class="z-num">{{ item.number }}</i>)</a>
                                                {% endif %}
                                                <span class="fl date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z fl">
                                                    <i class="date-dz-z-click-red" style="background-image: url({{ item.starImg }})"></i>赞(<i class="z-num">{{ item.star }}</i>)
                                                </a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            {% endfor %}
                        {% endif %}
                    </div>
                    <!--回复区域 end-->
                </div>
            </div>
        </div>
    </div>
{% endblock %}

{% block bottom %}
    
{% endblock %}

{% block script %}
    <script>
        var activityId = getQueryString('activityId') || '';

        $('.upload-btn').on('click', function() {
            if(cacheGet('userLoginInfo')) {
                location.href = 'join_activity?activityId=' + activityId;
            } else {
                $('.no-login .cover').fadeIn();
            }
        })
    </script>
{% endblock %}