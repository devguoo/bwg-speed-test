# Latest Route Snapshot

Last updated: 2026-03-17 07:22 CST

## Test Results (Changchun Telecom → BandwagonHost major nodes)

| Node | Line | Avg Latency | Status |
|------|------|-------------|--------|
| HKHK_8 | CMI | 81.8ms | Best route |
| AEDXB_1 | Dubai | 84.7ms | Reachable again |
| Tokyo | CN2 GIA | 195.9ms | Stable |
| DC2 USCA_2 | QN | 225.2ms | Recovered |
| DC6 USCA_6 | CN2 GIA-E | 250.6ms | Detour/high latency |
| EUNL_9 | CU 9929 | 297.1ms | Detour/high latency |
| DC8 USCA_8 | CN2 | 376.3ms | Reachable but poor |
| DC3 / DC4 / DC9 / Osaka | Mixed | — | Unreachable |

## Traceroute Note

UDP traceroute from the Changchun home network is filtered immediately after the local gateway (`192.168.6.1`), so this update is based primarily on reachability and latency deltas rather than full public hop visibility.

## Historical Data

View full historical data in the `data/` directory.

---

For detailed analysis, visit [bwhhost.com](https://www.bwhhost.com/).

