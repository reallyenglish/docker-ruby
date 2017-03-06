FROM ubuntu:15.04

RUN apt-get update -qq && apt-get -y --force-yes --fix-missing install \
    build-essential zlib1g-dev libssl-dev libxml2-dev libxslt-dev libreadline6-dev libyaml-dev \
    libpq-dev openjdk-7-jre redis-tools ffmpeg git curl \
    imagemagick libmagickwand-dev libmagickcore-dev libmagic-dev

RUN ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/Magick-config /usr/local/bin/Magick-config && \
    ln -s /usr/lib/x86_64-linux-gnu/libMagickCore-6.Q16.so.2.0.0 /usr/lib/x86_64-linux-gnu/libMagickCore.so && \
    ln -s /usr/lib/x86_64-linux-gnu/libMagickWand-6.Q16.so.2.0.0 /usr/lib/x86_64-linux-gnu/libMagickWand.so

RUN curl http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.gz | tar -xz
WORKDIR ruby-1.9.3-p551
RUN ./configure --prefix=/usr/local && make && make install

ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLER_VERSION 1.12.5
ENV BUNDLE_APP_CONFIG $GEM_HOME

RUN echo 'install: --no-document\nupdate: --no-document' > "$HOME/.gemrc"

RUN gem install bundler --version "$BUNDLER_VERSION" \
    && bundle config --global path "$GEM_HOME" \
    && bundle config --global bin "$GEM_HOME/bin"

CMD [ "irb" ]
