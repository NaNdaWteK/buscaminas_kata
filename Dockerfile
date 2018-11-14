FROM ruby:2.5.1

WORKDIR /katas

ADD . /katas

RUN gem install bundle
