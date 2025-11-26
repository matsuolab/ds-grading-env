FROM python:3.11-bookworm

ENV DEBIAN_FRONTEND=noninteractive

# Add the unstable repository and set pin priority
RUN echo "deb http://deb.debian.org/debian unstable main" > /etc/apt/sources.list.d/unstable.list \
 && printf "Package: *\nPin: release a=unstable\nPin-Priority: 90\n" > /etc/apt/preferences.d/99unstable

# Update and install standard packages
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      fontconfig fonts-ipaexfont \
      krb5-multidev libgssapi-krb5-2 \
      libexpat1 libexpat1-dev \
      linux-libc-dev wget \
      curl libcurl4 libcurl4-openssl-dev \
      libdb5.3 libdb5.3-dev \
 && rm -rf /var/lib/apt/lists/*

# Fetch only the vulnerable libraries from unstable
RUN apt-get update \
 && apt-get install -y --no-install-recommends -t unstable \
      libaom3 \
      libopenexr-dev \
      zlib1g zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

#Upgrade setuptools
RUN pip3 install pip setuptools --upgrade

#Install additional libraries
ADD requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

ARG USERNAME=app
ARG GROUPNAME=app
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME/

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV HOME=/home/$USERNAME \
    SHELL=/bin/bash

ENTRYPOINT []
