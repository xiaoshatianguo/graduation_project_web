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
                <img class="img portraitsImg" src="{{ personalData.portrait }}" alt="">
            </div>
            <a class="attention-btn" href="/publish_production">发布作品</a>
        </div>
    </div>
{% endblock %}

{% block top %}
    <div class="my-info flex-box jc-s jc-ce fd-col">
        <div class="container">
            <p class="author-name">{{ personalData.nickname }}<small class="grade">
                {% if personalData.sort == 0 %}
                    【普通会员】
                {% else %}
                    【认证师】
                {% endif %}
            </small></p>
            <p class="author-motto">{{ personalData.personal_statement }}</p>
            <div class="author-data-statistics flex-b-sbc">
                <div class="data-list">
                    <p class="item-name">热度</p>
                    <span class="item-number">{{ personalData.hot }}</span>
                </div>|
                <div class="data-list">
                    <p class="item-name">积分</p>
                    <span class="item-number">{{ personalData.integral }}</span>
                </div>|
                <div class="data-list">
                    <p class="item-name">粉丝</p>
                    <span class="item-number">{{ myFansData.length }}</span>
                </div>|
                <div class="data-list">
                    <p class="item-name">关注</p>
                    <span class="item-number">{{ myAttentionData.length }}</span>
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
                    <li>消息</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show personal-product">
                        <div class="product-show flex-b-sc fw-wr">
                            {% for item in productionData %}
                                <a class="list-item" href="production_detail?productionId={{ item.id }}">
                                    <div class="list-img-div">
                                        <div class="item-img" style="background-image:url({{ item.cover }})">
                                        </div>
                                        <div class="item-cover">
                                        </div>
                                        
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
                                                <span class="about-num">{{ item.view_number }}</span>
                                            </div>
                                            <div class="about-item">
                                                <svg class="icon" aria-hidden="true">
                                                    <use xlink:href="#icon-comment1"></use>
                                                </svg>
                                                <span class="about-num">{{ item.comment_number }}</span>
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
                                    <div class="opration-list clear-f" productionId={{ item.id }}>
                                        <button class="delete-production fl">删除</button>
                                        <button class="edit-production fr">编辑</button>
                                    </div>
                                </a>
                            {% endfor %}
                        </div>
                    </div>
                    <div class="layui-tab-item personal-data">
                        <div class="data-show">
                            <div class="layui-form clear-f">
                                <div class="form-left fl">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">昵称</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="nickname" placeholder="请输入昵称" class="layui-input personal-data-input" value="{{ personalData.nickname }}">
                                            <p class="person-data-text">
                                                <i class="p-text">{{ personalData.nickname }}</i>
                                                <svg class="icon edit-element" aria-hidden="true">
                                                    <use xlink:href="#icon-bianji"></use>
                                                </svg>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">邮箱</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="email" placeholder="请输入邮箱" class="layui-input personal-data-input" value="{{ personalData.email }}">
                                            <p class="person-data-text">
                                                <i class="p-text">{{ personalData.email }}</i>
                                                <svg class="icon edit-element" aria-hidden="true">
                                                    <use xlink:href="#icon-bianji"></use>
                                                </svg>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">电话</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="phone" placeholder="请输入电话" class="layui-input personal-data-input" value="{{ personalData.phone }}">
                                            <p class="person-data-text">
                                                <i class="p-text">{{ personalData.phone }}</i>
                                                <svg class="icon edit-element" aria-hidden="true">
                                                    <use xlink:href="#icon-bianji"></use>
                                                </svg>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">真实名字</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" placeholder="请输入真实名字" class="layui-input personal-data-input" value="{{ personalData.name }}">
                                            <p class="person-data-text">
                                                <i class="p-text">{{ personalData.name }}</i>
                                                <svg class="icon edit-element" aria-hidden="true">
                                                    <use xlink:href="#icon-bianji"></use>
                                                </svg>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">性别</label>
                                        <div class="layui-input-block sex-input">
                                            {% if personalData.sex == 0 %}
                                                <input type="radio" name="sex" value="0" title="男" checked>
                                                <input type="radio" name="sex" value="1" title="女">
                                            {% else %}
                                                <input type="radio" name="sex" value="0" title="男">
                                                <input type="radio" name="sex" value="1" title="女" checked>
                                            {% endif %}
                                            
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">年龄</label>
                                        <div class="layui-input-block">
                                            <input type="number" name="age" placeholder="请输入年龄" class="layui-input personal-data-input" value="{{ personalData.age }}">
                                            <p class="person-data-text">
                                                <i class="p-text">{{ personalData.age }}</i>
                                                <svg class="icon edit-element" aria-hidden="true">
                                                    <use xlink:href="#icon-bianji"></use>
                                                </svg>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">地址</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="address" placeholder="请输入地址" class="layui-input personal-data-input" value="{{ personalData.address }}">
                                            <p class="person-data-text">
                                                <i class="p-text">{{ personalData.address }}</i>
                                                <svg class="icon edit-element" aria-hidden="true">
                                                    <use xlink:href="#icon-bianji"></use>
                                                </svg>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">个人宣言</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="personal_statement" placeholder="请输入个人宣言" class="layui-input personal-data-input" value="{{ personalData.personal_statement }}">
                                            <p class="person-data-text">
                                                <i class="p-text">{{ personalData.personal_statement }}</i>
                                                <svg class="icon edit-element" aria-hidden="true">
                                                    <use xlink:href="#icon-bianji"></use>
                                                </svg>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">注册时间</label>
                                        <div class="layui-input-block">
                                            <p>{{ personalData.create_time }}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-right fl">
                                    <div class="upload-info clear-f">
                                        <div class="info-title">头像</div>
                                        <input type="text" name="portraitSrc" required lay-verify="portraitSrc" placeholder="上传作品" hidden id="portraitSrc" value={{ personalData.portrait }}>
                                        <div class="layui-upload-drag layui-upload-list fl portrait-show" id="uploadPortrait">
                                            <img class="layui-upload-img" src={{ personalData.portrait }} id="portraitShow">
                                        </div>
                                    </div>
                                    <div class="upload-info clear-f">
                                        <div class="info-title">封面</div>
                                        <input type="text" name="coverSrc" required lay-verify="coverSrc" placeholder="上传作品" hidden id="coverSrc" value={{ personalData.bgcover }}>
                                        <div class="layui-upload-drag layui-upload-list fl cover-show" id="uploadCover">
                                            <img class="layui-upload-img" src={{ personalData.bgcover }} id="coverShow">
                                        </div>
                                    </div>
                                </div>
                                <div class="upload-form fl">
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button class="layui-btn" lay-submit lay-filter="formSubmit">确定修改</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-tab-item personal-collection">
                        <div class="product-show flex-b-sc fw-wr">
                            {% if collectionData.length > 0 %}
                                {% for item in collectionData %}
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
                                    </a>
                                {% endfor %}
                            {% else %}
                                <div>
                                    没有任何收藏哦，赶紧去收藏吧！
                                </div>
                            {% endif %}
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
                    <div class="layui-tab-item news">
                        <div class="news-list flex-b-sc fw-wr">
                            {% if newsData != null %}
                                <div class="list-item">
                                    {% if newsData.portrait %}
                                        <div class="item-img" style="background-image: url({{ newsData.portrait }})"></div>
                                    {% else %}
                                        <div class="item-img" style="background-image: url({{ newsData.cover }})"></div>
                                    {% endif %}
                                    <svg class="icon status-icon" aria-hidden="true">
                                        <use xlink:href="#icon-shenhezhong"></use>
                                    </svg>
                                </div>
                            {% else %}
                                <div class="list-item">
                                    暂无消息
                                </div>
                            {% endif %}
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
        $('.edit-element').on('click', function() {
            var pText = $(this).siblings('.p-text').hide().text();
            $(this).hide();
            $(this).parents('.layui-input-block').find('.personal-data-input').show().focus().val(pText);
        })

        $('.personal-data-input').blur(function() {
            var uText = $(this).val();
            if(!!uText) {
                $(this).hide();
                $(this).siblings('.person-data-text').find('.p-text').show().text(uText);
                $(this).siblings('.person-data-text').find('.edit-element').show();
            } else {
                $(this).focus();
            }
        })

        // 删除作品
        $('.delete-production').on('click', function(e) {
            var productionId = $(this).parents('.opration-list').attr('productionId');
            var OThis = $(this);
            e.preventDefault();
            $.ajax({
                url: '/operation/delete_production',
                type: 'post',
                data: {
                    productionId,
                },
                success: function(result) {
                    if(result.msg == '删除作品成功') {
                        OThis.parents('.list-item').hide();
                    }
                },
                error: function(err) {
                    console.log(err);
                }
            })
        })

        // 编辑作品
        $('.edit-production').on('click', function() {
            location.href = '/edit_production';
        })
    </script>
    <script>
        layui.use(['element', 'form', 'upload'], function(){
            var form = layui.form,
                layer = layui.layer,
                element = layui.element;

            //监听提交修改个人资料
            form.on('submit(formSubmit)', function(data){
                var personData = JSON.parse(JSON.stringify(data.field));

                $.ajax({
                    type: 'post',
                    url: '/operation/update_personal_data',
                    data: {
                        id: cacheGet('userLoginInfo').id,
                        nickname: personData.nickname,
                        email: personData.email,
                        phone: personData.phone,
                        name: personData.name,
                        sex: personData.sex,
                        age: personData.age,
                        address: personData.address,
                        personal_statement:personData.personal_statement,
                        bgcover: personData.coverSrc,
                        portrait: personData.portraitSrc,
                    },
                    success: function(result){
                        alert('个人资料修改成功');
                        // 动态修改头像和背景
                        $('.portraitsImg').attr('src', personData.portrait);
                        $('.banner-img').attr('style', 'background-image: url('+personData.coverSrc+')');
                    },
                    error: function(err) {
                        alert('个人资料修改失败，请稍候重试');
                    }
                })
            });

            var $ = layui.jquery,
                upload = layui.upload;

            // 上传头像处理
            var uploadPortrait = upload.render({
                elem: '#uploadPortrait',
                url: '/qiniu',
                accept: 'images',
                acceptMime: 'image/*',
                exts: 'png|jpg|bmp|jpeg|gif',
                size: 1024,
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#portraitShow').attr('src', result); //图片链接（base64）
                    });
                },
                done: function(res){
                    $('#portraitSrc').val(res.data.src);
                    return layer.msg('上传成功');
                },
                error: function(){
                    // 演示失败状态，并实现重传
                    var portraitShow = $('#portraitShow');
                    portraitShow.after('<span style="color: #f39549;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    portraitShow.next('.demo-reload').on('click', function(){
                        uploadPortrait.upload();
                    });
                }
            });

            // 上传封面处理
            var uploadCover = upload.render({
                elem: '#uploadCover',
                url: '/qiniu',
                accept: 'images',
                acceptMime: 'image/*',
                exts: 'png|jpg|bmp|jpeg|gif',
                size: 1024,
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#coverShow').attr('src', result); //图片链接（base64）
                    });
                },
                done: function(res){
                    $('#coverSrc').val(res.data.src);
                    return layer.msg('上传成功');
                },
                error: function(){
                    // 演示失败状态，并实现重传
                    var coverShow = $('#coverShow');
                    coverShow.after('<span style="color: #f39549;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    coverShow.next('.demo-reload').on('click', function(){
                        uploadCover.upload();
                    });
                }
            });
        });
    </script>
{% endblock %}