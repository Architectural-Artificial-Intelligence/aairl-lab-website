Visit **[aairl.com](https://aairl.com)** 🚀

<h1 align="center">Lab Website Template</h1>
<p align="center">
<img height="200" src="https://raw.githubusercontent.com/greenelab/lab-website-template/main/images/share.jpg?raw=true" alt="Lab Website Template">
</p>

Lab Website Template (LWT) is an easy-to-use, flexible website template for labs.
Spend less time worrying about managing a website and citations, and more time running your lab.

👇👇 **Get Started** 👇👇

[**Documentation**](https://greene-lab.gitbook.io/lab-website-template-docs)

## Key Features
./.docker/run.sh

## Refreshing member ORCID data

Member publications/education/employment pulled from ORCID (`_data/orcid_works/*.yml`) are refreshed
weekly by the `refresh-orcid` GitHub Action, which commits the updated files back to the repo. To run
it manually:

```bash
gh workflow run refresh-orcid.yaml
```

Or fetch locally and commit yourself:

```bash
ruby bin/fetch_orcid_works.rb
git add _data/orcid_works
git commit -m "Refresh member ORCID data"
```
