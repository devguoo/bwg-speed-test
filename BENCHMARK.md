# VPS Benchmark Results

Last updated: 2026-03-31 22:40 UTC

## System Information

- **Hostname**: quick-path-6.localdomain
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

- Tests performed on搬瓦工 VPS (65.49.212.223)
- Network tests show excellent connectivity to Cloudflare CDN
- Disk read performance benefits from system cache
- CPU: AMD EPYC-Genoa, suitable for compute workloads
