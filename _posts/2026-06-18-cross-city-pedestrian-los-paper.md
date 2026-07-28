---
title: New Paper in Urban Science - Teaching AI to Read Any City's Sidewalks
author: jonathan-dortheimer
tags:
  - DesignAI
  - UrbanAI
project: UrbanAI
image: /images/news/few_shots.jpg
caption: A new study asks whether a pedestrian-comfort model trained on one city can be taught to understand another — with just a handful of examples.
---

We're excited to share that our paper **"Few-Shot Transfer Learning for Cross-City Pedestrian Level-of-Service Mapping Using Spatio-Temporal Graph Models"** has been published in *Urban Science* (MDPI).

The paper, co-authored by Atakilti Brhanu Kiros, Jonathan Dortheimer, Noam Teshuva, and Achituv Cohen, tackles a problem that anyone who has tried to compare walkability across cities will recognize: pedestrian Level-of-Service (LOS) — the standard measure of how comfortable a sidewalk or crossing is to walk — is normally calibrated locally, city by city. A model trained on Melbourne's streets doesn't automatically know how to read Dublin's, let alone Zurich's. That makes it hard for urban planners to monitor pedestrian conditions at scale, especially in cities that lack the dense sensor networks needed to calibrate a model from scratch.

So we asked: can a model *transfer* what it learns about pedestrian flow from one city to another, using only a small amount of local data?

**The approach:** We built a spatio-temporal graph transformer — a model that reads both *where* pedestrian activity is happening across a city's street network and *how* it changes over time — with an ordinal prediction head trained to classify conditions into six LOS grades. Pedestrian count data from three very different cities (Melbourne, Dublin, and Zurich) was converted into these grades using city-specific percentile thresholds, since "busy" means something different on every street.

**What we found:**

- **Strong in-domain performance** — trained and tested on Melbourne alone, the model hit 79.7% exact accuracy (99.1% within one grade of correct).
- **Few-shot transfer works remarkably well** — fine-tuning on just **5% of labeled data from a new city** recovered **95–99%** of full in-domain performance. A little bit of local ground-truth goes a long way.
- **What the model actually pays attention to** — using KernelSHAP to interpret predictions, we found that short-term temporal lag (what just happened on that street) dominates predictions everywhere, while the spatial and contextual features that matter shift from city to city, reflecting each city's distinct urban structure.

The takeaway is practical: cities with limited sensor infrastructure don't need to build a pedestrian-monitoring model from the ground up. A small, targeted dose of local data can adapt an existing model to a new urban context — though, as we're careful to note in the paper, the resulting LOS scores are best read as *relative*, city-specific indicators rather than a universal, cross-city standard of pedestrian comfort.

Read the full paper open-access in [Urban Science](https://doi.org/10.3390/urbansci10060334).
