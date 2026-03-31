# Latest Route Snapshot

Last updated: 2026-04-01 06:49 CST
Source: Changchun Telecom home network

## Ping Results

| Node | Line | Avg Latency | Status |
|------|------|-------------|--------|
| HKHK_8 | CMI | 100.8ms | Best route, improved from 109.5ms |
| Tokyo | CN2 GIA | 198.5ms | Stable |
| DC9 USCA_9 | CN2 GIA | 314.6ms | Recovered from unreachable, but high latency |
| DC6 USCA_6 | CN2 GIA-E | 308.7ms | Degraded significantly (was 223.3ms) |
| DC4 USCA_4 | MCOM | — | Unreachable (was 206.2ms) |
| Osaka | CN2 GIA | — | Still unreachable |
| DC2 USCA_2 | QN | — | Not tested this round |
| DC3 / DC8 / EUNL_9 / AEDXB_1 | Mixed | — | Not tested / unreachable |

## Traceroute Note

UDP traceroute to DC6 (`65.49.131.1`), DC9 (`65.49.218.1`), Tokyo (`185.212.60.1`), Osaka (`185.212.59.1`), and HKHK_8 (`93.179.124.1`) is still filtered right after the local gateway (`192.168.6.1`).

That means this snapshot is based on reachability and latency deltas, not public hop-by-hop visibility.

## Change Summary vs 2026-04-01 03:39

- **HKHK_8** improved from `109.5ms` to `100.8ms` — remains the best route.
- **Tokyo** stable around `198ms`.
- **DC6 CN2 GIA-E** degraded from `223.3ms` to `308.7ms` — significant routing issue.
- **DC4 MCOM** regressed from `206.2ms` to unreachable.
- **DC9 CN2 GIA** recovered from unreachable to `314.6ms`, but still poor.
- **Osaka** remains unreachable.

---

For detailed buying and routing analysis, visit [bwhhost.com](https://www.bwhhost.com/).
