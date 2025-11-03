---
---

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
            Revolutionizing Architecture and Urban Design
          </h1>
          <p>
            By leveraging the power of computation, artificial intelligence, and collective intelligence, we are creating new design methods that will lead to more sustainable and equitable cities for a better future.
          </p>
          <a class="btn btn_default" href="/projects/">
            <span>
              <small>Explore Projects</small>
              <small>Explore Projects</small>
            </span>
            <i class="far fa-long-arrow-right ms-1"></i>
          </a>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="blog_section section_space_lg">
  <div class="container">
    <div class="section_heading text-center">
      <h2 class="heading_text mb-0">
        Latest News
      </h2>
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
            Funding Agencies, Partners and  
            <span class="heading_focus_text">Friends</span>
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
              <img src="{{ partner.icon }}" alt="{{ partner.name }}" />
            </a>
          </div>
          <div class="item_content">
            <h3 class="item_title">
              <a href="{{ partner.url }}">
                {{ partner.name }}
              </a>
            </h3>
            <ul class="course_meta unordered_list">
              <li><a href="{{ partner.url }}"><i class="fal fa-bars me-1"></i>{{ partner.kind }}</a></li>
            </ul>
          </div>
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
</section>

{% include join_us.html %}




