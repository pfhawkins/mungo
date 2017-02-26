FROM ruby:2.3.3-onbuild
MAINTAINER P.F. Hawkins <pf@pfhawkins.com>

# RUN apt-get update && \
#    apt-get install -y net-tools

ENV PORT 5000
ENV APP_DIR /app/

COPY Gemfile* \
  config.ru \
  mungo.rb \
  index.html \
  $APP_DIR

WORKDIR $APP_DIR

# Install application dependencies
RUN bundle

# Start Server
EXPOSE 5000
CMD rackup --host 0.0.0.0 -p $PORT

# CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "5000", "config.ru"]
