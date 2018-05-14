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
    <div class="publish-production-div">
        <div class="container">
            <div class="layui-tab clear-f">
                <ul class="layui-tab-title fl flex-box fd-col clear-f">
                    <li class="layui-this tab-item">发布作品规则</li>
                    <li class="tab-item">作品原创声明</li>
                    <li class="tab-item">上传作品相关</li>
                </ul>
                <div class="layui-tab-content fl">
                    <div class="layui-tab-item layui-show activity-rule">
                        <div class="tab-title">发布作品规则</div>
                        <div class="rule-info">
                            发布作品规则
                        </div>
                    </div>
                    <div class="layui-tab-item original-statement">
                        <div class="tab-title">作品原创声明</div>
                        <div class="statement-info">
                            作品原创声明
                        </div>
                    </div>
                    <div class="layui-tab-item upload-production">
                        <div class="tab-title">上传作品相关</div>
                        <div class="layui-form" action="" enctype="multipart/form-data">
                            <div class="upload-info">
                                <div class="info-title">作品信息</div>
                                <div class="upload-form">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">作品标题</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" required lay-verify="name" placeholder="请输入作品标题" class="layui-input" value="{{ productionData.name }}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item production-sort" productionSort="{{ productionData.sort }}">
                                        <label class="layui-form-label">作品类别</label>
                                        <div class="layui-input-block">
                                            <select class="sort-select" name="sort" lay-filter="sort" lay-verify="sort">
                                                <option value="">请选择作品发布的类别</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">摄影道具</label>
                                        <div class="layui-input-block">
                                            <input class="layui-input" type="text" name="photography_props" required lay-verify="photography_props" placeholder="请输入摄影道具" value="{{ productionData.photography_props }}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">摄影地点</label>
                                        <div class="layui-input-block">
                                            <input class="layui-input" type="text" name="photography_site" required lay-verify="photography_site" placeholder="请输入摄影地点" value="{{ productionData.photography_site }}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">作品简介</label>
                                        <div class="layui-input-block">
                                            <textarea class="layui-textarea" name="describe" lay-verify="describe" placeholder="请输入作品简介">{{ productionData.describe }}</textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">描述详情</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea class="layui-textarea" name="content" lay-verify="content" placeholder="请输入描述详情" id="describeDetail">{{ productionData.content }}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传作品</div>
                                <input type="text" name="productionSrc" required lay-verify="productionSrc" placeholder="上传作品" hidden id="productionSrc" value="{{ productionData.production }}">
                                <div class="layui-upload-drag fl" id="uploadProduction">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl production-show" id="productionShow">
                                    {% for item in productionData.production %}
                                        <img src="{{ item }}" alt="" class="layui-upload-img">
                                    {% endfor %}
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传封面</div>
                                <input type="text" name="coverSrc" required lay-verify="coverSrc" placeholder="上传作品" hidden id="coverSrc" value="{{ productionData.cover }}">
                                <div class="layui-upload-drag fl" id="uploadCover">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl cover-show">
                                    <img src="{{ productionData.cover }}" class="layui-upload-img" id="coverShow">
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传banner</div>
                                <input type="text" name="bannerSrc" required lay-verify="bannerSrc" placeholder="上传作品" hidden id="bannerSrc" value="{{ productionData.banner }}">
                                <div class="layui-upload-drag fl" id="uploadBanner">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl banner-show">
                                    <img src="{{ productionData.banner }}" class="layui-upload-img" id="bannerShow">
                                </div>
                            </div>
                            <div class="upload-form">
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn layui-btn-primary cancle-btn">取消</button>
                                        <button class="layui-btn" lay-submit lay-filter="formSubmit">立即提交</button>
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

        var productionSort = $('.production-sort').attr('productionSort');

        // 分类选择填充数据
        var sortData = cacheGet('sortData');
        var sortHtml = '';
        if(sortData.length > 0) {
            for (let i = 0; i < sortData.length; i++) {
                if(productionSort == sortData[i].id) {
                    sortHtml += `
                        <option value="${sortData[i].id}" selected="selected">${sortData[i].name}</option>
                        `
                } else {
                    sortHtml += `
                        <option value="${sortData[i].id}">${sortData[i].name}</option>
                        `
                }
            }
        }
        $('.sort-select').append(sortHtml);

        // 数据回显
        $('#productionShow').show();
        $('.cover-show').show();
        $('.banner-show').show();
    </script>
    <script>
        //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
        layui.use(['element', 'form', 'layedit', 'laydate', 'upload'], function(){
            var form = layui.form,
                layer = layui.layer,
                layedit = layui.layedit,
                laydate = layui.laydate,
                element = layui.element;

            var productionSrc = [];

            //建立编辑器
            var describeDetail = layedit.build('describeDetail', {
                uploadImage: {url: '/qiniu', type: 'post'}
            });
            
            //自定义验证规则
            form.verify({
                name: function(value){
                    if(!!value) {
                    } else {
                        return '标题不能为空';
                    }
                },
                sort: function(value){
                    if(!!value) {
                    } else {
                        return '发布类别不能为空';
                    }
                },
                photography_props: function(value){
                    if(!!value) {
                    } else {
                        return '摄影道具不能为空';
                    }
                },
                photography_site: function(value){
                    if(!!value) {
                    } else {
                        return '摄影地点不能为空';
                    }
                },
                describe: function(value) {
                    if(!!value) {
                    } else {
                        return '作品简介不能为空';
                    }
                },
                productionSrc: function(value) {
                    if(!!value) {
                    } else {
                        return '请上传作品';
                    }
                },
                coverSrc: function(value) {
                    if(!!value) {
                    } else {
                        return '请上传作品封面';
                    }
                },
                bannerSrc: function(value) {
                    if(!!value) {
                    } else {
                        return '请上传作品banner';
                    }
                },
            });

            //监听提交
            form.on('submit(formSubmit)', function(data){
                var uploadData = JSON.parse(JSON.stringify(data.field));
                var describeData = layedit.getContent(describeDetail);

                $.ajax({
                    type: 'post',
                    url: '/operation/edit_production',
                    data: {
                        id: getQueryString('productionId'),
                        name: uploadData.name,
                        author_id: cacheGet('userLoginInfo').id,
                        activity_id: 0,
                        sort: uploadData.sort,
                        production: uploadData.productionSrc,
                        cover: uploadData.coverSrc,
                        banner: uploadData.bannerSrc,
                        describe: uploadData.describe,
                        photography_props: uploadData.photography_props,
                        photography_site: uploadData.photography_site,
                        content: describeData,
                    },
                    success: function(result){
                        alert('作品信息修改成功');
                        pageJumpsHandle();
                    },
                    error: function(err) {
                        alert('作品信息修改失败，请稍候重试');
                    }
                })
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
                        $('#productionShow').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img"><div class="production-error"></div>')
                        $('.production-show').show();
                    });
                },
                done: function(res){
                    productionSrc.push(res.data.src);
                    $('#productionSrc').val(productionSrc);
                    return layer.msg('上传成功');
                },
                error: function(){
                    //演示失败状态，并实现重传
                    var productionError = $('.production-error');
                    productionError.html('<span style="color: #f39549;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    productionError.find('.demo-reload').on('click', function(){
                        uploadProduction.upload();
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

            // 上传Banner处理
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