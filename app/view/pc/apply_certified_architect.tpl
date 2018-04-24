{% extends "./template/template.tpl" %}

{% block banner %}
    
{% endblock %}

{% block top %}
    <div class="join-activity-div">
        <div class="container">
            <div class="layui-tab clear-f">
                <ul class="layui-tab-title fl flex-box fd-col clear-f">
                    <li class="layui-this tab-item">申请认证师资格说明</li>
                    <li class="tab-item">申请认证师资料提交</li>
                </ul>
                <div class="layui-tab-content fl">
                    <div class="layui-tab-item apply-activity-rule">
                        <div class="tab-title">申请认证师资格说明</div>
                    </div>
                    <div class="layui-tab-item layui-show apply-activity-detail">
                        <div class="tab-title">申请认证师资料提交</div>
                        <div class="upload-info">
                            <div class="info-title">认证师信息</div>
                            <div class="upload-form">
                                <form class="layui-form" action="">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">真实名字</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="title" required lay-verify="required" placeholder="请输入您的真实名字" autocomplete="off" class="layui-input aa">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">所在城市</label>
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
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">设计领域</label>
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
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">QQ</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="title" required lay-verify="required" placeholder="请输入QQ" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">微信</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="title" required lay-verify="required" placeholder="请输入微信" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">个人介绍</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea name="desc" placeholder="请输入个人介绍" class="layui-textarea" id="activityContent"></textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="upload-info">
                            <div class="info-title">上传认证师获奖作品</div>
                            <div class="layui-upload-drag" id="uploadProduction">
                                <i class="layui-icon"></i>
                                <p>点击上传，或将文件拖拽到此处</p>
                            </div>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="productionShow">
                                <p id="demoText"></p>
                            </div>
                        </div>
                        <div class="upload-info">
                            <div class="info-title">上传认证师证书资料</div>
                            <div class="layui-upload">
                                <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
                                <div class="layui-upload-list">
                                    <table class="layui-table">
                                    <thead>
                                        <tr><th>文件名</th>
                                        <th>大小</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr></thead>
                                    <tbody id="demoList"></tbody>
                                    </table>
                                </div>
                                <button type="button" class="layui-btn" id="testListAction">开始上传</button>
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
            
            //自定义验证规则
            form.verify({
                title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
                }
                ,pass: [/(.+){6,12}$/, '密码必须6到12位']
                ,content: function(value){
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

            var demoListView = $('#demoList'),
                uploadListIns = upload.render({
                    elem: '#testList',
                    url: '/upload/',
                    accept: 'file',
                    multiple: true,
                    auto: false,
                    bindAction: '#testListAction',
                    choose: function(obj){   
                        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                        //读取本地文件
                        obj.preview(function(index, file, result){
                            var tr = $(['<tr id="upload-'+ index +'">',
                                '<td>'+ file.name +'</td>',
                                '<td>'+ (file.size/1014).toFixed(1) +'kb</td>',
                                '<td>等待上传</td>',
                                '<td>',
                                    '<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>',
                                    '<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>',
                                '</td>',
                                '</tr>'].join(''));
                                
                            //单个重传
                            tr.find('.demo-reload').on('click', function(){
                                obj.upload(index, file);
                            });
                            
                            //删除
                            tr.find('.demo-delete').on('click', function(){
                                delete files[index]; //删除对应的文件
                                tr.remove();
                                uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                        });
                        
                        demoListView.append(tr);
                    });
                },
                done: function(res, index, upload){
                    if(res.code == 0){ //上传成功
                        var tr = demoListView.find('tr#upload-'+ index)
                        ,tds = tr.children();
                        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                        tds.eq(3).html(''); //清空操作
                        return delete this.files[index]; //删除文件队列已经上传成功的文件
                    }
                    this.error(index, upload);
                },
                error: function(index, upload){
                    var tr = demoListView.find('tr#upload-'+ index)
                    ,tds = tr.children();
                    tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                    tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
                }
            });
        });
    </script>
{% endblock %}