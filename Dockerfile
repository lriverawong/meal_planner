FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && rm -rf /var/lib/apt/lists/*

# App specific installations are run separatelly so previous is a rehused container
RUN apt-get install -y imagemagick && rm -rf /var/lib/apt/lists/*

ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . ./