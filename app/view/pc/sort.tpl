{% extends "./template/template.tpl" %}
{% import "pc/macro/tip_cover.tpl" as tipCover %}

{% block tip %}
<div class="login-out-tip">
    {{ tipCover.tip(type="alert", msg ='确定退出当前账号？', time="", style="", opration="logout()") }}
</div>
{% endblock %}

{% block top %}
    <div class="sort-list-div">
        <div class="container clear-f">
            <div class="sort-list flex-b-sbc fw-wr">
                {% for item in productionData.content %}
                    <div class="list-item" href="production_detail?productionId={{ item.id }}">
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url({{ item.cover }})"></div>
                            <div class="item-cover"></div>
                        </div>
                        <div class="item-text">
                            <h3 class="t-title">
                                {{ item.name }}
                                <svg class="icon fr" aria-hidden="true">
                                    <use xlink:href="#icon-zuixinlianzai"></use>
                                </svg>
                            </h3>
                            <p class="t-describe">插画-商业插画</p>
                            <div class="about-production flex-b-sbc">
                                <div class="about-item">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-yanjing"></use>
                                    </svg>
                                    <span class="about-num">4.6万</span>
                                </div>
                                <div class="about-item">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-comment1"></use>
                                    </svg>
                                    <span class="about-num">196</span>
                                </div>
                                <div class="about-item">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-chakandianzan"></use>
                                    </svg>
                                    <span class="about-num">4299</span>
                                </div>
                            </div>
                            <hr>
                            <div class="clear-f">
                                <span class="fr product-create-time">{{ item.create_time }}</span>
                            </div>
                        </div>
                    </div>
                {% endfor %}
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
        layui.use('flow', function(){
            var $ = layui.jquery;
            var flow = layui.flow;

            flow.load({
                elem: '.sort-list',
                isLazyimg: true,
                done: function(page, next){
                    var sortId = getQueryString('sortId');
                    var curPageSize = 8;
                    var lis = [];
                    $.get(
                        `/operation/flow_load?id=${sortId}&curPageSize=${curPageSize}&currentPage=${page+1}`,
                        function(res){
                            layui.each(res.content, function(index, item){
                                lis.push(
                                    `
                                    <div class="list-item" href="production_detail?productionId=${item.id}">
                                        <div class="list-img-div">
                                            <div class="item-img" style="background-image:url(${item.cover})"></div>
                                            <div class="item-cover"></div>
                                        </div>
                                        <div class="item-text">
                                            <h3 class="t-title">
                                                ${item.name}
                                                <svg class="icon fr" aria-hidden="true">
                                                    <use xlink:href="#icon-zuixinlianzai"></use>
                                                </svg>
                                            </h3>
                                            <p class="t-describe">插画-商业插画</p>
                                            <div class="about-production flex-b-sbc">
                                                <div class="about-item">
                                                    <svg class="icon" aria-hidden="true">
                                                        <use xlink:href="#icon-yanjing"></use>
                                                    </svg>
                                                    <span class="about-num">${item.view_number}</span>
                                                </div>
                                                <div class="about-item">
                                                    <svg class="icon" aria-hidden="true">
                                                        <use xlink:href="#icon-comment1"></use>
                                                    </svg>
                                                    <span class="about-num">${item.comment_number}</span>
                                                </div>
                                                <div class="about-item">
                                                    <svg class="icon" aria-hidden="true">
                                                        <use xlink:href="#icon-chakandianzan"></use>
                                                    </svg>
                                                    <span class="about-num">4299</span>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="clear-f">
                                                <span class="fr product-create-time">${item.create_time}</span>
                                            </div>
                                        </div>
                                    </div>
                                    `
                                );
                            }
                        );
                        // 判断分页条件
                        var totalPages = parseInt(res.totalElements / curPageSize);
                        next(lis.join(''), page < totalPages);
                    });
                }
            });

            flow.lazyimg({
                elem: '.sort-list'
            });
        });
    </script>
{% endblock %}