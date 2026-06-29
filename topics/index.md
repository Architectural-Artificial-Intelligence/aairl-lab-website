---
title: Projects
nav:
  order: 1
  tooltip: Software, datasets, and more
---
{% assign t = site.data.i18n[site.active_lang] | default: site.data.i18n.en %}

<section class="page_banner decoration_wrap">
  <div class="container">
    <h1 class="page_heading">{{ t.topics_page_banner_title }}</h1>
    <p>{{ t.topics_page_banner_body }}</p>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -200, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_1.png" alt="Line Shape Image">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 200, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_2.png" alt="Line Shape Image">
  </div>
</section>

<section class="course_section">
  <div class="container">
    <div class="tab-content">
        <div class="row">
{% include list.html data="projects"  component="course_item"  %}
      </div>
    </div>
  </div>
</section>

<section class="category_section research_topics_template section_space_lg bg_info">
  <div class="container">
    <div class="section_heading text-center">
      <h2 class="heading_text mb-0">
        {{ t.home_research_topics }}
        <span class="heading_focus_text">{{ t.home_research_topics_focus }}</span>
      </h2>
    </div>
    <div class="category2_items_wrapper row justify-content-center">
      {% for topic in site.topics%}
      <div class="col col-lg-4 col-md-6 col-sm-6">
        <div class="category_item_2 topic_with_projects">
          <a href="{{ topic.url }}">
            <span class="item_icon">
              <i class="far fa-project-diagram"></i>
            </span>
            <span class="item_content">
              <strong class="item_title d-block">{% include t_field.html obj=topic field="title" %}</strong>
              <small class="item_counter d-block">{{ t.home_topic_research_label }}</small>
            </span>
          </a>
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
</section>



<section class="course_section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col col-lg-6">
        <div class="section_heading text-center">
          <h2 class="heading_text">
            {{ t.topics_page_products_heading }}
            <span class="heading_focus_text">{{ t.topics_page_products_heading_focus }}</span>
          </h2>
          <p class="mb-0">{{ t.topics_page_products_body }}</p>
        </div>
      </div>
    </div>
    <div class="tab-content">
        <div class="row">
{% include list.html data="products"  component="course_item"  %}
      </div>
    </div>
  </div>
</section>

{% include join_us.html %}
