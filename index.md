---
---

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


<!-- Course Section - Start
================================================== -->
<section class="course_section">
  <div class="container">
    <div class="section_heading">
      <div class="row align-items-center">
        <div class="col col-lg-6">
          <h2 class="heading_text mb-0">
            What we 
            <span class="heading_focus_text">offer</span>
          </h2>
        </div>
      </div>
    </div>

    <div class="tab-content">
        <div class="row">

{% include list.html data="products" kind="Product" component="course_item" %}
{% include list.html data="projects" kind="Project" component="course_item" %}



<!-- { include course_item.html title="Participatory Design Chatbot System" kind="Product" }
{ include course_item.html title="Crowdsourcing Participatory Design System" kind="Product" }
{ include course_item.html title="Collective Intelligent Architectural Design" kind="Research" }
{ include course_item.html title="Generative Architectural Artificial Intelligence" kind="Research" }  
{ include course_item.html title="Participatory Design Chatbots" kind="Research" }        
{ include course_item.html title="Critical Urbanism" kind="Research" }        
{ include course_item.html title="Ph.D. Studies" kind="Education" }
{ include course_item.html title="M.Sc. Studies" kind="Education"  -->

      </div>
    </div>
  </div>
</section>
<!-- Course Section - End
================================================== -->


{% include join_us.html %}


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



