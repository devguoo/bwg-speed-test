# Sample VPS Benchmark Results

Last updated: 2026-03-31 22:40 UTC

This file shows a safe benchmark-note format for public GitHub documentation. The original host identifier, server IP and private account details are intentionally omitted.

## System Information

- **Host**: anonymized BandwagonHost VPS sample
- **Kernel**: Linux 6.8.0-100-generic
- **CPU Model**: AMD EPYC-Genoa Processor
- **CPU Cores**: 3
- **Memory**: 2028 MB
- **Disk**: 39G total, 29G free

## Performance Metrics

### CPU Performance
- **OpenSSL SHA256**: 1,535,764 KB/s → 1,555,505 KB/s

### Memory Performance
- **Sysbench Memory Throughput**: 5,583.61 MiB/sec

### Disk I/O Performance
- **Write Speed (512MB dd test)**: ~1,075 MB/s (0.476s for 512MB)
- **Read Speed (512MB dd test)**: ~9,953 MB/s (0.051s for 512MB)

### Network Performance
- **Cloudflare CDN**: 348.98 MiB/s
- **Hetzner (Europe)**: 27.81 MiB/s

## Notes

- Tests were performed on a BandwagonHost VPS sample. The server IP and account details are not published.
- Network tests showed strong connectivity to nearby CDN targets in this sample, but results vary by datacenter, ISP, time of day and test method.
- Disk read performance can benefit from system cache, so repeated read tests should not be treated as guaranteed sustained disk throughput.
- CPU, memory, disk and network numbers are reference data only. Always compare them with your own workload and current order-page configuration.
