# Latest Route Snapshot

Last updated: 2026-04-15 03:35 CST
Source: Changchun Telecom home network

## Ping Results

| Node | Line | Avg Latency | Status |
|------|------|-------------|--------|
| HKHK_8 | CMI | 72.1ms | Best route, improved sharply from 100.8ms |
| Tokyo | CN2 GIA | 196.3ms | Stable |
| DC6 USCA_6 | CN2 GIA-E | 229.5ms | Recovered to late-March / early-April range |
| DC4 USCA_4 | MCOM | 230.7ms | Reachable again, but jitter is obvious |
| DC2 USCA_2 | QN | 279.7ms | Reachable, but clearly slower than HK/Tokyo/DC6 |
| DC9 USCA_9 | CN2 GIA | — | Still unreachable |
| Osaka | CN2 GIA | — | Still unreachable |
| DC3 / DC8 / EUNL_9 / AEDXB_1 | Mixed | — | Unreachable in this sample |

## Traceroute Note

Traceroute is still filtered right after the local gateway (`192.168.6.1`).

Observed pattern on 2026-04-15 for HKHK_8 (`93.179.124.161`), DC6 (`162.244.241.103`), DC4 (`98.142.136.1`), DC2 (`104.194.76.1`), DC9 (`65.49.135.97`), Osaka (`185.212.59.1`), plus the route-check IPs Tokyo (`185.212.60.1`), HKHK_8 (`93.179.124.1`), DC6 (`65.49.131.1`) and DC9 (`65.49.218.1`):

```text
1  192.168.6.1  ~2ms
2+ * * *
```

That means this snapshot is based on reachability and latency deltas, not public hop-by-hop visibility.

## Change Summary vs 2026-04-01 06:49

- **HKHK_8** improved from `100.8ms` to `72.1ms` — now clearly the best route.
- **Tokyo** remains stable (`198.5ms` → `196.3ms`).
- **DC6 CN2 GIA-E** recovered strongly (`308.7ms` → `229.5ms`) and is usable again.
- **DC4 MCOM** recovered from unreachable to `230.7ms`, but latency variance is high.
- **DC2 QN** was re-tested and lands at `279.7ms`, well behind the top group.
- **DC9 CN2 GIA** dropped back to unreachable after the temporary recovery seen on 2026-04-01.
- **Osaka** remains unreachable.

## Raw Verification Notes

Additional route-check pings:

- Tokyo route-check IP `185.212.60.1`: `196.3ms`
- HKHK_8 route-check IP `93.179.124.1`: `86.3ms`
- DC6 route-check IP `65.49.131.1`: `229.5ms`
- DC9 route-check IP `65.49.218.1`: unreachable

---

For detailed buying and routing analysis, visit [bwhhost.com](https://www.bwhhost.com/).
