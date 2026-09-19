---
title: Master's Program
description: M.Sc. thesis-track research at the intersection of AI, architecture, and urban planning at AAIRL, Ariel University.
nav:
  order: 6
  tooltip: AI × architecture × urban planning
---
{% assign t = site.data.i18n[site.active_lang] | default: site.data.i18n.en %}
{% assign m = t.masters %}
{% if site.active_lang == site.default_lang %}{% assign lp = '' %}{% else %}{% assign lp = '/' | append: site.active_lang %}{% endif %}
{% assign _rtl_langs = 'he,ar,fa,ur' | split: ',' %}
{% if _rtl_langs contains site.active_lang %}{% assign _is_rtl = true %}{% else %}{% assign _is_rtl = false %}{% endif %}

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Course",
  "name": {{ m.banner_title | strip_html | jsonify }},
  "description": {{ page.description | jsonify }},
  "provider": {
    "@type": "CollegeOrUniversity",
    "name": "Ariel University",
    "sameAs": "https://www.ariel.ac.il/"
  },
  "inLanguage": "{{ site.active_lang }}"
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {% for item in m.faq %}
    {
      "@type": "Question",
      "name": {{ item.q | strip_html | jsonify }},
      "acceptedAnswer": { "@type": "Answer", "text": {{ item.a | strip_html | jsonify }} }
    }{% unless forloop.last %},{% endunless %}
    {% endfor %}
  ]
}
</script>
{% assign _home_url = lp | append: "/" %}
{% assign _self_url = lp | append: page.url %}
{% assign _masters_name = m.banner_title | strip_html %}
{% include schema_breadcrumb.html item1_name=t.member_nav_home item1_url=_home_url item2_name=_masters_name item2_url=_self_url %}

<!-- ===================== HERO ===================== -->
<section class="banner_section banner_style_2">
  <div class="container">
    <div class="row align-items-center justify-content-lg-between">
      <div class="order-lg-last col col-lg-7">
        <div class="banner_image_2 metropolis_banner_image">
          <img src="/images/metropolis_screen.png" alt="{{ m.banner_title }}">
        </div>
      </div>
      <div class="col col-lg-5">
        <div class="banner_content">
          <h1 class="banner_title"><span class="focus_text">{{ m.banner_title_accent }}</span>{{ m.banner_title_rest }}</h1>
          <p>{{ m.banner_intro }}</p>
          <a class="btn btn_primary" href="#apply">
            <span>
              <small>{{ m.cta_apply }}</small>
              <small>{{ m.cta_apply }}</small>
            </span>
            <i class="far fa-long-arrow-right ms-1"></i>
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ===================== POLICY ===================== -->
<section class="policy_section decoration_wrap">
  <div class="container">
    <div class="row">
      {% for item in m.policy_items %}
      <div class="col col-lg-4">
        <div class="policy_item">
          <div class="item_icon">
            <i class="{{ item.icon }} fa-2x"></i>
          </div>
          <div class="item_content">
            <h3 class="item_title">{{ item.title }}</h3>
            <p class="mb-0">{{ item.body }}</p>
          </div>
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"rotateZ" : 180, "smoothness": 6}'>
    <img src="/images/shapes/shape_7.png" alt="">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : -130, "smoothness": 6}'>
    <img src="/images/shapes/shape_8.png" alt="">
  </div>
  <div class="deco_item deco_img_3" data-parallax='{"x" : -130, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_6.png" alt="">
  </div>
</section>

<!-- ===================== PROGRAM + ELIGIBILITY ===================== -->
<section id="program" class="details_section section_space_lg">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col col-lg-10">
        <h3 class="details_info_title">
          {{ m.program_heading }}
          <span class="heading_focus_text">{{ m.program_focus }}</span>
        </h3>
        <p>{{ m.program_intro }}</p>
        {% assign _program_points = m.program_points %}
        {% assign _program_half = _program_points.size | divided_by: 2 %}
        {% assign _program_rest = _program_points.size | minus: _program_half %}
        {% assign _program_col1 = _program_points | slice: 0, _program_half %}
        {% assign _program_col2 = _program_points | slice: _program_half, _program_rest %}
        <div class="row">
          <div class="col col-md-6">
            <ul class="icon_list unordered_list_block">
              {% for point in _program_col1 %}
              <li>
                <i class="far fa-check"></i>
                <span>{{ point }}</span>
              </li>
              {% endfor %}
            </ul>
          </div>
          <div class="col col-md-6">
            <ul class="icon_list unordered_list_block">
              {% for point in _program_col2 %}
              <li>
                <i class="far fa-check"></i>
                <span>{{ point }}</span>
              </li>
              {% endfor %}
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ===================== RESEARCH DIRECTIONS ===================== -->
<section class="category_section research_topics_template section_space_lg">
  <div class="container">
    <div class="section_heading text-center">
      <h2 class="heading_text mb-0">
        <span class="heading_focus_text">{{ m.pillars_title }}</span>
      </h2>
      <p>{{ m.pillars_intro }}</p>
    </div>
    {% include research_agenda.html %}
  </div>
</section>

<!-- ===================== TESTIMONIALS ===================== -->
<section class="testimonial_section section_space_lg pt-0">
  <div class="container">
    <div class="section_heading text-center">
      <h2 class="heading_text mb-0">
        {{ m.testimonials_heading }}
        <span class="heading_focus_text">{{ m.testimonials_focus }}</span>
      </h2>
    </div>
    <div class="testimonial_carousel_box decoration_wrap">
      <div class="testimonial_carousel row" data-slick='{"dots": true, "arrows": false, "rtl": {{ _is_rtl }}}'>
        {% for item in m.testimonials %}
        <div class="carousel_item col" data-cursor-text="Drag">
          <div class="testimonial_item">
            <div class="item_image" style="background-image: url('/images/shapes/dot_shape_5.png');">
              <img src="{{ item.image }}" alt="{{ item.name }}">
            </div>
            <div class="item_content">
              <div class="item_icon">
                <i class="far fa-comment-alt-lines fa-2x"></i>
              </div>
              <p>{{ item.quote }}</p>
              <h4 class="client_name">{{ item.name }}</h4>
              <span class="client_designation">{{ item.role }}</span>
            </div>
          </div>
        </div>
        {% endfor %}
      </div>
      <div class="deco_item shape_1" data-parallax='{"y" : -130, "smoothness": 6}'>
        <img src="/images/shapes/dot_shape_2.png" alt="">
      </div>
      <div class="deco_item shape_2" data-parallax='{"y" : 130, "smoothness": 6}'>
        <img src="/images/shapes/line_shape_1.png" alt="">
      </div>
    </div>

  </div>
</section>

<!-- ===================== ABOUT ===================== -->
<section class="getstart_section_2">
  <div class="container">
    <div class="content_box decoration_wrap">
      <div class="row align-items-center">
        <div class="col col-lg-6">
          <div class="item_image">
            <div class="image_wrap">
              <img src="/images/lab/lab1.png" alt="{{ t.label_lab_name }}">
            </div>
            <div class="deco_item deco_img_1">
              <img src="/images/shapes/shape_10.png" alt="">
            </div>
            <div class="deco_item deco_img_2" data-parallax='{"rotateZ" : 90, "smoothness": 6}'>
              <img src="/images/shapes/shape_11.png" alt="">
            </div>
          </div>
        </div>
        <div class="col col-lg-6">
          <div class="item_content">
            <h2 class="title_text">{{ m.about_title }}</h2>
            <p>{{ m.about_body }}</p>
            <a class="btn btn_primary" href="{{ lp }}/agenda/">
              <span>
                <small>{{ m.pillars_title }}</small>
                <small>{{ m.pillars_title }}</small>
              </span>
              <i class="far fa-angle-double-right ms-1"></i>
            </a>
          </div>
        </div>
      </div>
      <div class="deco_item deco_img_3" data-parallax='{"scale" : 0.6, "smoothness": 6}'>
        <img src="/images/shapes/shape_12.png" alt="">
      </div>
      <div class="deco_item deco_img_4" data-parallax='{"scale" : 0.6, "smoothness": 6}'>
        <img src="/images/shapes/shape_13.png" alt="">
      </div>
    </div>
  </div>
</section>

<!-- ===================== FAQ ===================== -->
<section id="faq" class="section_space_lg">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col col-lg-8">
        <div class="section_heading text-center">
          <h2 class="heading_text mb-0">{{ t.label_faq | default: "FAQ" }}</h2>
        </div>
        <div class="masters_faq_list">
          {% for item in m.faq %}
          <details class="masters_faq_item">
            <summary>{{ item.q }}</summary>
            <p>{{ item.a }}</p>
          </details>
          {% endfor %}
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ===================== PARTNERS ===================== -->
<section id="partners" class="sponsor_section section_space_lg bg_info">
  <div class="container">
    <div class="section_heading text-center">
      <h2 class="heading_text mb-0">
        {{ m.partners_heading }}
        <span class="heading_focus_text">{{ m.partners_focus }}</span>
      </h2>
      <p>{{ m.partners_intro }}</p>
    </div>

    <div class="sponsors_logo_wrap partners_marquee">
      <div class="partners_marquee_track">
        <ul class="partners_marquee_group">
        {% for partner in site.data.partners %}
          {% assign pt = t.partners[partner.key] %}
          <li>
            <a href="{{ partner.url }}" data-magnetic>
              <img src="{{ partner.icon }}" alt="{{ pt.name | default: partner.key }}">
            </a>
          </li>
          {% endfor %}
        </ul>
        <ul class="partners_marquee_group" aria-hidden="true">
        {% for partner in site.data.partners %}
          {% assign pt = t.partners[partner.key] %}
          <li>
            <a href="{{ partner.url }}" tabindex="-1">
              <img src="{{ partner.icon }}" alt="" aria-hidden="true">
            </a>
          </li>
          {% endfor %}
        </ul>
      </div>
    </div>
  </div>
</section>

<!-- ===================== GET STARTED ===================== -->
<section id="apply" class="getstart_section decoration_wrap text-center">
  <div class="container">
    <h2 class="title_text">{{ m.cta_title }}</h2>
    <a class="btn btn_primary" href="{{ lp }}/contact/">
      <span>
        <small>{{ m.cta_contact }}</small>
        <small>{{ m.cta_contact }}</small>
      </span>
      <i class="far fa-angle-double-right ms-1"></i>
    </a>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -130, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_4.png" alt="">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 130, "smoothness": 6}'>
    <img src="/images/shapes/shape_5.png" alt="">
  </div>
</section>


