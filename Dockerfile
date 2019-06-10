FROM ruby:2.5-alpine

RUN apk add --no-cache --update build-base \
                                linux-headers \
                                git \
                                mysql-client \
                                mysql-dev \
                                fontconfig \
                                ttf-freefont \
                                nodejs \
                                tzdata \
                                graphviz \
                                libgcc \
                                libstdc++ \
                                libx11 \
                                glib \
                                libxrender \
                                libxext \
                                libintl \
                                libcrypto1.0 \
                                libssl1.0 

RUN mkdir /app
RUN gem env

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

CMD puma -C config/puma.rb
