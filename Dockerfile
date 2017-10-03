FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

ENV RAILS_ROOT /var/www/citibike_planner_api
RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./

RUN gem install bundler
RUN bundle install --binstubs
COPY config/puma.rb config/puma.rb
COPY ./docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY . ./

EXPOSE 3000

CMD puma -C config/puma.rb
