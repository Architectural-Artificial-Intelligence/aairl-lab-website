---
title: Research
meta_key: publications
nav:
  order: 2
  tooltip: Published works
---
{% assign t = site.data.i18n[site.active_lang] | default: site.data.i18n.en %}

{% assign _pub_papers = site.data.papers | where: "lab", true | sort: "date" | reverse %}

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": {{ t.publications_page_heading | strip_html | jsonify }},
  "itemListElement": [
    {% for paper in _pub_papers %}
    {
      "@type": "ListItem",
      "position": {{ forloop.index }},
      "item": {
        "@type": "ScholarlyArticle",
        "name": {{ paper.title | strip_html | jsonify }},
        "author": {{ paper.authors | strip_html | jsonify }},
        "datePublished": "{{ paper.date }}"
        {% if paper.publisher %},"isPartOf": { "@type": "Periodical", "name": {{ paper.publisher | strip_html | jsonify }} }{% endif %}
        {% if paper.link %},"url": "{{ paper.link }}"{% endif %}
        {% if paper.doi %},"identifier": "https://doi.org/{{ paper.doi }}"{% endif %}
        {% if paper.tags %},"keywords": {{ paper.tags | join: ', ' | jsonify }}{% endif %}
      }
    }{% unless forloop.last %},{% endunless %}
    {% endfor %}
  ]
}
</script>

<section class="page_banner decoration_wrap">
  <div class="container">
    <h1 class="page_heading">{{ t.publications_page_heading }}</h1>
    <p>{{ t.publications_page_body }}</p>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -200, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_1.png" alt="Line Shape Image">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 200, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_2.png" alt="Line Shape Image">
  </div>
</section>
<section class="blog_section publication_section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col col-lg-10">
        {% assign lab_papers = site.data.papers | where: "lab", true %}
        {% assign latest_paper = lab_papers | first %}
        {% assign earliest_paper = lab_papers | last %}
        <div class="publication_project_list publication_chronology">
          <h3 class="publication_group_title">{{ t.publications_all }}</h3>
          {% assign chronological_papers = lab_papers | sort: "date" | reverse %}
          {% include paper-list.html papers=chronological_papers match="all" show_heading=false show_tag_matches=false %}
        </div>
      </div>
    </div>
  </div>
</section>
