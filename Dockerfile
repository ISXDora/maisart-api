FROM ruby:3.0.0-alpine3.13
RUN apk add --no-cache build-base postgresql-dev tzdata postgresql-client
WORKDIR /app
COPY Gemfile* .
RUN bundle install
COPY . .
RUN chmod +x entrypoint.sh
EXPOSE 3000
CMD [ "rails", "server" ]