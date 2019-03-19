FROM yukinying/chrome-headless-browser:latest

EXPOSE 9222

USER root

RUN apt update \
  && DEBIAN_FRONTEND=noninteractive apt-get -qq -y --no-install-recommends install \
   iproute2

COPY root /

ENTRYPOINT ["/entrypoint.sh"]
