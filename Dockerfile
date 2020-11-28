FROM elixir:1.11.2

RUN mkdir -pv /srv/projects/text-server
WORKDIR /srv/projects/text-server
COPY . .

RUN mix local.hex --force && \
    mix local.rebar --force

ENV MIX_ENV=prod

RUN mix deps.get && \
    mix do compile
