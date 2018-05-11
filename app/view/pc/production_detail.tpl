{% extends "./template/template.tpl" %}
{% import "pc/macro/tip_cover.tpl" as tipCover %}

{% block banner %}
    
{% endblock %}

{% block top %}
   <div class="production-detail-div">
       <div class="container clear-f">
           <div class="production-left fl">
                <p class="production-title">{{ productionData.data.name }}</p>
                <p class="production-text">{{ productionData.data.create_time }}发布</p>
                <p class="production-text">原创作品/插画/其他插画</p>
                <div class="about-production flex-b-sbc">
                    <div class="about-item">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-yanjing"></use>
                        </svg>
                        <span class="about-num">{{ productionData.data.view_number }}</span>
                    </div>
                    <div class="about-item">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-comment1"></use>
                        </svg>
                        <span class="about-num">{{ productionData.data.comment_number }}</span>
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
                   <p class="author-name">{{ productionData.data.nickname }}</p>
                   <span class="author-sort">上海/插画师</span>
                   <div class="btn-list flex-b-sbc">
                        <a href="javascript:;" class="attention-btn" userId="{{ productionData.data.id }}">关注</a>
                        <a href="/personal_space?userId={{ productionData.data.id }}" class="detail-btn">主页</a>
                   </div>
               </div>
           </div>
       </div>
   </div>
{% endblock %}

{% block middle %}
   <div class="production-img-list">
       <div class="container">
           <div class="list-describe clear-f">
               <p class="describe">{{ productionData.data.describe | safe }}
                </p>
           </div>
           <div class="img-list">
               {% for item in productionData.data.production %}
                    <img class="img" src="{{ item }}" alt="">
               {% endfor %}
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
        </div>
    </div>
{% endblock %}

{% block script %}
    <script>
        var object_id = $('.attention-btn').attr('userId');
        var activity_id = getQueryString('activityId');
        var attentionBtn = $('.attention-btn');

        var userLoginInfo = cacheGet('userLoginInfo');

        if(!!userLoginInfo) {
            // 显示关注或取消关注处理
            $.ajax({
                url: '/operation/attentionGet',
                type: 'post',
                data: {
                    user_id: cacheGet('userLoginInfo').id,
                    object_id: object_id || 0,
                    activity_id: activity_id || 0,
                },
                success: function(result) {
                    var attentionHtml = attentionBtn.text();
                    if(result.msg == '已关注') {
                        attentionBtn.text('取消关注');
                    } else if(result.msg == '未关注') {
                        attentionBtn.text('关注');
                    }
                },
                error: function(err) {
                    console.log(err);
                }
            })
        }

        // 关注操作
        $('.attention-btn').on('click', function() {
            if(!!userLoginInfo) {
                $.ajax({
                    url: '/operation/attention',
                    type: 'post',
                    data: {
                        user_id: cacheGet('userLoginInfo').id,
                        object_id: object_id || 0,
                        activity_id: activity_id || 0,
                    },
                    success: function(result) {
                        if(!!result.attentionGet) {
                            if(result.attentionGet.status == 0) {
                                attentionBtn.text('关注');
                                alert('已取消关注');
                            } else {
                                attentionBtn.text('取消关注');
                                alert('关注成功');
                            }
                        } else {
                            alert('关注成功');
                        }
                    },
                    error: function(err) {
                        console.log(err);
                        console.log('关注失败');
                    }
                })
            } else {
                alert('请先登录后再关注');
                location.href = '/login';
            }
        })
    </script>
{% endblock %}
