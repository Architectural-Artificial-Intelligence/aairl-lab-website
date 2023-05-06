---
title: Contact
nav:
  order: 5
  tooltip: Email, address, and location
---

<section class="page_banner decoration_wrap">
  <div class="container">
    <h1 class="page_heading">Contact Us</h1>
    <ul class="breadcrumb_nav unordered_list_center">
      <li><a href="index.html">Home</a></li>
      <li>Contact Us</li>
    </ul>
  </div>
  <div class="deco_item deco_img_1" data-parallax='{"y" : -200, "smoothness": 6}'>
    <img src="/images/shapes/line_shape_1.png" alt="Line Shape Image">
  </div>
  <div class="deco_item deco_img_2" data-parallax='{"y" : 200, "smoothness": 6}'>
    <img src="/images/shapes/dot_shape_2.png" alt="Line Shape Image">
  </div>
</section>

<section class="contact_section section_space_lg pt-0">
  <div class="container">
    <div class="section_space_lg pt-0">
      <div class="row justify-content-center">
        <div class="col col-lg-4">
          <div class="contact_info_box" style="background-image: url('/images/shapes/dot_shape_3.png');">
            <div class="inner_wrap tilt">
              <div class="item_icon">
                {% include icon.html icon="fa-solid fa-phone  fa-2xl" %} 
              </div>
              <div class="item_content">
                <h3 class="item_title">Our Telephone</h3>
                <ul class="icon_list unordered_list_block">
                  <li><a href="tel: +972747288014">+972 (0)74-728-8014</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="col col-lg-4">
          <div class="contact_info_box" style="background-image: url('/images/shapes/dot_shape_3.png');">
            <div class="inner_wrap tilt">
              <div class="item_icon">
                {% include icon.html icon="fa-solid fa-envelope  fa-2xl" %}
              </div>
              <div class="item_content">
                <h3 class="item_title">Send us mail</h3>
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
                <h3 class="item_title">Address</h3>
                <ul class="icon_list unordered_list_block">
                  <li><a href="https://www.openstreetmap.org/way/186036853">
                    Suite 3.3.55, Building 55<br />
                    School of Architecture<br />
                    Ariel University, Israel
                  </a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col col-lg-9">
        <div class="contact_form_wrapper">
          <h2 class="contact_title text-center">Send us a message</h2>
          <form action="https://formspree.io/f/xqkonkpn" method="POST">
            <div class="row">
              <div class="col col-md-6">
                <div class="form_item m-0">
                  <input required type="text" name="fullname" placeholder="Your Full Name">
                </div>
              </div>
              <div class="col col-md-6">
                <div class="form_item m-0">
                  <input required type="email" name="email" placeholder="Your Email">
                </div>
              </div>
              <div class="col">
                <div class="form_item">
                  <textarea required name="massage" placeholder="Write A Massage"></textarea>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn_primary">
                    <span>
                      <small>Send Message</small>
                      <small>Send Message</small>
                    </span>
                    <i class="fal fa-paper-plane ms-2"></i>
                  </button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.openstreetmap.org/export/embed.html?bbox=35.20582526922227%2C32.10357089190319%2C35.208335816860206%2C32.10530446426251&amp;layer=mapnik" style="border: 0px solid black"></iframe> -->






