FROM ruby:3.1.2-bullseye
RUN apt-get update &&\
    apt-get install -y nodejs postgresql-client &&\
    mkdir /myapp &&\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.lisT &&\
    apt-get update &&\
    apt-get install -y yarn
WORKDIR /myapp
COPY ["./Gemfile", "./Gemfile.lock", "/myapp/"] 
COPY ./myapp /myapp
RUN bundle install