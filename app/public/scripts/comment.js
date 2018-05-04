/**
 * textarea高度自适应
 */
$(function () {
    $('.content').flexText();
});

/**
 * textarea限制字数
 * @param {textarea限制字数} t
 */
function keyUP(t){
    var len = $(t).val().length;
    if(len > 139){
        $(t).val($(t).val().substring(0,140));
    }
}

/**
 * 点击评论创建评论条
 */
var userLoginInfo;
$('.commentAll').on('click','.plBtn',function(){
    // 判断是否登录
    if(!cacheGet('userLoginInfo')) {
        alert('请登录后再评论！');
        $(this).siblings('.flex-text-wrap').find('.comment-input').val('');
        location.href = '/login';
    } else {
        userLoginInfo = cacheGet('userLoginInfo');

        // 获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        
        // 评论内容不为空，动态创建评论模块
        if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){
            // 后台评论入库
            var sort = 0;
            saveComment(sort, $(this), oSize, userLoginInfo.id);
        } else {
            alert('评论不能为空！');
        }
    }
});

/**
 * 评论留言及回复存入数据库
 * @param _this 传$(this)
 * @param content 评论内容
 * @param user_id 评论者
 * @param father_id 被评论的评论id
 * @param to_id 被评论者的id
 */
function saveComment(sort, _this, content, user_id, father_id, to_id, child_father_id) {
    var activityId = getQueryString('activityId');
    var userId = getQueryString('userId');
    var productionId = getQueryString('productionId');

    $.ajax({
        url: '/operation/comment',
        type: 'post',
        data: {
            user_id: user_id,
            father_id: father_id || 0,
            to_id: to_id || 0,
            child_father_id: child_father_id || 0,
            production_id: productionId || 0,
            activity_id: activityId || 0,
            personal_id: userId || 0,
            content,
        },
        success: function(result) {
            if(result.comment_id) {
                // sort=0 主评论 sort=1 子评论
                if(sort == 0 ) {
                    addComments(_this, content, result.comment_id);
                } else {
                    addApplyComment(_this, content, result.comment_id);
                }
            }
        },
        error: function(err){
            console.log(err);
            console.log('评论失败');
            return false;
        }
    })
}

/**
 * 动态添加评论模块
 * @param _this 传$(this)
 * @param oSize 评论内容
 */
function addComments(_this, oSize, commentId) {
    // 获取当前时间
    var now = getTime();
    var oHtml = '';

    oHtml = `
        <div class="comment-show-con clear-f" commentId=${commentId}>
            <div class="comment-show-con-img fl" style="background-image:url(${userLoginInfo.portrait})"></div>
            <div class="comment-show-con-list fl clear-f">
                <div class="pl-text clear-f">
                    <a href="#" class="comment-size-name" userId=${userLoginInfo.id}>${userLoginInfo.nickname}：</a>
                    <span class="my-pl-con">&nbsp;${oSize}</span>
                </div>
                <div class="date-dz">
                    <span class="date-dz-left fl comment-time">${now}</span>
                    <div class="date-dz-right fr comment-pl-block">
                        <a href="javascript:;" class="removeBlock">删除</a>
                        <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block fl">回复(<i class="z-num">0</i>)</a>
                        <span class="fl date-dz-line">|</span>
                        <a href="javascript:;" class="date-dz-z fl">
                            <i class="date-dz-z-click-red"></i>赞(<i class="z-num">0</i>)
                        </a>
                    </div>
                </div>
                <div class="hf-list-con"></div>
            </div>
        </div>
            `;

    // 前端插入评论
    _this.parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
    // 清空评论输入框
    _this.siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
}

/**
 * 点击回复动态创建回复块
 */
$('.comment-show').on('click','.pl-hf',function(){
    // 被评论的评论id
    var father_id = $(this).parents('.comment-show-con').attr('commentId');

    var oThis = $(this);

    // 查询数据库，展示子评论
    $.ajax({
        url: '/operation/child_comment?father_id='+father_id,
        type: 'get',
        success: function(result) {
            // 如果有子评论则渲染
            if(result.length > 0) {
                showChildComments(oThis, result);
            }
            createCommentArea(oThis);
        },
        error: function(err) {
            console.log(err);
            alert('网络有问题，请稍候再试！');
        }
    })
});

/**
 * 创建回复块
 * @param _this 传入$(this)
 */
function createCommentArea(_this) {
    // 获取回复人的名字
    var fhName = _this.parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
    // 回复@
    var fhN = '回复@'+fhName;

    var fhHtml = `
        <div class="hf-con fl">
            <textarea class="content comment-input hf-input" placeholder="${fhN}" onkeyup="keyUP(this)"></textarea>
            <a href="javascript:;" class="hf-pl">评论</a>
        </div>
        `;
    // 显示回复
    if(_this.is('.hf-con-block')){
        _this.parents('.date-dz-right').parents('.date-dz').append(fhHtml);
        _this.removeClass('hf-con-block');
        $('.content').flexText();
        // input框自动聚焦
        _this.parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus();
    }else {
        _this.addClass('hf-con-block');
        _this.parents('.date-dz-right').siblings('.hf-con').remove();
        _this.parents('.date-dz').siblings('.hf-list-con').css('display', 'none');
    }
}

/**
 * 点击展开回复展示子评论
 * @param oThis 传入$(this)
 * @param result 子评论结果集
 */
function showChildComments(oThis, result) {
    var oHtml = '';

    for (let i = 0; i < result.length; i++) {
        var content;
        if(!!result[i].u2_nickname) {
            content = result[i].content + ' //@' + result[i].c2_content;
        } else {
            content = result[i].content;
        }
        oHtml += `
            <div class="all-pl-con" commentsId=${result[i].id}>
                <div class="pl-text hfpl-text clear-f">
                    <a href="#" class="comment-size-name" userId=${result[i].user_id}>${result[i].u1_nickname}：</a>
                    <span class="my-pl-con">${content}</span>
                </div>
                <div class="date-dz">
                    <span class="date-dz-left fl comment-time">${result[i].create_time}</span>
                    <div class="date-dz-right fr comment-pl-block">
                        <a href="javascript:;" class="removeBlock">删除</a>
                        <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block fl">回复(<i class="z-num">${result[i].number}</i>)</a>
                        <span class="fl date-dz-line">|</span>
                        <a href="javascript:;" class="date-dz-z fl">
                            <i class="date-dz-z-click-red"></i>赞(<i class="z-num">0</i>)
                        </a>
                    </div>
                </div>
            </div>
            `;
    }

    oThis.parents('.date-dz').siblings('.hf-list-con').html('').css('display','block').prepend(oHtml);
}

/**
 * 评论回复块创建
 */
$('.comment-show').on('click','.hf-pl',function(){
    // 判断是否登录
    if(!cacheGet('userLoginInfo')) {
        alert('请登录后再评论！');
        $(this).siblings('.flex-text-wrap').find('.comment-input').val('');
        location.href = '/login';
    } else {
        userLoginInfo = cacheGet('userLoginInfo');

        //获取输入内容
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();

        // 被评论的评论id
        var father_id = $(this).parents('.comment-show-con').attr('commentId');

        var to_id;
        var child_father_id;
        if($(this).parents('.hf-list-con').length > 0) {
            // 子评论中被评论的id
            child_father_id = $(this).parents('.all-pl-con').attr('commentsId');
            // 评论中被评论者的id
            // to_id = $(this).parents('.date-dz').siblings('.pl-text').find('.comment-size-name').attr('userId');
            to_id = $(this).parents('.all-pl-con').attr('commentsId');
        }
        
        //获取回复人的名字
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();

        if(oHfVal.replace(/(^\s*)|(\s*$)/g, "") != ''){
            // 后台数据入库
            var sort = 1;
            saveComment(sort, $(this), oHfVal, userLoginInfo.id, father_id, to_id, child_father_id);
        } else {
            alert('评论不能为空！');
        }
    }
});

/**
 * 动态添加回复评论模块dom结构
 * @param _this 传${this}
 * @param oHfVal 回复内容
 */
function addApplyComment(_this, oHfVal, commentId) {
    // 获取当前时间
    var now = getTime();
    var oHtml = '';

    oHtml = `
        <div class="all-pl-con" commentsId=${commentId}>
            <div class="pl-text hfpl-text clear-f">
                <a href="#" class="comment-size-name" userId=${userLoginInfo.id}>${userLoginInfo.nickname}：</a>
                <span class="my-pl-con">${oHfVal}</span>
            </div>
            <div class="date-dz">
                <span class="date-dz-left fl comment-time">${now}</span>
                <div class="date-dz-right fr comment-pl-block">
                    <a href="javascript:;" class="removeBlock">删除</a>
                    <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block fl">回复(<i class="z-num">0</i>)</a>
                    <span class="fl date-dz-line">|</span>
                    <a href="javascript:;" class="date-dz-z fl">
                        <i class="date-dz-z-click-red"></i>赞(<i class="z-num">0</i>)
                    </a>
                </div>
            </div>
        </div>
        `;

    // 主评论数量+1
    var curTotalCommentNumber = _this.parents('.comment-show-con-list').children('.date-dz').find('.pl-hf .z-num').html();
    curTotalCommentNumber++;
    _this.parents('.comment-show-con-list ').children('.date-dz').find('.pl-hf .z-num').html(curTotalCommentNumber);
    // 子评论数量+1
    if(_this.parents('.hf-list-con').length > 0) {
        var curChildCommentNumber = _this.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf .z-num').html();
        curChildCommentNumber++;
        _this.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf .z-num').html(curChildCommentNumber);
    }
    // 前端插入评论
    _this.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml);
    // 清空回复框
    _this.siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
}

/**
 * 删除评论块
 */
$('.commentAll').on('click','.removeBlock',function(){
    var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
    if(oT.siblings('.all-pl-con').length >= 1){
        oT.remove();
    }else {
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
        oT.remove();
    }
    $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();
})

/**
 * 点赞
 */
$('.comment-show').on('click','.date-dz-z',function(){
    var zNum = $(this).find('.z-num').html();
    if($(this).is('.date-dz-z-click')){
        zNum--;
        $(this).removeClass('date-dz-z-click');
        $(this).find('.z-num').html(zNum);

    }else {
        zNum++;
        $(this).addClass('date-dz-z-click');
        $(this).find('.z-num').html(zNum);
    }
})
