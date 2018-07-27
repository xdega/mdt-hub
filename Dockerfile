FROM ruby:2.3
RUN apt-get update -y

# Node
RUN apt-get install gnupg2 -y
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -yq nodejs build-essential

# Configuration
RUN echo "alias ls='ls --color=auto'" >> /root/.bashrc && \
    echo "export PS1='\[\e[0;32m\]\u@\h:\[\e[0;36m\]\w\[\e[0m\]$ '" >> /root/.bashrc && \
WORKDIR /var/www/rails

ADD Gemfile Gemfile.lock /var/www/rails/
RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
