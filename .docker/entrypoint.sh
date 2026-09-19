#! /bin/bash

# ensure jekyll output directories are writable
mkdir -p /usr/src/app/_site /usr/src/app/.jekyll-cache
chmod -R 777 /usr/src/app/_site /usr/src/app/.jekyll-cache

# print folder contents for debugging
printf "\n\nContents:\n\n"
ls

# how often (in seconds) to re-fetch member ORCID data in the background while the
# dev server is running -- override with `-e ORCID_REFRESH_INTERVAL=<seconds>` on
# `docker run`; set to 0 to disable the periodic refresh entirely
ORCID_REFRESH_INTERVAL=${ORCID_REFRESH_INTERVAL:-21600} # default: 6 hours

# fetch member ORCID data once at startup so a fresh container/checkout doesn't
# wait for the first periodic refresh (this hits the public ORCID API -- a
# network failure here shouldn't block local dev, so don't fail the container)
echo "Fetching member ORCID data..."
ruby bin/fetch_orcid_works.rb || echo "ORCID fetch failed, continuing with existing _data/orcid_works"

# keep refreshing it periodically in the background for the life of the container
if [ "${ORCID_REFRESH_INTERVAL}" -gt 0 ]; then
    (
        while true; do
            sleep "${ORCID_REFRESH_INTERVAL}"
            echo "Refreshing member ORCID data..."
            ruby bin/fetch_orcid_works.rb || echo "ORCID refresh failed, will retry next interval"
        done
    ) &
fi

# run jekyll serve in hot-reload mode
# note: jekyll's own --livereload doesn't pick up _config.yaml changes -- restart the
# container (or re-run this script) after editing _config.yaml
bundle exec jekyll serve --open-url --force_polling --livereload --trace --host=0.0.0.0 \
    | sed "s/LiveReload address.*//g;s/0.0.0.0/localhost/g"
