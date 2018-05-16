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

{% block top %}
    <div class="best-certified-architect">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">优秀认证师</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
                {% for item in userData %}
                    <a class="product-type-container" href="personal_space?userId={{ item.id }}">
                        <div class="product-type-overlay">
                            <div class="product-type-info">
                                <h3 class="gold-text text-uppercase">{{ item.nickname }}</h3>
                                <p class="text-uppercase white-text">{{ item.personal_statement }}</p>
                            </div>
                        </div>
                        <div class="product-type-img" style="background-image: url({{ item.portrait }})"></div>
                    </a>
                {% endfor %}
            </div>
        </div>
    </div>
{% endblock %}

{% block middle %}
    <div class="all-certified-architect">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">所有认证师</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
                {% for item in userAllData %}
                    <a class="list-item clear-f">
                        <div class="content">
                            <div class="describe fl flex-b-sc">
                                <div class="portrait" style="background-image:url({{ item.portrait }})"></div>
                                <div class="detail">
                                    <p class="nick-name">{{ item.nickname }}</p>
                                    <p class="post">北京 | 设计师</p>
                                    <p class="grade">创作 <i class="number">{{ item.hot }}</i> | 粉丝 <i class="number">66713</i></p>
                                    <div class="btn-div">
                                        <button class="attent-btn" userId={{ item.id }}>关注</button>
                                        <button class="home-btn" userId={{ item.id }}>主页</button>
                                    </div>
                                </div>
                            </div>
                            <div class="product fr">
                                <div class="img-list flex-b-ec">
                                    <div class="img"  style="background-image:url('/public/images/cover/0.jpg')">
                                    </div>
                                    <div class="img"  style="background-image:url('/public/images/cover/1.jpg')">
                                    </div>
                                    <div class="img"  style="background-image:url('/public/images/cover/2.jpg')">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                {% endfor %}
            </div>
        </div>
    </div>
{% endblock %}

{% block bottom %}
    <a class="become-certified-architect" href="javascript:;">成为认证师</a>
{% endblock %}

{% block script %}
    <script>
        // 是否显示认证师按钮
        var userLoginInfo = cacheGet('userLoginInfo');
        var caBtn = $('.become-certified-architect');
        if(userLoginInfo) {
            $.ajax({
                url: '/operation/get_personal_data?id='+cacheGet('userLoginInfo').id,
                type: 'get',
                success: function(result) {
                    if(result.sort == 2) {
                        caBtn.hide();
                    }
                }
            })
        }

        // 成为认证师按钮处理
        $('.become-certified-architect').on('click', function() {
            if(userLoginInfo) {
                location.href = '/apply_certified_architect';
            } else {
                $('.no-login .cover').fadeIn();
            }
        })

        // 关注认证师
        var attentionBtn = $('.attent-btn');
        var userLoginInfo = cacheGet('userLoginInfo');

        // 关注操作
        $('.attent-btn').on('click', function() {
            var object_id = $(this).attr('userId');
            if(!!userLoginInfo) {
                $.ajax({
                    url: '/operation/attention',
                    type: 'post',
                    data: {
                        user_id: cacheGet('userLoginInfo').id,
                        object_id: object_id || 0,
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