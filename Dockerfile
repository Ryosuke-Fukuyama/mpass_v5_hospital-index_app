# FROM node:16.13 as node
FROM ruby:3.0.6-alpine3.16

# COPY --from=node /opt/yarn-* /opt/yarn
# COPY --from=node /usr/local/bin/node /usr/local/bin/
# COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
# RUN ln -fs /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
#     && ln -fs /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx \
#     && ln -fs /usr/local/lib/node /usr/local/bin/nodejs \
#     && ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn \
#     && ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarnpkg

ENV TZ=Asia/Tokyo
ENV APP_ROOT /mpass_index_app

RUN mkdir -p ${APP_ROOT}
WORKDIR ${APP_ROOT}

# RUN gem i rails -v "6.1"
COPY Gemfile Gemfile.lock ${APP_ROOT}/

RUN apk update \
  && apk add --no-cache -t \
    .build-dependencies \
    build-base \
    mysql-client \
  && apk add --no-cache \
    # libc6-compat \
    # libc-dev \
    bash \
    nodejs \
    yarn \
    tzdata \
    mysql-dev \
  && bundle config set --global force_ruby_platform true \
  # && bundle config set --jobs 4 \
  && gem install bundler:2.0.2 \
  && bundle install -j4 \
  && gem i rubyzip -v "2.3.0" \
  && gem i webdrivers -v "5.3.0" \
  && apk del .build-dependencies \
  && rails webpacker:install

COPY . ${APP_ROOT}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]