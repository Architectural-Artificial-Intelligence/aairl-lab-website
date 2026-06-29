---
title: News
nav:
  order: 4
  tooltip: Latest updates
---
{% assign t = site.data.i18n[site.active_lang] | default: site.data.i18n.en %}

<section class="page_banner decoration_wrap">
  <div class="container">
    <h1 class="page_heading">{{ t.news_page_heading }}</h1>
    <p>{{ t.news_page_body }}</p>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -200, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_1.png" alt="Line Shape Image">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 200, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_2.png" alt="Line Shape Image">
  </div>
</section>


<section class="blog_section news_section pt-0">
  <div class="container">
    <div class="news_grid">
      {% include search-info.html %}
      <div class="row">
        {% include list.html data="posts" component="post-excerpt" showyears=false column_class="col col-lg-4 col-md-6" %}
      </div>
    </div>
  </div>
</section>
