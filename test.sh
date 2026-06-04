#!/usr/bin/env bash

set -u

COUNT=4
TIMEOUT=3
VERBOSE=0

usage() {
  cat <<'EOF'
BandwagonHost Speed Test

Usage:
  ./test.sh [-c count] [-t timeout_seconds] [-v]

Options:
  -c  Ping count per target. Default: 4
  -t  Timeout seconds. Default: 3
  -v  Verbose ping output
  -h  Show help
EOF
}

while getopts "c:t:vh" opt; do
  case "$opt" in
    c) COUNT="$OPTARG" ;;
    t) TIMEOUT="$OPTARG" ;;
    v) VERBOSE=1 ;;
    h) usage; exit 0 ;;
    *) usage; exit 1 ;;
  esac
done

if ! [[ "$COUNT" =~ ^[0-9]+$ ]] || [ "$COUNT" -lt 1 ]; then
  echo "Error: -c count must be a positive integer." >&2
  exit 1
fi

if ! [[ "$TIMEOUT" =~ ^[0-9]+$ ]] || [ "$TIMEOUT" -lt 1 ]; then
  echo "Error: -t timeout must be a positive integer." >&2
  exit 1
fi

NODES=(
  "DC2 QNET|Los Angeles|104.194.76.1|ipv4"
  "DC3 CN2|Los Angeles|23.252.96.1|ipv4"
  "DC4 MCOM|Los Angeles|98.142.136.1|ipv4"
  "DC6 CN2 GIA-E|Los Angeles|162.244.241.103|ipv4"
  "DC8 ZNET|Los Angeles|65.49.128.1|ipv4"
  "DC9 CN2 GIA|Los Angeles|65.49.135.97|ipv4"
  "Fremont|Fremont|184.106.214.1|ipv4"
  "New Jersey|New Jersey|23.29.138.5|ipv4"
  "New York|New York|208.167.227.1|ipv4"
  "Osaka SoftBank|Osaka|185.212.59.1|ipv4"
  "Tokyo CN2 GIA|Tokyo|2607:f130:0:17e::3b2a|ipv6"
  "Hong Kong CN2 GIA|Hong Kong|93.179.124.161|ipv4"
  "Dubai|Dubai|45.154.3.1|ipv4"
)

is_macos() {
  [ "$(uname -s)" = "Darwin" ]
}

has_ipv6() {
  if command -v ping6 >/dev/null 2>&1; then
    return 0
  fi
  if ping -6 -c 1 ::1 >/dev/null 2>&1; then
    return 0
  fi
  return 1
}

run_ping() {
  local ip="$1"
  local proto="$2"

  if [ "$proto" = "ipv6" ]; then
    if command -v ping6 >/dev/null 2>&1; then
      ping6 -c "$COUNT" -W "$TIMEOUT" "$ip"
      return
    fi
    ping -6 -c "$COUNT" -W "$TIMEOUT" "$ip"
    return
  fi

  if is_macos; then
    ping -c "$COUNT" -W "$((TIMEOUT * 1000))" "$ip"
  else
    ping -c "$COUNT" -W "$TIMEOUT" "$ip"
  fi
}

extract_avg() {
  awk -F'/' '
    /min\/avg\/max/ || /round-trip/ {
      if (NF >= 5) {
        print $5;
        exit;
      }
    }
  '
}

status_for_latency() {
  local value="$1"
  awk -v v="$value" 'BEGIN {
    if (v < 80) print "Great";
    else if (v < 160) print "Good";
    else if (v < 260) print "Fair";
    else print "Slow";
  }'
}

tmp_file="$(mktemp)"
trap 'rm -f "$tmp_file"' EXIT

echo "BandwagonHost Speed Test"
echo "Targets: ${#NODES[@]} | Count: $COUNT | Timeout: ${TIMEOUT}s"
echo

index=1
for node in "${NODES[@]}"; do
  IFS='|' read -r name location ip proto <<<"$node"

  if [ "$proto" = "ipv6" ] && ! has_ipv6; then
    printf '[%2d/%2d] %-22s %-14s skipped IPv6\n' "$index" "${#NODES[@]}" "$name" "$location"
    printf '999999\t%s\t%s\t%s\t%s\t%s\n' "$name" "$location" "$ip" "-" "Skipped IPv6" >>"$tmp_file"
    index=$((index + 1))
    continue
  fi

  output="$(run_ping "$ip" "$proto" 2>&1)"
  avg="$(printf '%s\n' "$output" | extract_avg)"

  if [ "$VERBOSE" -eq 1 ]; then
    echo "---- $name ($ip) ----"
    printf '%s\n' "$output"
    echo
  fi

  if [ -n "$avg" ]; then
    status="$(status_for_latency "$avg")"
    printf '[%2d/%2d] %-22s %-14s %8sms %s\n' "$index" "${#NODES[@]}" "$name" "$location" "$avg" "$status"
    printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$avg" "$name" "$location" "$ip" "${avg}ms" "$status" >>"$tmp_file"
  else
    printf '[%2d/%2d] %-22s %-14s timeout\n' "$index" "${#NODES[@]}" "$name" "$location"
    printf '999998\t%s\t%s\t%s\t%s\t%s\n' "$name" "$location" "$ip" "-" "Timeout" >>"$tmp_file"
  fi

  index=$((index + 1))
done

echo
echo "Results sorted by latency"
printf '%-24s %-14s %-16s %s\n' "Datacenter" "Location" "Latency" "Status"
printf '%-24s %-14s %-16s %s\n' "----------" "--------" "-------" "------"
sort -n "$tmp_file" | while IFS=$'\t' read -r _ name location _ip latency status; do
  printf '%-24s %-14s %-16s %s\n' "$name" "$location" "$latency" "$status"
done

cat <<'EOF'

Notes:
- Ping latency is only one signal. Check stock, product series, billing cycle and datacenter availability before purchasing.
- Chinese buying tools:
  https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=test_sh
  https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=test_sh
EOF
