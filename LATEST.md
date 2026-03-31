# Latest Route Snapshot

Last updated: 2026-04-01 03:39 CST
Source: Changchun Telecom home network

## Ping Results

| Node | Line | Avg Latency | Status |
|------|------|-------------|--------|
| HKHK_8 | CMI | 109.5ms | Still best, but slower than last snapshot |
| Tokyo | CN2 GIA | 194.7ms | Stable |
| DC4 USCA_4 | MCOM | 206.2ms | Recovered / slightly ahead of DC6 in this sample |
| DC6 USCA_6 | CN2 GIA-E | 223.3ms | Reachable, still detoured |
| EUNL_9 | CU 9929 | 253.5ms | Reachable, slightly improved |
| DC2 USCA_2 | QN | 299.2ms | Reachable but high latency |
| DC3 / DC8 / DC9 / Osaka / AEDXB_1 | Mixed | — | Unreachable |

## Traceroute Note

UDP traceroute to DC6 (`65.49.131.1`), DC9 (`65.49.218.1`), Tokyo (`185.212.60.1`), Osaka (`185.212.59.1`), and HKHK_8 (`93.179.124.1`) is still filtered right after the local gateway (`192.168.6.1`).

That means this snapshot is based on reachability and latency deltas, not public hop-by-hop visibility.

## Change Summary vs 2026-03-17

- HKHK_8 remains the best route, but latency increased from `81.8ms` to `109.5ms`.
- Tokyo remains stable around `195ms`.
- DC6 CN2 GIA-E improved from `250.6ms` to `223.3ms`, but still trails Hong Kong and Tokyo.
- DC4 MCOM is temporarily ahead of DC6 in this sample.
- DC9 CN2 GIA and Dubai AEDXB_1 regressed from reachable to unreachable.

---

For detailed buying and routing analysis, visit [bwhhost.com](https://www.bwhhost.com/).
