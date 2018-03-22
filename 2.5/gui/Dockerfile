FROM ruby:2.5

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    unzip \
    qt5-default \
    libqt5webkit5-dev \
    gstreamer1.0-plugins-base \
    gstreamer1.0-tools \
    gstreamer1.0-x \
    locales \
    fonts-ipafont-gothic xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic \
    xvfb

RUN fc-cache -f && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    PHANTOMJS=phantomjs-2.1.1-linux-x86_64

WORKDIR /usr/local/share

RUN curl -s -S --retry 3 -f -L -O https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOMJS.tar.bz2 && \
    tar xvjf $PHANTOMJS.tar.bz2 && \
    ln -sf /usr/local/share/$PHANTOMJS/bin/phantomjs /usr/local/bin

# Install Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends google-chrome-stable

# Install ChromeDriver
RUN CHROME_DRIVER_VERSION=$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    curl -s -S --retry 3 -f -L -O http://chromedriver.storage.googleapis.com/${CHROME_DRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip -d /usr/local/bin/ && \
    rm chromedriver_linux64.zip && \
    chmod 0755 /usr/local/bin/chromedriver

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
