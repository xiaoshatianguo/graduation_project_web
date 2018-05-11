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
                            {{ activityData.rule }}
                        </div>
                    </div>
                    <div class="layui-tab-item original-statement">
                        <div class="tab-title">原创声明</div>
                        <div class="statement-info">
                                本人郑重声明：所呈交的参赛作品《                                        》，是本人在教师的指导下，独立进行研究工作所取得的真实成果。除文中已注明引用的内容外，参赛作品中不含任何其他个人或集体已经发表或撰写过的作品成果。对本人参赛作品的创作做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。

                            1、本网站所收集的部分公开资料来源于互联网，转载的目的在于为公众传播有益资讯信息，并不代表本网站赞同其观点或对其真实性负责，我们不对其科学性、严肃性等作任何形式的保证。如其他媒体、网络或个人从本网下载使用须自负版权等法律责任。
                            <br><br>
                            2、本网站内凡注明“来源于TOP6000摄影”的所有文字、图片和音视频稿件均属本网站原创内容，版权均属本网站所有，任何媒体、网站或个人未经本网站协议授权不得转载、链接、转帖或以其他方式复制发表。本网协议授权的媒体、网站，在截图或转载使用时必须注明“稿件来源：“TOP6000摄影”，违者本网将依法追究责任。此外，凡在TOP6000摄影网上传的用户原创作品，TOP6000摄影网有权使用（用于宣传、推广），不承担任何法律责任。
                            <br><br>
                            3、凡本网站用户上传的所有的文章、图片、音频视频文件等资料的版权归版权所有人所有，本站无法一一核实海量内容，如果版权所有人认为其作品不宜上网供大家浏览，请及时与我们联系，以便我们迅速采取删除等措施。
                            <br><br>
                            4、对于已经授权本站独家使用、提供给本站资料的版权所有人的作品资料，如需转载使用，需取得本站和版权所有人的同意。如有任何未经许可使用上述资料行为，本网站必依法追究其法律责任。
                            <br><br>
                            5、本网站致力于提供合理、准确、完整的资讯信息，但不保证信息的合理性、准确性和完整性，且不对因信息的不合理、不准确或遗漏导致的任何损失或损害承担责任。本网站所有信息仅供参考，不做交易和服务的根据，如自行使用本网资料出现任何问题，本站概不负责，亦不负任何法律责任。
                            <br><br>
                            6、任何由于黑客攻击、计算机病毒侵入或发作、因政府管制而造成的暂时性关闭等影响网络正常经营的不可抗力而造成的损失，本网站均得免责。由于与本网站链接的其它网站所造成之个人资料泄露及由此而导致的任何法律争议和后果，本网站均得免责。
                            <br><br>
                            7、本网站如因系统维护或升级而需暂停服务时，将事先公告。若因线路及非本公司控制范围外的硬件故障或其它不可抗力而导致暂停服务，于暂停服务期间造成的一切不便与损失，本网站不负任何责任。
                            <br><br>
                            8、本网站使用者因为违反本声明的规定而触犯中华人民共和国法律的，一切后果自己负责，本网站不承担任何责任。
                            <br><br>
                            9、凡以任何方式登陆本网站或直接、间接使用本网站资料者，视为自愿接受本网站声明的约束。
                            <br><br>
                            10、本声明未涉及的问题参见国家有关法律法规，当本声明与国家法律法规冲突时，以国家法律法规为准。
                        </div>
                    </div>
                    <div class="layui-tab-item upload-production">
                        <div class="tab-title">上传作品</div>
                        <div class="layui-form" action="" enctype="multipart/form-data">
                            <div class="upload-info">
                                <div class="info-title">作品信息</div>
                                <div class="upload-form">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">作品标题</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" required lay-verify="name" placeholder="请输入作品标题" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item production-sort">
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
                                            <textarea class="layui-textarea" name="describe" lay-verify="describe" placeholder="请输入作品简介" onkeyup="keyUP(this)"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">描述详情</label>
                                        <div class="layui-input-block describe-detail">
                                            <textarea class="layui-textarea" name="content" lay-verify="content" placeholder="请输入描述详情" id="productionDescribe"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传作品</div>
                                <input type="text" name="productionSrc" required lay-verify="productionSrc" placeholder="上传作品" hidden id="productionSrc" value="">
                                <div class="layui-upload-drag fl" id="uploadProduction">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shangchuan"></use>
                                    </svg>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                                <div class="layui-upload-list fl production-show" id="productionShow">
                                </div>
                            </div>
                            <div class="upload-info clear-f">
                                <div class="info-title">上传封面</div>
                                <input type="text" name="coverSrc" required lay-verify="coverSrc" placeholder="上传作品" hidden id="coverSrc" value="">
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
                                <div class="info-title">上传banner</div>
                                <input type="text" name="bannerSrc" required lay-verify="bannerSrc" placeholder="上传作品" hidden id="bannerSrc" value="">
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

        /**
         * textarea限制字数
         * @param {textarea限制字数} t
         */
         function keyUP(t){
            if(t.name == 'describe') {
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

            var productionSrc = [];
            var activityId = getQueryString('activityId');

            //建立编辑器
            var productionDescribe = layedit.build('productionDescribe', {
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
                        return '作品类别不能为空';
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
                var describeData = layedit.getContent(productionDescribe);
                // 单独验证活动内容和规则不能为空
                if (!!describeData) {
                } else {
                    alert('描述详情不能为空');
                }
                $.ajax({
                    type: 'post',
                    url: '/operation/upload_production',
                    data: {
                        name: uploadData.name,
                        author_id: cacheGet('userLoginInfo').id,
                        activity_id: activityId,
                        production: uploadData.productionSrc,
                        cover: uploadData.coverSrc,
                        banner: uploadData.bannerSrc,
                        describe: describeData,
                        photography_props: uploadData.photography_props,
                        photography_site: uploadData.photography_site,
                        content: uploadData.content,
                    },
                    success: function(result){
                        alert('作品信息提交成功');
                        pageJumpsHandle();
                    },
                    error: function(err) {
                        alert('作品信息提交失败，请稍候重试');
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