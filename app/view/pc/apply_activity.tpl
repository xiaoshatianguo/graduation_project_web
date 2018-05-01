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
    <div class="join-activity-div">
        <div class="container">
            <div class="layui-tab clear-f">
                <ul class="layui-tab-title fl flex-box fd-col clear-f">
                    <li class="layui-this tab-item">申请活动规则</li>
                    <li class="tab-item">申请活动资料</li>
                </ul>
                <div class="layui-tab-content fl">
                    <div class="layui-tab-item layui-show apply-activity-rule">
                            <div class="tab-title">申请活动规则</div>
                    </div>
                    <div class="layui-tab-item apply-activity-detail">
                        <div class="tab-title">申请活动资料</div>
                        <div class="upload-info">
                            <div class="info-title">活动概要</div>
                            <div class="upload-form">
                                <form class="layui-form" action="">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">活动标题</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" required lay-verify="required" placeholder="请输入活动标题" class="layui-input">
                                        </div>
                                    </div>
                                    <!-- <div class="layui-form-item">
                                        <label class="layui-form-label">活动类别</label>
                                        <div class="layui-input-block">
                                            <select name="interest" lay-filter="aihao">
                                            <option value=""></option>
                                            <option value="0">写作</option>
                                            <option value="1" selected="">阅读</option>
                                            <option value="2">游戏</option>
                                            <option value="3">音乐</option>
                                            <option value="4">旅行</option>
                                            </select>
                                        </div>
                                    </div> -->
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">活动时间</label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" id="photoTime" placeholder="请选择活动时间范围">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">活动主题</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="title" required lay-verify="required" placeholder="请输入活动主题" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">活动简介</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">活动内容</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea name="desc" placeholder="请输入内容" class="layui-textarea" id="activityContent"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">活动规则</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea name="desc" placeholder="请输入内容" class="layui-textarea" id="activityRule"></textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="upload-info">
                            <div class="info-title">上传活动封面</div>
                            <div class="layui-upload-drag" id="uploadCover">
                                <i class="layui-icon"></i>
                                <p>点击上传，或将文件拖拽到此处</p>
                            </div>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="coverShow">
                                <p id="demoText"></p>
                            </div>
                        </div>
                        <div class="upload-info">
                            <div class="info-title">上传活动banner</div>
                            <div class="layui-upload-drag" id="uploadCover">
                                <i class="layui-icon"></i>
                                <p>点击上传，或将文件拖拽到此处</p>
                            </div>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="coverShow">
                                <p id="demoText"></p>
                            </div>
                        </div>
                        <div class="upload-form">
                            <form class="layui-form" action="">
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn publich-btn" lay-submit lay-filter="formCancle">取消</button>
                                        <button class="layui-btn publich-btn" lay-submit lay-filter="formSubmit">提交审核</button>
                                    </div>
                                </div>
                            </form>
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
            
            //创建一个编辑器
            var editIndex = layedit.build('activityContent');
            var editIndex2 = layedit.build('activityRule');
            
            //自定义验证规则
            form.verify({
                title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
                }
                ,pass: [/(.+){6,12}$/, '密码必须6到12位']
                ,content: function(value){
                layedit.sync(editIndex);
                layedit.sync(editIndex2);
                }
            });
            
            //监听提交
            form.on('submit(formSubmit)', function(data){
                layer.alert(JSON.stringify(data.field), {
                    title: '最终的提交信息'
                })
                return false;
            });

            /*
             * 图片上传
             */
            var $ = layui.jquery,
                upload = layui.upload;
            
            // 上传封面处理
            var uploadCover = upload.render({
                elem: '#uploadCover',
                url: '/upload/',
                size: 60,
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        // $('#demo1').attr('src', result); //图片链接（base64）
                        $('#coverShow').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                    });
                },
                done: function(res){
                    //如果上传失败
                    if(res.code > 0){
                        return layer.msg('上传失败');
                    }
                    //上传成功
                },
                error: function(){
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function(){
                        uploadCover.upload();
                    });
                }
            });

            // 上传作品处理
            var uploadCover = upload.render({
                elem: '#uploadCover',
                url: '/upload/',
                size: 1024,
                multiple: true,
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        // $('#demo1').attr('src', result); //图片链接（base64）
                        $('#productionShow').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                    });
                },
                done: function(res){
                    //如果上传失败
                    if(res.code > 0){
                        return layer.msg('上传失败');
                    }
                    //上传成功
                },
                error: function(){
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function(){
                        uploadCover.upload();
                    });
                }
            });
        });
    </script>
{% endblock %}