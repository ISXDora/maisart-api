FROM ubuntu:20.04
RUN apt -y update && \
    apt -y install ruby -v 2.7.4 && \
    apt -y install yarn && \
    apt -y install rails
WORKDIR /app
RUN adduser isadoraxavier 
RUN chown -R isadoraxavier:isadoraxavier /app
COPY Gemfile* .
RUN gem install bundler -v 2.4.22
COPY . .
EXPOSE 3000
USER isadoraxavier
ENTRYPOINT [ "bundle", "install" ]
CMD [ "rails", "server" ]
