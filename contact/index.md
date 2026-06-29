---
title: Contact
nav:
order: 5
tooltip: Email, address, and location
---
{% assign t = site.data.i18n[site.active_lang] | default: site.data.i18n.en %}

<section class="page_banner decoration_wrap">
  <div class="container">
    <h1 class="page_heading">{{ t.contact_page_title }}</h1>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -200, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_1.png" alt="" aria-hidden="true">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 200, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_2.png" alt="" aria-hidden="true">
  </div>
</section>

<section class="contact_section section_space_lg pt-0">
  <div class="container">
    <div class="section_space_lg pt-0">
      <div class="row justify-content-center">
        <div class="col col-lg-4">
          <div class="contact_info_box contact_info_box--primary" style="background-image: url('/images/shapes/dot_shape_3.png');">
            <div class="inner_wrap tilt">
              <div class="item_icon">
                {% include icon.html icon="fa-solid fa-phone fa-2xl" %}
              </div>
              <div class="item_content">
                <h3 class="item_title">{{ t.contact_phone }}</h3>
                <ul class="icon_list unordered_list_block">
                  <li><a href="tel:+972747288014">+972 (0)74-728-8014</a></li>
                  <li><a href="tel:+972544577442">+972 (0)54-457-7442</a></li>
                </ul>
                <p class="contact_hours">{{ t.contact_hours }}</p>
              </div>
            </div>
          </div>
        </div>
        <div class="col col-lg-4">
          <div class="contact_info_box" style="background-image: url('/images/shapes/dot_shape_3.png');">
            <div class="inner_wrap tilt">
              <div class="item_icon">
                {% include icon.html icon="fa-solid fa-envelope fa-2xl" %}
              </div>
              <div class="item_content">
                <h3 class="item_title">{{ t.contact_email }}</h3>
                <ul class="icon_list unordered_list_block">
                  <li><a href="mailto:jonathand@ariel.ac.il">jonathand@ariel.ac.il</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="col col-lg-4">
          <div class="contact_info_box" style="background-image: url('/images/shapes/dot_shape_3.png');">
            <div class="inner_wrap tilt">
              <div class="item_icon">
                {% include icon.html icon="fa-solid fa-location-dot fa-2xl" %}
              </div>
              <div class="item_content">
                <h3 class="item_title">{{ t.contact_visit }}</h3>
                <ul class="icon_list unordered_list_block">
                  <li><a href="https://www.openstreetmap.org/way/186036853">
                      {{ t.contact_address }}<br />
                      {{ t.contact_school }}<br />
                      {{ t.contact_university }}
                    </a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col col-sm-4">
          <img src="/images/lab/lab1.png" alt="Image of our lab" class="img-fluid" />
          <p>{{ t.contact_lab_workspace }}</p>
        </div>
        <div class="col col-sm-4">
          <img src="/images/lab/lab2.png" alt="Another image of our lab" class="img-fluid" />
          <p>{{ t.contact_lab_meeting }}</p>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.openstreetmap.org/export/embed.html?bbox=35.20582526922227%2C32.10357089190319%2C35.208335816860206%2C32.10530446426251&amp;layer=mapnik" style="border: 0px solid black"></iframe> -->