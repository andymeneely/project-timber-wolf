FROM squib:latest

# This Dockerfile is built specifically for project-timber-wolf

RUN apt-get update && \
    apt-get install -y \
    libgirepository1.0-dev \
    # build-essential \
    # xorg \
    # libssl-dev \
    # libxrender-dev \
    # wget \
    # gdebi

COPY Gemfile /usr/src/app/
RUN gem install bundler && \
    cd /usr/src/app && \
    bundle install

RUN mkdir ~/.fonts
COPY fonts/*.otf /usr/share/fonts/
COPY fonts/*.ttf /usr/share/fonts/
RUN fc-cache -f -v /usr/share/fonts/

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

RUN wget -q https://bitbucket.org/wkhtmltopdf/wkhtmltopdf/downloads/wkhtmltox-0.13.0-alpha-7b36694_linux-trusty-amd64.deb ; \
    dpkg -i wkhtmltox-0.13.0-alpha-7b36694_linux-trusty-amd64.deb ; \
    apt-get install -f

WORKDIR /usr/src/app
