---
meta_key: home
---
{% assign t = site.data.i18n[site.active_lang] | default: site.data.i18n.en %}
{% assign lp = site.base_url %}

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
            {{ t.home_banner_title }}
          </h1>
          <p>
            {{ t.home_banner_body }}
          </p>
          <a class="btn btn_default" href="{{ lp }}/agenda/">
            <span>
              <small>{{ t.home_banner_cta }}</small>
              <small>{{ t.home_banner_cta }}</small>
            </span>
            <i class="far fa-long-arrow-right ms-1"></i>
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="category_section research_topics_template section_space_md pb-0">
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

<section class="event_section section_space_lg">
  <div class="container">
    <div class="section_heading text-center">
      <h2 class="heading_text mb-0">
        {{ t.home_news_heading }}
        <span class="heading_focus_text">{{ t.home_news_focus }}</span>
      </h2>
    </div>
    <div class="row justify-content-center">
{% include hp-list.html data="posts" %}
    </div>
  </div>
</section>



<section class="sponsor_section section_space_lg bg_info">
  <div class="container">
    <div class="section_heading text-center">
      <h2 class="heading_text mb-0">
        {{ t.home_partners_heading }}
        <span class="heading_focus_text">{{ t.home_partners_focus }}</span>
      </h2>
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

{% include join_us.html %}
