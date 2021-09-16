FROM docker:20.10.8-alpine3.13

WORKDIR /app

RUN apk add git ansible docker py-pip \
  && pip install docker

COPY ./ ./
RUN ansible-galaxy install -r requirements.yml
RUN pip install docker

# CMD ./run.sh