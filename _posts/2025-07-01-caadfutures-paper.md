---
title: Can AI Feel Our Spaces? Quantifying Architectural Experience With Visual Language Models
author: jonathan-dortheimer
category: featured

caption: 

tags:
  - confernecees 
  - DesignAI
project: SyntheticHumans
image: images/news/sythetichumans.png
---

Have you ever wondered why some spaces feel immediately inviting, while others leave us cold or even uneasy? 
Traditionally, these emotional responses have been difficult to quantify or predict with validated design methods.

At AAIRL, we're excited to spotlight a compelling step forward in architectural design, led by a collaboration between Gal Guz, Nikolas Martelaro, Gerhard Schubert, and myself. Our new research paper, "Quantifying Architectural Experience Using Visual Language Models: Does AI Dream of Rendered Spaces?", asks a fascinating question: Can advanced AI models predict how humans will emotionally respond to a space, even before it's built?

Architecture has long depended on measurements: dimensions, materials, light. But translating the emotional impact of a space ("Is this cozy? Stimulating? Overwhelming?") into numbers has been elusive. Each person feels space differently, which makes universal design both crucial and challenging.

Recent developments in large language models (LLMs) and visual language models (VLMs), such as GPT-4o, raise a new research possibility: using AI systems to approximate selected aspects of human response to architectural images. This does not replace human evaluation, but it may provide an additional source of early-stage design feedback.

**The Experiment: AI vs. Human Ratings:**
We evaluated GPT-4o's image-to-emotion ratings against human responses. We gathered 10 images of different spaces and asked both human participants and the AI model to complete emotional ratings using the well-known PANAS scale, which measures 20 affective states.

We found out:
- **Strong Negative Intuition:**
GPT-4o’s negative emotion ratings strongly matched humans—an R² value of 0.79, rising to 0.8 after filtering out CAD images. In other words, AI was excellent at predicting spaces that felt distressing or unpleasant.
- **Positive Emotions—More Subtle:**
The correlation for positive emotions was moderate overall (R² = 0.13), but improved to a “strong” connection (R² = 0.53) after removing the CAD images. Curiously, the AI tended to overrate positive feelings in highly artificial (CAD) spaces, whereas humans rated them much lower.
- **Fine-Grained Emotions:**
For most individual negative emotions (afraid, upset, nervous, etc.), correlations between AI and human scores were high across the images (see Table 2 on page 9). Positive emotions were less reliably predicted, with 'inspired,' 'proud,' and 'interested' best reflected.

This work suggests several possible directions for future design research:

- **AI as a Design Companion:** Instead of relying solely on personal skill and intuition, architects may be able to use AI to pre-screen how their designs might make users feel.
- **Quantitative Emotional Metrics:** Emotional experience becomes as quantifiable as daylight, circulation, or material use.
- **Optimization:** With more refined AI models, it's conceivable that design processes could optimize space not just for cost or efficiency, but for positive emotional impact.


This methodology could pave the way for large-scale studies on emotional response to the built environment—including cultural or demographic adjustment.

This research suggests that AI may help designers measure and, eventually, optimize aspects of emotional response to space. If “form follows function,” perhaps design evaluation can also begin to account more systematically for feeling.

We at AAIRL are eager to see how these tools empower more human-centric architecture—making the intangible, finally, a little more measurable.


[Original paper on ResearchGate](https://www.researchgate.net/publication/393461219_Quantifying_Architectural_Experience_Using_Visual_Language_Models_Does_AI_Dream_of_Rendered_Spaces)
