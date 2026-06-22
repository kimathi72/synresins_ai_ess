FROM ruby:3.4

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install && \
    groupadd -g 1000 app && \
    useradd -m -u 1000 -g app app

USER app

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]