FROM ruby:2.7.5

RUN apt-get update && apt-get install -y curl software-properties-common vim locales
RUN apt-get install build-essential -y
RUN apt-get install imagemagick libmagickwand-dev -y
RUN apt-get install -y libc-ares2 postgresql-client nodejs --no-install-recommends
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN sh -c "echo deb https://deb.nodesource.com/node_10.x /etc/apt/sources.list.d/nodesource.list"
RUN apt-get update && apt-get install -y nodejs
RUN mkdir -p /ruby-place

ENV APP_HOME /rubyapp

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME

RUN bundler install

RUN chmod +x start.sh
ENTRYPOINT ["./start.sh"]
