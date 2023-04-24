---
---

<div style="display: flex;">

<div style="flex-grow: 1">
<img src="images/logo_old.png" />
</div>
<div class="" style="flex-grow: 3">
  <!-- <div class="card-text"> -->
  <h1>The AAIRL is revolutionizing Architecture and Urban Design</h1>

  <p>By leveraging the power of computation, <b>artificial intelligence</b>, and <b>collective intelligence</b>, we are creating new <b>design methods</b> that will lead to more <b>sustainable</b> and <b>equitable cities</b> for a better future.</p>
  <!-- </div> -->
</div>
</div>


<div class="card" >
<div class="card-text" style="text-align:left">
Are you passionate about improving the design of cities?

We want you! We’re always looking for diverse, talented individuals to join our mission. No matter what your background is, we invite you to apply and become part of our team. Don’t wait – let’s make a difference together!
{%
  include button.html
  text="Join our vision!"
  link="contact"
%}
</div>
</div>

{% include section.html %}

## Recent News

{% include list.html data="posts" component="hp-post-excerpt" filters="category:featured" %}

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

