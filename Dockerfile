FROM ruby:2.3.7

RUN apt-get update -qq

COPY geoblacklight geoblacklight

# Install apt dependencies
RUN apt-get install -y --no-install-recommends \
 build-essential \
 curl libssl-dev \
 git \
 unzip \
 nodejs \
 zlib1g-dev \
 libxslt-dev \
 mysql-client \
 sqlite3

#CMD git clone git@github.com:geoblacklight/geoblacklight.git

WORKDIR geoblacklight

USER root

# install bundler
RUN gem install bundler -v 2.0.2

CMD ls geoblacklight

#install gems
RUN bundle install
RUN gem install execjs

#install rails
#RUN gem install rails
  
EXPOSE 3000
CMD bundle exec rake engine_cart:server