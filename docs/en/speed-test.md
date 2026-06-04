# Speed Test Notes

This repository provides a lightweight latency test for selected BandwagonHost public test targets.

## What It Measures

The script sends ICMP ping packets and reports average round-trip latency. It is useful for a first-pass route comparison, but it does not measure:

- full bandwidth;
- long-term packet loss;
- product stock;
- billing cycle;
- real application performance.

## Recommended Workflow

1. Run the script from a network close to your users.
2. Compare the top reachable datacenters.
3. Repeat the test at different times if the result matters.
4. Check product series, stock and datacenter availability before ordering.

## Why Some Targets Time Out

Timeout can happen when:

- ICMP is filtered;
- IPv6 is unavailable on your network;
- the route is temporarily unstable;
- the public test target changes.

Timeout should be treated as a signal to investigate, not a final statement about product availability.

## Chinese Buying References

- [Chinese VPS selector](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=en_speed_selector)
- [BandwagonHost stock monitor](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=en_speed_stock)
