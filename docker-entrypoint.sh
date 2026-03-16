#!/bin/sh
set -e

HS_DIR=/var/lib/tor/privatecall
mkdir -p "$HS_DIR"
chmod 700 "$HS_DIR"

# Inject stable v3 onion key from environment variables
if [ -n "$TOR_HS_SECRET_KEY_B64" ] && [ -n "$TOR_HS_PUBLIC_KEY_B64" ]; then
    echo "$TOR_HS_SECRET_KEY_B64" | base64 -d > "$HS_DIR/hs_ed25519_secret_key"
    echo "$TOR_HS_PUBLIC_KEY_B64" | base64 -d > "$HS_DIR/hs_ed25519_public_key"
    chmod 600 "$HS_DIR/hs_ed25519_secret_key"
    chmod 644 "$HS_DIR/hs_ed25519_public_key"
fi

exec tor -f /etc/tor/torrc "$@"
