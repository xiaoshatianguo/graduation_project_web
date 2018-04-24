{% extends "./template/template.tpl" %}

{% block top %}
    <div class="sort-list-div">
        <div class="container clear-f">
            <div class="sort-list flex-b-sbc fw-wr">
                {% for item in productionData %}
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