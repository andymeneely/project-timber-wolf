FROM ruby:2.5

# This Dockerfile is built specifically for project-timber-wolf
# We're working on a separate general-purpose runner for Squib for DockerHub

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

RUN apt-get update && apt-get install -y \
    libgirepository1.0-dev

COPY Gemfile /usr/src/app/
RUN gem install bundler && \
    cd /usr/src/app && \
    bundle install

RUN mkdir ~/.fonts
COPY fonts/*.otf /usr/share/fonts/
COPY fonts/*.ttf /usr/share/fonts/
RUN fc-cache -f -v /usr/share/fonts/

WORKDIR /usr/src/app
