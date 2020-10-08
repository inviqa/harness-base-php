FROM debian:stable-slim

ARG TIDEWAYS_ENVIRONMENT_DEFAULT=production
ENV TIDEWAYS_ENVIRONMENT=$TIDEWAYS_ENVIRONMENT_DEFAULT
ENV TIDEWAYS_HOSTNAME=tideways-daemon

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    ca-certificates \
    curl \
    gnupg2 \
    sudo \
  && echo 'deb https://packages.tideways.com/apt-packages debian main' > /etc/apt/sources.list.d/tideways.list \
  && curl -L -sS 'https://packages.tideways.com/key.gpg' | apt-key add - \
  && DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -yq tideways-daemon \
  && apt-get autoremove --assume-yes \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/bin/sh", "-c", "exec tideways-daemon --address=0.0.0.0:9135 --hostname=$TIDEWAYS_HOSTNAME"]
