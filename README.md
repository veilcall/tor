# tor

Tor hidden service gateway for Veilcall.

Routes `.onion` traffic to the internal API without exposing server IP.

## Notes

- Tor v3 key injected via environment variables at startup for stable `.onion` address
- No SOCKS port exposed
- Outbound TCP only — no inbound ports needed
