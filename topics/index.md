---
title: Projects
nav:
  order: 1
  tooltip: Software, datasets, and more
---

<section class="page_banner decoration_wrap">
  <div class="container">
    <h1 class="page_heading">Our Research Projects</h1>
    <p>Our research advances the intersection of artificial intelligence, design, and urban systems. We investigate how computational methods and data-driven technologies can support more resilient, inclusive, and adaptive urban environments.</p>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -200, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_1.png" alt="Line Shape Image">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 200, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_2.png" alt="Line Shape Image">
  </div>
</section>

<!-- Category Section - Start
  ================================================== -->
  <section class="category_section research_topics_template section_space_lg bg_info">
    <div class="container">
      <div class="section_heading text-center">
        <h2 class="heading_text mb-0">
          Research
          <span class="heading_focus_text">Topics</span>
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
                <strong class="item_title d-block">{{ topic.title }}</strong>
                {% assign topic_project_count = topic.projects | size %}
                <small class="item_counter d-block">{% if topic_project_count > 0 %}{{ topic_project_count }} projects{% else %}Research topic{% endif %}</small>
                {% if topic_project_count > 0 %}
                <span class="topic_project_list">
                  {% for project_tag in topic.projects %}
                    {% assign topic_project = site.projects | where: "tag", project_tag | first %}
                    {% if topic_project %}
                    <span>{{ topic_project.title }}</span>
                    {% endif %}
                  {% endfor %}
                </span>
                {% endif %}
              </span>
            </a>
          </div>
        </div>
        {% endfor %}
      </div>
    </div>
  </section>
  <!-- Category Section - End
  ================================================== -->

<!-- Course Section - Start
================================================== -->
<section class="course_section">
  <div class="container">
    <div class="tab-content">
        <div class="row">
{% include list.html data="projects"  component="course_item"  %}
      </div>
    </div>
  </div>
</section>
<!-- Course Section - End
================================================== -->

<!-- Course Section - Start
================================================== -->
<section class="course_section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col col-lg-6">
        <div class="section_heading text-center">
          <h2 class="heading_text">
            Our  
            <span class="heading_focus_text">Products</span>
          </h2>
          <p class="mb-0">
            We translate our research outcomes into practical tools that support participatory and inclusive urban design.
          </p>
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
<!-- Course Section - End
================================================== -->

{% include join_us.html %}
