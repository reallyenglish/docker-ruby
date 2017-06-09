FROM us.gcr.io/re-ws-141201/ruby:1.8.7

RUN apt-get update -qq && apt-get install -y --force-yes --fix-missing \
    fonts-ipafont-gothic xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic \
    locales

RUN fc-cache -f

RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

RUN cat /etc/default/locale

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
