# docker build -t devhint:2.0 .
# docker run -it -v `pwd`:/app -p 4003:4000  devhint:2.0 

FROM ruby:2.5.1
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
    yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
VOLUME [ "/app" ]
WORKDIR /app
EXPOSE 4000
CMD ["bundle","exec","jekyll","serve"]