FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    tor \
    && rm -rf /var/lib/apt/lists/*

COPY torrc /etc/tor/torrc
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /var/lib/tor && chown -R debian-tor:debian-tor /var/lib/tor

USER debian-tor
ENTRYPOINT ["/entrypoint.sh"]
