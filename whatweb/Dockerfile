FROM ruby:alpine

RUN apk add git \
	&& git clone https://github.com/urbanadventurer/WhatWeb.git \
	&& cd WhatWeb && apk add alpine-sdk && bundle install \
	&& rm -rf /var/cache/apk/*
ENTRYPOINT ["/WhatWeb/whatweb"]
