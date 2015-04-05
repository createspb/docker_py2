FROM phusion/baseimage:0.9.16
MAINTAINER Create Digital <hello@createdigital.me>

ENV HOME /root
CMD ["/sbin/my_init"]

RUN apt-get update -qy && apt-get install -qy \
    unzip wget software-properties-common sudo \
    python-pip python-dev \
    git \
    libxml2-dev libxslt-dev lib32z1-dev libpq-dev libjpeg8 libjpeg8-dev \
    libffi-dev \
    gettext

ADD requirements.txt /tmp/requirements.txt
RUN cd /tmp && pip install -r /tmp/requirements.txt

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# LC_ALL FIX
RUN bash -c 'echo "export LC_ALL=C.UTF-8" >> ~/.bashrc'

ENV LANGUAGE C.UTF-8
ENV PYTHONENCODING utf8

