FROM ubuntu:bionic
MAINTAINER Reza Askari

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Create a default user
RUN useradd automation --shell /bin/bash --create-home

# Update the repositories
# Install utilities
# Install XVFB and TinyWM
# Install fonts
RUN apt-get update && \
    apt-get -y install wget gdebi curl unzip /usr/bin/tinywm && \
    apt-get -y install xvfb tinywm && \
    apt-get -y install fonts-ipafont-gothic xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic 

# Install PHP & compsoer
RUN apt-get update && apt-get install php7.2-mbstring php7.2-sqlite php7.2-curl php7.2-xml php7.2-bcmath php7.2-zip php7.2-json php7.2-cli php7.2-common composer -y

# Install Google Chrome
RUN wget -o- https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN gdebi -n google-chrome-stable_current_amd64.deb

# Default configuration
ENV DISPLAY :99
ENV SCREEN_GEOMETRY "1440x900x24"
ENV CHROMEDRIVER_PORT 9515
