{% extends "./template/template.tpl" %}
{% import "pc/macro/tip_cover.tpl" as tipCover %}

{% block tip %}
<div class="login-out-tip">
    {{ tipCover.tip(type="alert", msg ='确定退出当前账号？', time="", style="", opration="logout()") }}
</div>
{% endblock %}

{% block banner %}
    <div class="personal-banner">
        <div class="banner-img" style="background-image: url({{ personalData.bgcover }})">
            <div class="author-portraits">
                <img class="img" src="{{ personalData.portrait }}" alt="">
            </div>
            <a class="attention-btn" href="/publish_production">发布作品</a>
        </div>
    </div>
{% endblock %}

{% block top %}
    <div class="author-info flex-box jc-s jc-ce fd-col">
        <div class="container">
            <p class="author-name">{{ personalData.nickname }}<small class="grade">【顶级设计师】</small></p>
            <p class="author-motto">{{ personalData.personal_statement }}</p>
            <div class="author-data-statistics flex-b-sbc">
                <div class="data-list">
                    <p class="item-name">热度</p>
                    <span class="item-number">3777777</span>
                </div>|
                <div class="data-list">
                    <p class="item-name">积分</p>
                    <span class="item-number">{{ personalData.integral }}</span>
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
                            {% for item in productionData %}
                                <div class="list-item" href="production_detail?productionId={{ item.id }}">
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
                                            <span class="fr product-create-time">{{ item.create_time }}</span>
                                        </div>
                                    </div>
                                </div>
                            {% endfor %}
                        </div>
                    </div>
                    <div class="layui-tab-item personal-data">
                        <div class="data-show">
                            <form class="layui-form">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">昵称</label>
                                    <div class="layui-input-block">
                                        <p>{{ personalData.nickname }}</p>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">邮箱</label>
                                    <div class="layui-input-block">
                                        <p>{{ personalData.email }}</p>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">电话</label>
                                    <div class="layui-input-block">
                                        <p>{{ personalData.phone }}</p>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">真实名字</label>
                                    <div class="layui-input-block">
                                        <p>{{ personalData.name }}</p>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                        <p>
                                            {% if personalData.sex == 0 %}
                                                男
                                            {% else %}
                                                女
                                            {% endif %}
                                        </p>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">年龄</label>
                                    <div class="layui-input-block">
                                        <p>{{ personalData.age }}</p>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">地址</label>
                                    <div class="layui-input-block">
                                        <p>{{ personalData.address }}</p>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">注册时间</label>
                                    <div class="layui-input-block">
                                        <p>{{ personalData.create_time }}</p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="layui-tab-item personal-collection">
                        <div class="product-show flex-b-sc fw-wr">
                                {% for item in collectionData %}
                                <div class="list-item" href="production_detail?productionId={{ item.id }}">
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
                                            <span class="fr product-create-time">{{ item.create_time }}</span>
                                        </div>
                                    </div>
                                </div>
                            {% endfor %}
                        </div>
                    </div>
                    <div class="layui-tab-item personal-message">
                        <div class="commentAll">
                            <!--评论区域 begin-->
                            <div class="reviewArea clear-f">
                                <textarea class="content comment-input" placeholder="说点什么吧！&hellip;" onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                {% if commentsData.length > 0 %}
                                    {% for item in commentsData %}
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
                    <div class="layui-tab-item personal-product-line">
                        <div class="line-contetn">
                            <section id="cd-timeline" class="cd-container">
                                {% for item in productionData %}
                                    <div class="cd-timeline-block">
                                        <div class="cd-timeline-img cd-picture" style="background-image: url({{ item.cover }})">
                                        </div>
                                        <div class="cd-timeline-content"> 
                                            <h2>{{ item.name }}</h2>
                                            <img class="timeline-img" src="{{ item.cover }}" alt="">
                                            <p>{{ item.describe }}</p>
                                            <a href="/production_detail?productionId={{ item.id }}" class="cd-read-more">详情</a>
                                            <span class="cd-date">{{ item.create_time }}</span>
                                        </div>
                                    </div>
                                {% endfor %}
                            </section>
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