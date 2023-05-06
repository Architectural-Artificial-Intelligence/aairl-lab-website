---
title: Team
nav:
  order: 3
  tooltip: About our team
---

<section class="page_banner decoration_wrap">
  <div class="container">
    <h1 class="page_heading">Our Research Team</h1>
    <ul class="breadcrumb_nav unordered_list_center">
      <li><a href="/">Home</a></li>
      <li>Our Team</li>
    </ul>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -200, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_1.png" alt="Line Shape Image">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 200, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_2.png" alt="Line Shape Image">
  </div>
</section>

<section class="instructor_section section_space_lg pt-0">
  <div class="container">
    <div class="instructor_wrapper row">
{% include list.html data="members" component="team_portrait" filters="group:team , role: pi|research-lead" %}

{% include list.html data="members" component="team_portrait" filters="group:team ,role: ^(?!pi|research-lead$)" %}
    </div>
  </div>
</section>
<section class="instructor_section section_space_lg pt-0">
  <div class="container">
    <div class="instructor_wrapper row">
      <h2 class="">Our Partners</h2>

{% include list.html data="members" component="team_portrait" filters="group:partner" %}

    </div>
  </div>
</section>

{% include join_us.html %}