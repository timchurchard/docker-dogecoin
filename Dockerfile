FROM debian:stretch-slim

RUN groupadd -r dogecoin && useradd -r -m -g dogecoin dogecoin

RUN set -ex \
	&& apt-get update \
	&& apt-get install -qq --no-install-recommends ca-certificates dirmngr gosu gpg wget \
	&& rm -rf /var/lib/apt/lists/*

ENV DOGECOIN_VERSION 1.14.2
ENV DOGECOIN_FILE dogecoin-1.14.2-x86_64-linux-gnu.tar.gz
ENV DOGECOIN_URL https://github.com/dogecoin/dogecoin/releases/download/v1.14.2/
ENV DOGECOIN_SHA256 10c400c8f2039b1f804b8a533266201a9e4e3b32a8854501e8a43792e1ee78e6

# install dogecoin binaries
RUN set -ex \
	&& cd /tmp \
	&& wget -qO "$DOGECOIN_FILE" "$DOGECOIN_URL$DOGECOIN_FILE" \
	&& echo "$DOGECOIN_SHA256 $DOGECOIN_FILE" | sha256sum -c - \
	&& tar -xzvf "$DOGECOIN_FILE" -C /usr/local --strip-components=1 --exclude=*-qt \
	&& rm -rf /tmp/*

# create data directory
ENV DOGECOIN_DATA /data
RUN mkdir "$DOGECOIN_DATA" \
	&& chown -R dogecoin:dogecoin "$DOGECOIN_DATA" \
	&& ln -sfn "$DOGECOIN_DATA" /home/dogecoin/.dogecoin \
	&& chown -h dogecoin:dogecoin /home/dogecoin/.dogecoin
VOLUME /data

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 22555 22556
CMD ["dogecoind"]
