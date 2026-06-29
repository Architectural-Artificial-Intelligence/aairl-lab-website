---
---
{% assign t = site.data.i18n[site.active_lang] | default: site.data.i18n.en %}
{% assign lp = site.base_url %}

<section class="banner_section banner_style_3">
  <div class="container">
    <div class="row align-items-center justify-content-lg-between">
      <div class="order-lg-last col col-lg-6">
        <div class="banner_image_3">
          <img src="/images/cityview.jpg" alt="Urban View">
        </div>
      </div>
      <div class="col col-lg-5">
        <div class="banner_content">
          <h1 class="banner_title">
            {{ t.home_banner_title }}
          </h1>
          <p>
            {{ t.home_banner_body }}
          </p>
          <a class="btn btn_default" href="{{ lp }}/topics/">
            <span>
              <small>{{ t.home_banner_cta }}</small>
              <small>{{ t.home_banner_cta }}</small>
            </span>
            <i class="far fa-long-arrow-right ms-1"></i>
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="category_section research_topics_template section_space_md pb-0">
  <div class="container">
    <div class="section_heading text-center">
      <h2 class="heading_text mb-0">
        {{ t.home_research_topics }}
        <span class="heading_focus_text">{{ t.home_research_topics_focus }}</span>
      </h2>
    </div>
    <div class="category2_items_wrapper row justify-content-center">
      {% for topic in site.topics %}
      <div class="col col-lg-4 col-md-6 col-sm-6">
        <div class="category_item_2 topic_with_projects">
          <a href="{{ topic.url }}">
            <span class="item_icon">
              <i class="far fa-project-diagram"></i>
            </span>
            <span class="item_content">
              <strong class="item_title d-block">{% include t_field.html obj=topic field="title" %}</strong>
              {% assign topic_project_count = topic.projects | size %}
              <small class="item_counter d-block">{{ t.home_topic_research_label }}</small>
            </span>
          </a>
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
</section>

<section class="blog_section section_space_lg">
  <div class="container">
    <div class="section_heading">
      <div class="row align-items-center">
        <div class="col col-lg-6">
          <h2 class="heading_text mb-0">
            {{ t.home_news_heading }}
            <span class="heading_focus_text">{{ t.home_news_focus }}</span>
          </h2>
        </div>
      </div>
    </div>
    <div class="row justify-content-center">
{% include hp-list.html data="posts" %}
    </div>
  </div>
</section>



<section class="course_section section_space_lg bg_info">
  <div class="container">
    <div class="section_heading">
      <div class="row align-items-center">
        <div class="col col-lg-6">
          <h2 class="heading_text mb-0">
            {{ t.home_partners_heading }}
            <span class="heading_focus_text">{{ t.home_partners_focus }}</span>
          </h2>
        </div>
      </div>
    </div>
    <div class="row">
    {% for partner in site.data.partners %}
      <div class="col col-lg-3 col-md-6 col-sm-6">
        <div class="course_item">
          <div class="item_image">
            <a class="image_wrap" href="{{ partner.url }}">
              {% assign pt = t.partners[partner.key] %}
              <img src="{{ partner.icon }}" alt="{{ pt.name | default: partner.key }}" />
            </a>
          </div>
          <div class="item_content">
            {% assign pt = t.partners[partner.key] %}
            <h3 class="item_title">
              <a href="{{ partner.url }}">
                {{ pt.name }}
              </a>
            </h3>
            <ul class="course_meta unordered_list">
              <li><a href="{{ partner.url }}"><i class="fal fa-bars me-1"></i>{{ pt.kind }}</a></li>
            </ul>
          </div>
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
</section>

{% include join_us.html %}
