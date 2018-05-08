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
                            活动规则
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
                        alert('申请认证师提交成功，请等待审核结果');
                        pageJumpsHandle();
                    },
                    error: function(err) {
                        alert('申请认证师提交失败，请稍候重试');
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
                    return layer.msg('上传成功');
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
                    return layer.msg('上传成功');
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

            // 上传多文件
            // var demoListView = $('#demoList');
            // var uploadListIns = upload.render({
            //         elem: '#testList',
            //         url: '/upload/',
            //         accept: 'file',
            //         multiple: true,
            //         auto: false,
            //         bindAction: '#testListAction',
            //         choose: function(obj){   
            //             var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
            //             //读取本地文件
            //             obj.preview(function(index, file, result){
            //                 var tr = $(['<tr id="upload-'+ index +'">',
            //                     '<td>'+ file.name +'</td>',
            //                     '<td>'+ (file.size/1014).toFixed(1) +'kb</td>',
            //                     '<td>等待上传</td>',
            //                     '<td>',
            //                         '<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>',
            //                         '<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>',
            //                     '</td>',
            //                     '</tr>'].join(''));
                                
            //                 //单个重传
            //                 tr.find('.demo-reload').on('click', function(){
            //                     obj.upload(index, file);
            //                 });
                            
            //                 //删除
            //                 tr.find('.demo-delete').on('click', function(){
            //                     delete files[index]; //删除对应的文件
            //                     tr.remove();
            //                     uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
            //             });
                        
            //             demoListView.append(tr);
            //         });
            //     },
            //     done: function(res, index, upload){
            //         if(res.code == 0){ //上传成功
            //             var tr = demoListView.find('tr#upload-'+ index)
            //             ,tds = tr.children();
            //             tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
            //             tds.eq(3).html(''); //清空操作
            //             return delete this.files[index]; //删除文件队列已经上传成功的文件
            //         }
            //         this.error(index, upload);
            //     },
            //     error: function(index, upload){
            //         var tr = demoListView.find('tr#upload-'+ index)
            //         ,tds = tr.children();
            //         tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
            //         tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
            //     }
            // });
        });
    </script>
{% endblock %}