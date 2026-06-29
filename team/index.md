---
title: Team
nav:
  order: 3
  tooltip: About our team
---
{% assign t = site.data.i18n[site.active_lang] | default: site.data.i18n.en %}

<section class="page_banner team_banner decoration_wrap">
  <div class="container">
    <h1 class="page_heading">{{ t.team_page_banner_heading }}</h1>
    <p>{{ t.team_page_banner_body }}</p>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -200, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_1.png" alt="Line Shape Image">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 200, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_2.png" alt="Line Shape Image">
  </div>
</section>

<section class="instructor_section team_section section_space_lg pt-0">
  <div class="container">
    <div class="team_section_heading">
      <h2>{{ t.team_page_current_heading }}</h2>
    </div>
    <div class="instructor_wrapper row">
{% include list.html data="members" component="team_portrait" filter="group == 'team' and role == 'pi'" %}
{% include list.html data="members" component="team_portrait" filter="group == 'team' and role == 'lab-manager'" %}
{% include list.html data="members" component="team_portrait" filter="group == 'team' and role == 'postdoc'" %}

{% include list.html data="members" component="team_portrait" filter="group == 'team' and role == 'research-lead'" %}

{% include list.html data="members" component="team_portrait" filter="group == 'team' and role == 'phd'" %}
{% include list.html data="members" component="team_portrait" filter="group == 'team' and role == 'master'" %}
{% include list.html data="members" component="team_portrait" filter="group == 'team' and role == 'assistant'" %}
    </div>
  </div>
</section>
<section class="instructor_section team_section team_alumni_section section_space_lg pt-0">
  <div class="container">
    <div class="team_section_heading">
      <h2>{{ t.team_page_alumni_heading }}</h2>
    </div>

    <div class="instructor_wrapper row">
      {% include list.html data="members" component="team_portrait" filter="group == 'alumni'" %}
    </div>
  </div>
</section>

{% include join_us.html %}
