FROM alpine:3.13

WORKDIR /app

RUN apk add \
  git \
  openssh \
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

# CMD ./run.sh
