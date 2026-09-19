# current (non-EOL) Debian release -- ruby:3.1.2's original bullseye base has had older
# bullseye-security point releases pruned from the mirrors, causing 404s on `apt install`
FROM ruby:3.1-bookworm

WORKDIR /usr/src/app

# build tools for gems with native extensions (nokogiri, sass-embedded, etc.)
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# pull in ruby (jekyll) package info
COPY Gemfile Gemfile.lock ./

# install ruby packages, pinned to the exact bundler version this lockfile was made with
RUN VERSION=$(grep -A 1 'BUNDLED WITH' Gemfile.lock | tail -n 1 | xargs); \
    gem install bundler --version ${VERSION} && \
    bundle _${VERSION}_ install

# ports used by jekyll
EXPOSE 4000
EXPOSE 35729

# run jekyll
COPY .docker/entrypoint.sh /var
CMD [ "/var/entrypoint.sh" ]
