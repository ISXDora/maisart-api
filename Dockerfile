FROM ruby:alpine3.19
WORKDIR /app
COPY Gemfile* .
COPY . .
EXPOSE 3000
ENTRYPOINT [ "bundle", "install" ]
CMD [ "rails", "server" ]
