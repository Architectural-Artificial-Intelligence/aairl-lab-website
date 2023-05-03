---
---

<section class="banner_section banner_style_3">
  <div class="container">
    <div class="row align-items-center justify-content-lg-between">
      <div class="order-lg-last col col-lg-6">
        <div class="banner_image_3">
          <img src="/images/banner/banner_img_5.jpg" alt="Group Study">
        </div>
      </div>
      <div class="col col-lg-5">
        <div class="banner_content">
          <h1 class="banner_title">
            We are Revolutionizing Architecture and Urban Design
          </h1>
          <p>
            By leveraging the power of computation, artificial intelligence, and collective intelligence, we are creating new design methods that will lead to more sustainable and equitable cities for a better future.
          </p>
          <a class="btn btn_default" href="about.html">
            <span>
              <small>Explore of Projects</small>
              <small>Explore of Projects</small>
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
        Latest News & 
        <span class="heading_focus_text">Publications</span>
      </h2>
    </div>
    <div class="row justify-content-center">

{% include hp-list.html data="posts" %}
    </div>
  </div>
</section>


## Highlights

{% capture text %}

Stay up to date with our latest research in architecture and AI and access our peer-reviewed publications.

{%
  include button.html
  link="research"
  text="See our publications"
  icon="fa-solid fa-arrow-right"
  flip=true
  style="bare"
%}

{% endcapture %}

{%
  include feature.html
  image="images/hp/publications.jpg"
  link="research"
  title="Our Research"
  text=text
%}

{% capture text %}

Explore the wide range of research projects that our lab has conducted and continues to pursue. Learn more about our work and the impact it has had.
{%
  include button.html
  link="projects"
  text="Browse our projects"
  icon="fa-solid fa-arrow-right"
  flip=true
  style="bare"
%}

{% endcapture %}

{%
  include feature.html
  image="images/hp/projects1.jpg"
  link="projects"
  title="Our Projects"
  flip=true
  style="bare"
  text=text
%}

{% capture text %}

Learn more about our team and their research here.

{%
  include button.html
  link="team"
  text="Meet our team"
  icon="fa-solid fa-arrow-right"
  flip=true
  style="bare"
%}

{% endcapture %}

{%
  include feature.html
  image="images/hp/team.jpg"
  link="team"
  title="Our Team"
  text=text
%}

{% capture text %}

Do you need equipment for a research or studio project? We are happy to help and provide students with professional equipment.

{%
  include button.html
  link="https://rentle.store/aairl/shop"
  text="Browse our projects"
  icon="fa-solid fa-arrow-right"
  flip=true
  style="bare"
%}

{% endcapture %}

{%
  include feature.html
  image="images/hp/equipment.jpg"
  link="https://rentle.store/aairl/shop"
  title="Lab Equipment"
  flip=true
  style="bare"
  text=text
%}

