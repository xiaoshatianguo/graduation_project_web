{% extends "./template/template.tpl" %}

{% block banner %}
    
{% endblock %}

{% block top %}
    <div class="activity-detail-describe">
        <div class="container clear-f">
            <div class="fl describe-img" style="background-image:url({{ activityDetailData.cover }}-createLogo)">
            </div>
            <div class="fl describe-text">
                <p class="t-title">{{ activityDetailData.name }}</p>
                <p class="t-text">活动时间：{{ activityDetailData.start_time }} 至 {{ activityDetailData.end_time }}</p>
                <p class="t-text">活动类型：{{ activityDetailData.sort }}</p>
                <p class="t-text">活动发起者：{{ activityDetailData.initiator }}</p>
                <p class="t-describe">{{ activityDetailData.describe }}</p>
                <div class="btn-list flex-b-sc">
                    <a href="join_activity?activityId={{ activityDetailData.id }}" class="t-btn upload-btn">上传活动作品</a>
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
                {% if activityDetailData.productionDataArr.length > 0 %}
                    {% for item in activityDetailData.productionDataArr %}
                        <div class="list-item" href="production_detail?productionId={{ item.id }}">
                            <div class="list-img-div">
                                <div class="item-img" style="background-image:url({{ item.cover }}-createLogo)"></div>
                                <div class="item-cover"></div>
                            </div>
                            <div class="item-text">
                                <h3 class="t-title">
                                    {{ item.name }}
                                    <svg class="icon fr" aria-hidden="true">
                                        <use xlink:href="#icon-zuixinlianzai"></use>
                                    </svg>
                                </h3>
                                <p class="t-describe">{{ item.describe }}</p>
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
                        </div>
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

{% block bottom %}
    
{% endblock %}