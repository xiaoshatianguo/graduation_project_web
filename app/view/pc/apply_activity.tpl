{% extends "./template/template.tpl" %}
{% import "pc/macro/tip_cover.tpl" as tipCover %}

{% block tip %}
<div class="login-out-tip">
    {{ tipCover.tip(type="alert", msg ='确定退出当前账号？', time="", style="", opration="logout()") }}
</div>
{% endblock %}

{% block banner %}
    
{% endblock %}

{% block top %}
    <div class="apply-activity-div">
        <div class="container">
            <div class="layui-tab clear-f">
                <ul class="layui-tab-title fl flex-box fd-col clear-f">
                    <li class="layui-this tab-item">申请活动规则</li>
                    <li class="tab-item">申请活动资料</li>
                </ul>
                <div class="layui-tab-content fl">
                    <div class="layui-tab-item layui-show apply-activity-rule">
                        <div class="tab-title">申请活动规则</div>
                        <div class="rule-info">
                                社团培养大学生兴趣爱好，提升大学生素质及能力，丰富校园文化生活。严格规划
                                社团活动，打造星级社团，制定以下社团活动申请细则： 
                                
                                一、活动申请：活动申请流程：社团向社联实践部提交活动申请表，经社联实践部初审通过，交由院团委审核，若审核不通过则返还各社团，审核通过则由院团委盖章并交由实践部通知纪检部和各社团活动负责人,由各社团活动负责人按时举办并配合社联纪检部的检查。

                                二、活动组织： 
                                    1、  活动内容要积极向上，紧贴时事，以丰富校园文化生活为目的。社团活动实施过程中不得有危及师生安全的活动项目,且在活动中积极配合社联纪检部的检查,为打造星级社团创造更好的基础.

                                    2、 
                                    没有上交活动申请表的社团活动，不予以加分且不记入星级社团评比，此外在社团
                                    活动申请表未提交或上交不及时的情况下，与其它社团活动地点发生冲突，则由先提交活动申请表的社团使用该活动地点。

                                    2、 
                                    没有上交活动申请表的社团活动，不予以加分且不记入星级社团评比，此外在社团
                                    活动申请表未提交或上交不及时的情况下，与其它社团活动地点发生冲突，则由先提交活动申请表的社团使用该活动地点。

                                    大学生社团联合会本着全心全意为社团服务为宗旨，打造星级社团为理念，为建设辽阳职院更好的明天而努力。望各社团谨遵此活动申请细则及相关注意事项，积极开展各项社团活动，创造辽阳职业技术学院积极向上、团结共进的社团文化氛围。
                        </div>
                    </div>
                    <div class="layui-tab-item apply-activity-detail">
                        <div class="tab-title">申请活动资料</div>
                        <div class="layui-form" enctype="multipart/form-data">
                            <div class="upload-info">
                                <div class="info-title">活动概要</div>
                                <div class="upload-form">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">活动标题</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" required lay-verify="name" placeholder="请输入活动标题" class="layui-input" onkeyup="keyUP(this)">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">活动时间</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="time_range" required lay-verify="time_range" class="layui-input" id="photoTime" placeholder="请选择活动时间范围">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">活动主题</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="topic" required lay-verify="topic" placeholder="请输入活动主题" class="layui-input" onkeyup="keyUP(this)">
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">活动简介</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea name="describe" required lay-verify="describe" placeholder="请输入活动简介" class="layui-textarea activity-decsibe" onkeyup="keyUP(this)"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">活动内容</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea name="content" required lay-verify="content" placeholder="请输入活动内容" class="layui-textarea" id="activityContent"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">活动规则</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea name="rule" required lay-verify="rule" placeholder="请输入活动规则" class="layui-textarea" id="activityRule"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传活动封面</div>
                                <input type="text" name="coverSrc" required lay-verify="coverSrc" placeholder="上传封面" hidden id="coverSrc" value="">
                                <div class="layui-upload-drag fl" id="uploadCover">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl cover-show">
                                    <img class="layui-upload-img" id="coverShow">
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传活动banner</div>
                                <input type="text" name="bannerSrc" required lay-verify="bannerSrc" placeholder="上传banner" hidden id="bannerSrc" value="">
                                <div class="layui-upload-drag fl" id="uploadBanner">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl banner-show">
                                    <img class="layui-upload-img" id="bannerShow">
                                </div>
                            </div>
                            <div class="upload-form">
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn layui-btn-primary cancle-btn">取消</button>
                                        <button class="layui-btn" lay-submit lay-filter="formSubmit">提交审核</button>
                                    </div>
                                </div>
                            </div>
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

{% block script %}
    <script>
        $('.cancle-btn').on('click', function() {
            pageJumpsHandle();
        })

        /**
         * textarea限制字数
         * @param {textarea限制字数} t
         */
        function keyUP(t){
            if(t.name == 'name') {
                var len = $(t).val().length;
                if(len > 20){
                    $(t).val($(t).val().substring(0,20));
                }
            }
            if(t.name == 'topic') {
                var len = $(t).val().length;
                if(len > 30){
                    $(t).val($(t).val().substring(0,30));
                }
            }
            if(t.name == 'describe') {
                var len = $(t).val().length;
                if(len > 139){
                    $(t).val($(t).val().substring(0,140));
                }
            }
        }
    </script>
    <script>
        //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
        layui.use(['element', 'form', 'layedit', 'laydate', 'upload'], function(){
            var form = layui.form,
                layer = layui.layer,
                layedit = layui.layedit,
                laydate = layui.laydate,
                element = layui.element;
            
            /*
             * 表单处理
             */
            //日期时间选择器
            laydate.render({
                elem: '#photoTime',
                type: 'datetime',
                range: true,
            });

            //建立编辑器
            var activityContent = layedit.build('activityContent', {
                uploadImage: {url: '/qiniu', type: 'post'}
            });
            var activityRule = layedit.build('activityRule', {
                uploadImage: {url: '/qiniu', type: 'post'}
            });
            
            //自定义验证规则
            form.verify({
                name: function(value){
                    if(!!value) {
                    } else {
                        return '活动标题不能为空';
                    }
                },
                time_range: function(value){
                    if(!!value) {
                    } else {
                        return '活动时间范围不能为空';
                    }
                },
                topic: function(value){
                    if(!!value) {
                    } else {
                        return '活动主题不能为空';
                    }
                },
                describe: function(value){
                    if(!!value) {
                    } else {
                        return '活动简介不能为空';
                    }
                },
                coverSrc: function(value){
                    if(!!value) {
                    } else {
                        return '必须上传活动封面';
                    }
                },
                bannerSrc: function(value){
                    if(!!value) {
                    } else {
                        return '必须上传活动banner';
                    }
                },
            });
            
            //监听提交
            form.on('submit(formSubmit)', function(data){
                var uploadData = JSON.parse(JSON.stringify(data.field));
                var time_range = uploadData.time_range.split(' - ');
                var contentData = layedit.getContent(activityContent);
                var ruleData = layedit.getContent(activityRule);
                // 单独验证活动内容和规则不能为空
                if (!!contentData) {
                } else {
                    alert('活动内容不能为空');
                }
                if (!!ruleData) {
                } else {
                    alert('活动规则不能为空');
                }
                if(!cacheGet('userLoginInfo').id) {
                    alert('登录超时，请重新登录！');
                    location.href = '/login';
                    return;
                }
                $.ajax({
                    type: 'post',
                    url: '/operation/apply_activity',
                    data: {
                        name: uploadData.name,
                        initiator: cacheGet('userLoginInfo').id,
                        topic: uploadData.topic,
                        describe: uploadData.describe,
                        content: contentData,
                        rule: ruleData,
                        cover: uploadData.coverSrc,
                        banner: uploadData.bannerSrc,
                        start_time: time_range[0],
                        end_time: time_range[1],
                    },
                    success: function(result){
                        alert('申请活动信息提交成功');
                        pageJumpsHandle();
                    },
                    error: function(err) {
                        alert('申请活动信息提交失败，请稍候重试');
                    }
                })
            });

            /*
             * 图片上传
             */
            var $ = layui.jquery,
                upload = layui.upload;
            
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
                        $('.cover-show').show();
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

            // 上传banner处理
            var uploadBanner = upload.render({
                elem: '#uploadBanner',
                url: '/qiniu',
                accept: 'images',
                acceptMime: 'image/*',
                exts: 'png|jpg|bmp|jpeg|gif',
                size: 1024,
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#bannerShow').attr('src', result); //图片链接（base64）
                        $('.banner-show').show();
                    });
                },
                done: function(res){
                    $('#bannerSrc').val(res.data.src);
                    return layer.msg('上传成功');
                },
                error: function(){
                    //演示失败状态，并实现重传
                    var bannerShow = $('#bannerShow');
                    bannerShow.after('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    bannerShow.next('.demo-reload').on('click', function(){
                        uploadBanner.upload();
                    });
                }
            });
        });
    </script>
{% endblock %}