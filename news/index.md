---
title: News
nav:
  order: 4
  tooltip: Latest updates
---

<section class="page_banner decoration_wrap">
  <div class="container">
    <h1 class="page_heading">Latest News</h1>
    <ul class="breadcrumb_nav unordered_list_center">
      <li><a href="index.html">Home</a></li>
      <li>News</li>
    </ul>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -200, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_1.png" alt="Line Shape Image">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 200, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_2.png" alt="Line Shape Image">
  </div>
</section>


<section class="blog_section section_space_md pt-0">
  <div class="container">
    <div class="row justify-content-lg-between">
      <div class="col col-lg-8">
        <div class="row">
{% include search-info.html %}

{% include list.html data="posts" component="post-excerpt" %}

        </div>
      </div>

      <div class="col col-lg-3">
        <aside class="sidebar">
{% include search-box.html %}


        </aside>
      </div>
    </div>
  </div>
</section>



