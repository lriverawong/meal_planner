FROM ruby:2.3.1

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

# Pre-install gems with native extensions
RUN gem install nokogiri -v "1.6.8.1"

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

CMD rails s -b 0.0.0.0 -p 3001 -P tmp/pids/server.pid
#CMD rails s -b 0.0.0.0 -p 3001 -P /tmp/puma.pid
# the end prevents from error (server already running under another pid)

#CMD script/start
