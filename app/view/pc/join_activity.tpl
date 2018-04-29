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
                    <li class="layui-this tab-item">活动规则</li>
                    <li class="tab-item">原创声明</li>
                    <li class="tab-item">上传作品</li>
                </ul>
                <div class="layui-tab-content fl">
                    <div class="layui-tab-item layui-show activity-rule">
                        <div class="tab-title">活动规则</div>
                        <div class="rule-info">
                            活动规则
                        </div>
                    </div>
                    <div class="layui-tab-item original-statement">
                        <div class="tab-title">原创声明</div>
                        <div class="statement-info">
                            原创声明
                        </div>
                    </div>
                    <div class="layui-tab-item upload-production">
                        <div class="tab-title">上传作品</div>
                        <form class="layui-form" action="" enctype="multipart/form-data">
                            <div class="upload-info">
                                <div class="info-title">作品信息</div>
                                <div class="upload-form">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">作品标题</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" required lay-verify="name" placeholder="请输入作品标题" class="layui-input aa">
                                        </div>
                                    </div>
                                    <!-- <div class="layui-form-item production-sort">
                                        <label class="layui-form-label">作品类别</label>
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
                                        <label class="layui-form-label">摄影道具</label>
                                        <div class="layui-input-block">
                                            <input class="layui-input" type="text" name="photography_props" required lay-verify="photography_props" placeholder="请输入摄影道具">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">摄影地点</label>
                                        <div class="layui-input-block">
                                            <input class="layui-input" type="text" name="photography_site" required lay-verify="photography_site" placeholder="请输入摄影地点">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">作品简介</label>
                                        <div class="layui-input-block">
                                            <textarea class="layui-textarea" name="describe" lay-verify="describe" placeholder="请输入作品简介"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">描述详情</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea class="layui-textarea" name="content" lay-verify="content" placeholder="请输入描述详情"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传作品</div>
                                <div class="layui-upload-drag fl" id="uploadProduction">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl production-show" id="productionShow">
                                    <!-- <p id="demoText"></p> -->
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传封面</div>
                                <div class="layui-upload-drag fl" id="uploadCover">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl cover-show">
                                    <img class="layui-upload-img" id="coverShow">
                                    <!-- <p id="demoText"></p> -->
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传banner</div>
                                <div class="layui-upload-drag fl" id="uploadBanner">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl banner-show">
                                    <img class="layui-upload-img" id="bannerShow">
                                    <!-- <p id="demoText"></p> -->
                                </div>
                            </div>
                            <div class="upload-form">
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn publich-btn" lay-submit lay-filter="formCancle">取消</button>
                                        <button class="layui-btn publich-btn" lay-submit lay-filter="formSubmit">立即提交</button>
                                    </div>
                                </div>
                            </div>
                        </form>
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
            
            //自定义验证规则
            form.verify({
                name: function(value){
                    if(!!value) {

                    } else {
                        return '标题不能为空';
                    }
                },
                photography_props: function(value){
                    if(!!value) {

                    } else {
                        return 'photography_props不能为空';
                    }
                },
                photography_site: function(value){
                    if(!!value) {

                    } else {
                        return 'photography_site不能为空';
                    }
                },
                describe: function(value) {
                    if(!!value) {

                    } else {
                        return 'describe不能为空';
                    }
                },
                content: function(value) {
                    if(!!value) {

                    } else {
                        return 'content不能为空';
                    }
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
            
            // 上传作品处理
            var uploadProduction = upload.render({
                elem: '#uploadProduction',
                url: '/qiniu',
                multiple: true,
                accept: 'images',
                acceptMime: 'image/*',
                exts: 'png|jpg|bmp|jpeg|gif',
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#productionShow').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                        $('.production-show').show();
                    });
                },
                done: function(res){
                    return layer.msg('上传成功');
                },
                error: function(){
                    //演示失败状态，并实现重传
                    // var demoText = $('#demoText');
                    // demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    // demoText.find('.demo-reload').on('click', function(){
                    //     uploadProduction.upload();
                    // });
                }
            });

            // 上传封面处理
            var uploadCover = upload.render({
                elem: '#uploadCover',
                url: '/qiniu',
                size: 1024,
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#coverShow').attr('src', result); //图片链接（base64）
                        $('.cover-show').show();
                    });
                },
                done: function(res){
                    return layer.msg('上传成功');
                },
                error: function(){
                    //演示失败状态，并实现重传
                    // var demoText = $('#demoText');
                    // demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    // demoText.find('.demo-reload').on('click', function(){
                    //     uploadCover.upload();
                    // });
                }
            });

            // 上传Banner处理
            var uploadBanner = upload.render({
                elem: '#uploadBanner',
                url: '/qiniu',
                size: 1024,
                before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#bannerShow').attr('src', result); //图片链接（base64）
                        $('.banner-show').show();
                    });
                },
                done: function(res){
                    return layer.msg('上传成功');
                },
                error: function(){
                    //演示失败状态，并实现重传
                    // var demoText = $('#demoText');
                    // demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    // demoText.find('.demo-reload').on('click', function(){
                    //     uploadCover.upload();
                    // });
                }
            });
        });
    </script>
{% endblock %}