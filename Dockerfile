# ───────────────────────────────────────────────────────────────
# Stage 1: Node builder – install JS deps with exact Node 16.18.1
# ───────────────────────────────────────────────────────────────
FROM node:20 AS node_builder


WORKDIR /app

# Copy only JS manifest + lock to leverage layer caching
COPY package.json yarn.lock ./

# Install all your JS dependencies
RUN yarn install --frozen-lockfile


# ───────────────────────────────────────────────────────────────
# Stage 2: Ruby + Rails app + baked-in node_modules for dev
# ───────────────────────────────────────────────────────────────
FROM ruby:3.2.0

# 1) Install system libs + Postgres dev headers + NodeSource & Yarn
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev curl && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs yarn

WORKDIR /app

# 2) Install the exact Bundler matching your Gemfile.lock
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.3.0 \
 && bundle _2.3.0_ install --jobs 4 --retry 3

# 3) Copy your Rails app code
COPY . .

# 4) Bring in node_modules from the builder stage
COPY --from=node_builder /app/node_modules ./node_modules

# 5) Ensure Rails binstubs are executable
RUN chmod +x bin/*

# 6) Expose the default Rails port
EXPOSE 3000

# 7) In development: start Webpacker dev server in the background,
#    then boot Rails (hot‑reload & on‑the‑fly compilation)
CMD ["bash","-lc","\
  bin/webpack-dev-server & \
  rm -f tmp/pids/server.pid && \
  bundle exec rails server -b 0.0.0.0\
"]
