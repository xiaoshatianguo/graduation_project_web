{% extends "./template/template.tpl" %}
{% import "pc/macro/tip_cover.tpl" as tipCover %}

{% block tip %}
<div class="login-out-tip">
    {{ tipCover.tip(type="alert", msg ='确定退出当前账号？', time="", style="", opration="logout()") }}
</div>
<div class="no-login">
    {{ tipCover.tip(type="noLogin", msg = '', time="", style="", opration="") }}
</div>
{% endblock %}

{% block banner %}
    
{% endblock %}

{% block top %}
    <a class="big-activity-bg" href="/join_activity?activityId={{ activityDetailData.id }}" style="background-image: url({{ activityDetailData.banner }})">
    </a>
{% endblock %}

{% block middle %}
    <div class="container content-div">
        <div class="activity-detail-content">
            {{ activityDetailData.content | safe }}
        </div>
        <div class="activity-detail-rule">
            {{ activityDetailData.rule | safe }}
        </div>
    </div>
{% endblock %}

{% block bottom %}
    
{% endblock %}

{% block script %}
    <script>

    </script>
{% endblock %}