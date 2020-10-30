FROM solr:5-slim

ARG SOLR_VERSION="4.10.4"
ARG SOLR_SHA512="f7a83504e0f9a4c81b0acafdf452c0c05fcbdf185375f383450bef4fd478812b5259705b55203460d03da46add12cec2442d399ad3716e4e11c393a9a9a01b03"

USER root

# Install SOLR 4 over the top of SOLR 5 from instructions in
# https://github.com/docker-solr/docker-solr/blob/master/5.5/slim/Dockerfile
RUN rm -rf /opt/solr \
 && wget -t 10 --max-redirect 1 --retry-connrefused -nv "https://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz" -O "/opt/solr-$SOLR_VERSION.tgz" \
 && echo "$SOLR_SHA512 */opt/solr-$SOLR_VERSION.tgz" | sha512sum -c - \
 && tar -C /opt --extract --file "/opt/solr-$SOLR_VERSION.tgz" \
 && mv "/opt/solr-$SOLR_VERSION" /opt/solr \
 && rm "/opt/solr-$SOLR_VERSION.tgz"* \
 && rm -Rf /opt/solr/docs/ /opt/solr/dist/{solr-core-$SOLR_VERSION.jar,solr-solrj-$SOLR_VERSION.jar,solrj-lib,solr-test-framework-$SOLR_VERSION.jar,test-framework} /opt/solr/example/solr/collection1 \
 && mkdir -p /opt/solr/server/solr/lib /opt/solr/server/solr/mycores /opt/solr/server/logs \
 && sed -i -e "s/\"\$(whoami)\" == \"root\"/\$(id -u) == 0/" /opt/solr/bin/solr \
 && sed -i -e 's/lsof -PniTCP:/lsof -t -PniTCP:/' /opt/solr/bin/solr \
 && sed -i 's#! -d \$coredir #! -d "$coredir/conf/" #' /opt/docker-solr/scripts/precreate-core \
 && if [ -f "/opt/solr/contrib/prometheus-exporter/bin/solr-exporter" ]; then chmod 0755 "/opt/solr/contrib/prometheus-exporter/bin/solr-exporter"; fi \
 && chown -R "$SOLR_USER:$SOLR_GROUP" /opt/solr /docker-entrypoint-initdb.d /opt/docker-solr \
 && chown -R "$SOLR_USER:$SOLR_GROUP" /opt/mysolrhome /opt/solr/example/solr \
 \
 # Install unzip to allow solr to start \
 && apt-get -qq update \
 && apt-get -qq -y --no-install-recommends install \
    unzip \
 \
 # Clean the image \
 && apt-get autoremove -qq \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV SOLR_HOME=/opt/solr/example/solr

USER $SOLR_USER
