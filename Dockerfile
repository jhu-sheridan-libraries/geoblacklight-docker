FROM ruby:2.6.5

RUN apt-get update -qq

# Install apt dependencies
RUN apt-get install -y --no-install-recommends \
 build-essential \
 curl libssl-dev \
 git \
 unzip \
 nodejs \
 npm \
 zlib1g-dev \
 libxslt-dev

 USER root

 # Install yarn

#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add 
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#RUN apt-get install yarn
RUN npm install --global yarn
RUN yarn --version
#RUN yarn install --check-files

RUN git clone https://github.com/jhu-sheridan-libraries/geoblacklight

WORKDIR geoblacklight

RUN ls

#install bundler
RUN gem install bundler

#install gems / js 
RUN bundle
RUN yarn install 

#copy config files
RUN cp .example.env.development .env.development  
RUN cp .example.env.test .env.test  
RUN cp config/database.yml.example config/database.yml
RUN bin/rails db:migrate RAILS_ENV=development
#RUN rm Gemfile.lock
  
EXPOSE 3000
CMD bundle exec rails server