FROM ruby:2.6.3-alpine3.10 as builder

# Define basic environment variables
ENV NODE_ENV production
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true

# Install alpine packages
RUN apk add --no-cache \
  build-base \
  busybox \
  ca-certificates \
  cmake \
  curl \
  git \
  tzdata \
  gnupg1 \
  graphicsmagick \
  libffi-dev \
  libsodium-dev \
  openssh-client \
  mysql-dev \
  mysql-client \
  tzdata \
  python \
  libssl1.1 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
  libuv --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
  musl --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
  libgcc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
  libstdc++ --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
  nghttp2-libs --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \ 
  zlib --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main

# Add Edge JS Packages
RUN apk add --no-cache nodejs-current --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk add --no-cache nodejs --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main
RUN apk add --no-cache npm --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main
RUN apk add --no-cache yarn --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

# Define WORKDIR
WORKDIR /app

# Use bunlder to avoid exit with code 1 bugs while doing integration test
RUN gem install bundler -v 2 --no-doc

# Copy dependency manifest
COPY Gemfile Gemfile.lock /app/

# Install Ruby dependenciesgit 
RUN bundle update --bundler
RUN bundle install --jobs $(nproc) --retry 3 --without development test \
      && rm -rf /usr/local/bundle/bundler/gems/*/.git /usr/local/bundle/cache/


# Remove Older Assets
RUN rm -rf public/packs node_modules/

# Copy source code
COPY . /app/

# Compile production assets with sample key
RUN mv config/credentials/production.yml.enc config/credentials/production.yml.enc.bak; \
    mv config/credentials/sample.key config/credentials/production.key; \
    mv config/credentials/sample.yml.enc config/credentials/production.yml.enc

# Copy JavaScript dependencies
COPY ./package.json yarn.lock /app/
RUN rm /app/app/javascript/packs/setupTests.js
RUN rm -rf /app/app/javascript/packs/test

# Compile Assets
RUN yarn install
RUN RAILS_ENV=production rails webpacker:install
RUN RAILS_ENV=production bundle exec rails assets:precompile


# Slim down Image
FROM ruby:2.6.3-alpine3.10
RUN apk add --update --no-cache \
  libssl1.1 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
  openssl \
  tzdata \
  mysql-dev \
  mysql-client \
  nodejs
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder /app/ /app/
COPY --from=builder /app/public /app/public
ENV RAILS_LOG_TO_STDOUT false
WORKDIR /app
EXPOSE 3000

# Start the Server
# CMD puma -C config/puma.rb -e production
CMD ["/bin/sh", "/app/entrypoint.sh"]

