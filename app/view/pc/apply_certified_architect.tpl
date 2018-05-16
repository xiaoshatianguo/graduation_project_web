{% extends "./template/template.tpl" %}
{% import "pc/macro/tip_cover.tpl" as tipCover %}

{% block tip %}
<div class="login-out-tip">
    {{ tipCover.tip(type="alert", msg ='确定退出当前账号？', time="", style="", opration="logout()") }}
</div>
<div class="success-apply">
    {{ tipCover.tip(type="alert", msg ='申请认证师提交成功，请等待审核结果', time="", style="", opration="logout()") }}
</div>
<div class="fail-apply">
    {{ tipCover.tip(type="alert", msg ='申请认证师提交失败，请稍候重试', time="", style="", opration="logout()") }}
</div>
{% endblock %}

{% block banner %}
    
{% endblock %}

{% block top %}
    <div class="apply-certified-architect">
        <div class="container">
            <div class="layui-tab clear-f">
                <ul class="layui-tab-title fl flex-box fd-col clear-f">
                    <li class="layui-this tab-item">申请认证师资格说明</li>
                    <li class="tab-item">申请认证师资料提交</li>
                </ul>
                <div class="layui-tab-content fl">
                    <div class="layui-tab-item layui-show apply-rule">
                        <div class="tab-title">申请认证师资格说明</div>
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
                    <div class="layui-tab-item apply-detail">
                        <div class="tab-title">申请认证师资料提交</div>
                        <dic class="layui-form" enctype="multipart/form-data">
                            <div class="upload-info">
                                <div class="info-title">认证师信息</div>
                                <div class="upload-form">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">真实名字</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" required lay-verify="name" placeholder="请输入您的真实名字" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item production-sort">
                                        <label class="layui-form-label">擅长领域</label>
                                        <div class="layui-input-block">
                                            <select class="sort-select" name="sort" lay-filter="sort" lay-verify="sort">
                                                <option value="">请选择擅长领域</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">QQ</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="qq" placeholder="请输入QQ" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">微信</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="wechat" placeholder="请输入微信" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">个人介绍</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea name="personal_describe" placeholder="请输入个人介绍" required lay-verify="personal_describe" class="layui-textarea" id="activityContent" onkeyup="keyUP(this)"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传认证师获奖作品</div>
                                <input type="text" name="prizeSrc" required lay-verify="prizeSrc" placeholder="上传获奖作品" hidden id="prizeSrc" value="">
                                <div class="layui-upload-drag fl" id="uploadPrize">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl prize-show" id="prizeShow">
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传认证师申请凭证</div>
                                <input type="text" name="certificateSrc" required lay-verify="certificateSrc" placeholder="上传获奖凭证" hidden id="certificateSrc" value="">
                                <div class="layui-upload-drag fl" id="uploadCertificate">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl certificate-show" id="certificateShow">
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
            if(t.name == 'personal_describe') {
                var len = $(t).val().length;
                if(len > 150){
                    $(t).val($(t).val().substring(0,150));
                }
            }
        }

        // 分类选择填充数据
        var sortData = cacheGet('sortData');
        var sortHtml = '';
        if(sortData.length > 0) {
            for (let i = 0; i < sortData.length; i++) {
                sortHtml += `
                    <option value="${sortData[i].id}">${sortData[i].name}</option>
                `
            }
        }
        $('.sort-select').append(sortHtml);
    </script>
    <script>
        //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
        layui.use(['element', 'form', 'layedit', 'laydate', 'upload'], function(){
            var form = layui.form,
                layer = layui.layer,
                layedit = layui.layedit,
                laydate = layui.laydate,
                element = layui.element;
            
            //自定义验证规则
            form.verify({
                name: function(value){
                    if(!!value) {
                    } else {
                        return '活动标题不能为空';
                    }
                },
                sort: function(value){
                    if(!!value) {
                    } else {
                        return '擅长领域不能为空';
                    }
                },
                personal_describe: function(value){
                    if(!!value) {
                    } else {
                        return '个人简介不能为空';
                    }
                },
                prizeSrc: function(value){
                    if(!!value) {
                    } else {
                        return '必须上传获奖作品';
                    }
                },
                certificateSrc: function(value){
                    if(!!value) {
                    } else {
                        return '必须上传申请认证师凭证';
                    }
                },
            });
            
            //监听提交
            form.on('submit(formSubmit)', function(data){
                var uploadData = JSON.parse(JSON.stringify(data.field));
                $.ajax({
                    type: 'post',
                    url: '/operation/apply_certified_architect',
                    data: {
                        id: cacheGet('userLoginInfo').id,
                        name: uploadData.name,
                        qq: uploadData.qq,
                        wechat: uploadData.wechat,
                        personal_describe: uploadData.personal_describe,
                        prize: uploadData.prizeSrc,
                        certificate: uploadData.certificateSrc,
                    },
                    success: function(result){
                        tipController('.success-apply .cover');
                        setTimeout(function() {
                            pageJumpsHandle();
                        },1000)
                    },
                    error: function(err) {
                        tipController('.fail-apply .cover');
                    }
                })
            });

            /*
             * 图片上传
             */
            var $ = layui.jquery,
                upload = layui.upload;

            var prizeSrc = [];
            var certificateSrc = [];

            // 上传获奖作品处理
            var uploadPrizeSrc = upload.render({
                elem: '#uploadPrize',
                url: '/operation/apply_certified_architect',
                multiple: true,
                accept: 'images',
                acceptMime: 'image/*',
                exts: 'png|jpg|bmp|jpeg|gif',
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#prizeShow').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img"><div class="prize-error"></div>')
                        $('.prize-show').show();
                    });
                },
                done: function(res){
                    prizeSrc.push(res.src);
                    $('#prizeSrc').val(prizeSrc);
                    $('.form-tip .cover').find('.main-body').text('上传成功');
                    tipController('.form-tip .cover');
                },
                error: function(){
                    //演示失败状态，并实现重传
                    var prizeError = $('.prize-error');
                    prizeError.html('<span style="color: #f39549;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    prizeError.find('.demo-reload').on('click', function(){
                        uploadPrizeSrc.upload();
                    });
                }
            });

            // 上传凭证处理
            var uploadCertificate = upload.render({
                elem: '#uploadCertificate',
                url: '/operation/apply_certified_architect',
                multiple: true,
                accept: 'images',
                acceptMime: 'image/*',
                exts: 'png|jpg|bmp|jpeg|gif',
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#certificateShow').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img"><div class="certificate-error"></div>')
                        $('.certificate-show').show();
                    });
                },
                done: function(res){
                    certificateSrc.push(res.src);
                    $('#certificateSrc').val(certificateSrc);
                    $('.form-tip .cover').find('.main-body').text('上传成功');
                    tipController('.form-tip .cover');
                },
                error: function(){
                    //演示失败状态，并实现重传
                    var certificateError = $('.certificate-error');
                    certificateError.html('<span style="color: #f39549;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    certificateError.find('.demo-reload').on('click', function(){
                        uploadCertificate.upload();
                    });
                }
            });
        });
    </script>
{% endblock %}