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
$('.commentAll').on('click','.plBtn',function(){
    var userLoginInfo;
    // 判断是否登录
    if(!cacheGet('userLoginInfo')) {
        alert('请登录后再评论！');
        $(this).siblings('.flex-text-wrap').find('.comment-input').val('');
        return false;
    } else {
        userLoginInfo = cacheGet('userLoginInfo');
    }

    // 获取当前时间
    var now = getTime();
    //获取输入内容
    var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();

    // 评论内容不为空，动态创建评论模块
    if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){

        save(oSize, userLoginInfo.id);

        oHtml = `
        <div class="comment-show-con clear-f">
            <div class="comment-show-con-img fl" style="background-image:url(${userLoginInfo.portrait})"></div>
            <div class="comment-show-con-list fl clear-f">
                <div class="pl-text clear-f">
                    <a href="#" class="comment-size-name">${userLoginInfo.nickname}：</a>
                    <span class="my-pl-con">&nbsp;${oSize}</span>
                </div>
                <div class="date-dz">
                    <span class="date-dz-left fl comment-time">${now}</span>
                    <div class="date-dz-right fr comment-pl-block">
                        <a href="javascript:;" class="removeBlock">删除</a>
                        <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block fl">回复</a>
                        <span class="fl date-dz-line">|</span>
                        <a href="javascript:;" class="date-dz-z fl">
                            <i class="date-dz-z-click-red"></i>赞(<i class="z-num">666</i>)
                        </a>
                    </div>
                </div>
                <div class="hf-list-con"></div>
            </div>
        </div>
        `;

        $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
        // 清空评论输入框
        $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
    }
});

/**
 * 评论留言及回复存入数据库
 * @param content 评论内容
 * @param reviewersId 评论者
 * @param receiverId 被评论者
 */
function save(content, reviewersId, receiverId) {
    var activityId = getQueryString('activityId');
    var userId = getQueryString('userId');
    var productionId = getQueryString('productionId');

    var curPage = 0;
    var triggerId = -1;

    // 活动页评论
    if(!!activityId) {
        curPage = 1;
        triggerId = activityId;
    }

    // 个人中心评论
    if(!!userId) {
        curPage = 2;
        triggerId = userId;
    }

    // 作品评论
    if(!!productionId) {
        curPage = 0;
        triggerId = productionId;
    }

    console.log(content);
    console.log(reviewersId);
    console.log(receiverId);
    $.ajax({
        url: '/operation/comment',
        type: 'post',
        data: {
            reviewers: reviewersId,
            receiver: receiverId || 0,
            sort: curPage,
            content,
            triggerId,
        },
        success: function(result) {
            console.log(result);
        },
        error: function(err){
            console.log(err);
        }
    })
}

/**
 * 点击回复动态创建回复块
 */
$('.comment-show').on('click','.pl-hf',function(){
    //获取回复人的名字
    var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
    //回复@
    var fhN = '回复@'+fhName;
    //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
    var fhHtml = '<div class="hf-con fl"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
    //显示回复
    if($(this).is('.hf-con-block')){
        $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
        $(this).removeClass('hf-con-block');
        $('.content').flexText();
        $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
        //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
        //input框自动聚焦
        $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
    }else {
        $(this).addClass('hf-con-block');
        $(this).parents('.date-dz-right').siblings('.hf-con').remove();
    }
});

/**
 * 评论回复块创建
 */
$('.comment-show').on('click','.hf-pl',function(){
    // 判断是否登录
    if(!cacheGet('userLoginInfo')) {
        alert('请登录后再评论！');
        $(this).siblings('.flex-text-wrap').find('.comment-input').val('');
        return false;
    }
    
    var oThis = $(this);
    // 获取当前时间
    var now = getTime();
    //获取输入内容
    var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
    console.log(oHfVal)
    var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
    var oAllVal = '回复@@'+oHfName;
    if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

    }else {
        $.getJSON("/public/json/pl.json",function(data){
            var oAt = '';
            var oHf = '';
            $.each(data,function(n,v){
                delete v.hfContent;
                delete v.atName;
                var arr;
                var ohfNameArr;
                if(oHfVal.indexOf("@") == -1){
                    data['atName'] = '';
                    data['hfContent'] = oHfVal;
                }else {
                    arr = oHfVal.split(':');
                    ohfNameArr = arr[0].split('@');
                    data['hfContent'] = arr[1];
                    data['atName'] = ohfNameArr[1];
                }

                if(data.atName == ''){
                    oAt = data.hfContent;
                }else {
                    oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
                }
                oHf = data.hfName;
            });

            var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clear-f"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left fl comment-time">'+now+'</span> <div class="date-dz-right fr comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block fl">回复</a> <span class="fl date-dz-line">|</span> <a href="javascript:;" class="date-dz-z fl"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
            oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
        });
    }
});

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
        $(this).removeClass('date-dz-z-click red');
        $(this).find('.z-num').html(zNum);
        $(this).find('.date-dz-z-click-red').removeClass('red');
    }else {
        zNum++;
        $(this).addClass('date-dz-z-click');
        $(this).find('.z-num').html(zNum);
        $(this).find('.date-dz-z-click-red').addClass('red');
    }
})
