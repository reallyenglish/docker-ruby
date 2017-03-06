FROM ubuntu:15.04

RUN apt-get update -qq && apt-get install -y --force-yes --fix-missing \
    build-essential bison openssl libssl-dev libcurl4-openssl-dev libreadline6 libreadline6-dev \
    zlib1g zlib1g-dev libyaml-dev libxml2-dev libxslt-dev libcurl4-openssl-dev \
    autoconf gcc-4.4 g++-4.4 curl \
    libpq-dev openjdk-7-jre redis-tools apt-utils ffmpeg git \
    imagemagick libmagickwand-dev libmagickcore-dev libmagic-dev

RUN ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/Magick-config /usr/local/bin/Magick-config && \
    ln -s /usr/lib/x86_64-linux-gnu/libMagickCore-6.Q16.so.2.0.0 /usr/lib/x86_64-linux-gnu/libMagickCore.so && \
    ln -s /usr/lib/x86_64-linux-gnu/libMagickWand-6.Q16.so.2.0.0 /usr/lib/x86_64-linux-gnu/libMagickWand.so

RUN curl http://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p357.tar.gz | tar -xz

WORKDIR ruby-1.8.7-p357

RUN ./configure && make CC=gcc-4.4 && make install

RUN curl -L http://production.cf.rubygems.org/rubygems/rubygems-1.8.22.tgz | tar -xz
WORKDIR rubygems-1.8.22
RUN ruby setup.rb

WORKDIR /
RUN rm -rf ruby-1.8.7-p357

ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLER_VERSION 1.12.5
ENV BUNDLE_APP_CONFIG $GEM_HOME

RUN echo 'install: --no-document\nupdate: --no-document' > "$HOME/.gemrc"

RUN gem install bundler --version "$BUNDLER_VERSION" \
    && bundle config --global path "$GEM_HOME" \
    && bundle config --global bin "$GEM_HOME/bin"

CMD [ "irb" ]
