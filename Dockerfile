# docker build -t tobyqin/devhints:latest .
# docker run --rm -it -v `pwd`:/srv/jekyll -p 4000:4000 tobyqin/devhints jekyll serve

FROM jekyll/jekyll:3.8
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install && rm -rf /usr/local/bundle/cache && rm -rf /home/jekyll/.bundle/cache
RUN rm Gemfile && rm Gemfile.lock