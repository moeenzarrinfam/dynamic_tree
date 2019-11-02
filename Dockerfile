FROM ruby:2.6.3-slim

# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl git

# Environment Variables
ENV RAILS_ROOT /var/www/dynamic-tree
ENV PORT 8080

# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $RAILS_ROOT/tmp/pids

# Set our working directory inside the image
WORKDIR $RAILS_ROOT

# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler

# Finish establishing our Ruby enviornment
RUN bundle install --without development test

# Copy the Rails application into place
COPY . .

# Entrypoint is not ignored when Docker container runs with commandline
ENTRYPOINT [ "./docker/scripts/server.sh" ]

# Health Check
HEALTHCHECK --interval=30s --timeout=5s \
 CMD docker/scripts/healthcheck.sh
