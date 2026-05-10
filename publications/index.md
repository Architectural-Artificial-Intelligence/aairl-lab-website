---
title: Research
nav:
  order: 2
  tooltip: Published works
---

<section class="page_banner decoration_wrap">
  <div class="container">
    <h1 class="page_heading">Research Publications</h1>
    <p>Peer-reviewed work from the Architectural Artificial Intelligence Research Lab.</p>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -200, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_1.png" alt="Line Shape Image">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 200, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_2.png" alt="Line Shape Image">
  </div>
</section>
<section class="blog_section publication_section section_space_lg">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col col-lg-10">
        {% assign latest_paper = site.data.papers | first %}
        {% assign earliest_paper = site.data.papers | last %}
        <div class="publication_project_list publication_chronology">
          <h3 class="publication_group_title">All publications</h3>
          {% assign chronological_papers = site.data.papers | sort: "date" | reverse %}
          {% include paper-list.html papers=chronological_papers match="all" show_heading=false show_tag_matches=false %}
        </div>
      </div>
    </div>
  </div>
</section>
