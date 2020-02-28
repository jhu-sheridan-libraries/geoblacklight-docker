FROM ruby:2.6.5

RUN apt-get update -qq

COPY config config

# Install apt dependencies
RUN apt-get install -y --no-install-recommends \
 build-essential \
 curl libssl-dev \
 git \
 unzip \
 nodejs \
 npm \
 zlib1g-dev \
 libxslt-dev \
 python3 \
 python3-dev \

 USER root

 # Install yarn
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add 
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#RUN apt-get install yarn
RUN npm install --global yarn
RUN yarn --version
#RUN yarn install --check-files

RUN python3 -m pip install --upgrade pip
RUN pip3 install pysolr
RUN pip3 install json

RUN git clone https://github.com/jhu-sheridan-libraries/geoblacklight
COPY start.sh geoblacklight
RUN chmod 755 geoblacklight/start.sh

#copy config files
RUN cp config/env.development geoblacklight/.env.development  
RUN cp config/env.test geoblacklight/.env.test  
RUN cp config/database.yml geoblacklight/config/database.yml
RUN cp config/Gemfile geoblacklight/Gemfile

WORKDIR geoblacklight

RUN ls

#install bundler
RUN gem install bundler

#install gems / js 
RUN bundle
RUN yarn install 

#RUN bin/rails db:migrate RAILS_ENV=development
#RUN rm Gemfile.lock

ENTRYPOINT ["./start.sh"]   

#RUN bundle exec rails s -b 0.0.0.0
#RUN bundle exec rake jhu:server
#RUN bundle exec rake engine_cart:server

EXPOSE 3000