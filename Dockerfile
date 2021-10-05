FROM docker:20.10.8-alpine3.13

WORKDIR /app

RUN apk add \
  git \
  docker \
  docker-compose \
  python3 \
  py3-pip \
  python3-dev \
  gcc \
  musl-dev \
  libffi-dev \
  openssl-dev \
  rust \
  cargo \
  && pip install --upgrade pip setuptools wheel \
  && pip install cryptography \
  && pip install docker ansible-core

COPY ./requirements.yml ./requirements.yml
RUN ansible-galaxy install -r requirements.yml
COPY ./ ./

CMD ./run.sh