---
title: Projects
meta_key: topics
redirect_from:
  - /topics/
nav:
  order: 1
  tooltip: Software, datasets, and more
---
{% assign t = site.data.i18n[site.active_lang] | default: site.data.i18n.en %}
{% if site.active_lang == site.default_lang %}{% assign lp = '' %}{% else %}{% assign lp = '/' | append: site.active_lang %}{% endif %}

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": {{ t.topics_page_banner_title | strip_html | jsonify }},
  "itemListElement": [
    {% for proj in site.projects %}
    {
      "@type": "ListItem",
      "position": {{ forloop.index }},
      "item": { "@type": "CreativeWork", "name": {{ proj.title | jsonify }}, "url": "{{ site.url }}{{ lp }}{{ proj.url }}" }
    }{% unless forloop.last %},{% endunless %}
    {% endfor %}
  ]
}
</script>

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

<section class="category_section research_topics_template section_space_lg bg_info">
  <div class="container">
    <div class="section_heading text-center">
      <h2 class="heading_text mb-0">
        {{ t.home_research_topics }}
        <span class="heading_focus_text">{{ t.home_research_topics_focus }}</span>
      </h2>
    </div>
    {% include research_agenda.html %}
  </div>
</section>

<section class="course_section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col col-lg-6">
        <div class="section_heading text-center">
          <h2 class="heading_text">
            {{ t.topics_page_projects_heading }}
            <span class="heading_focus_text">{{ t.topics_page_projects_heading_focus }}</span>
          </h2>
        </div>
      </div>
    </div>
    <div class="tab-content">
        <div class="row">
{% include list.html data="projects"  component="course_item"  %}
      </div>
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
