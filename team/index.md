---
title: Team
nav:
  order: 3
  tooltip: About our team
---

## Meet Our Team


{% include section.html %}

{% include list.html data="members" component="portrait" filters="group:team , role: pi|research-lead" %}


{% include list.html data="members" component="portrait" filters="group:team ,role: ^(?!pi|research-lead$)" %}

{% include section.html %}

# Partners

{% include list.html data="members" component="portrait" filters="group:partner" %}


{% include section.html %}

