#!/usr/bin/env bash
# ============================================================================
#  BandwagonHost (搬瓦工) Speed Test — One-Click Datacenter Ping Test
#  https://github.com/devguoo/bwg-speed-test
#
#  Usage:
#    curl -fsSL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/test.sh | bash
#    curl -fsSL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/test.sh | bash -s -- -v
#
#  License: MIT
# ============================================================================

set -euo pipefail

# ── Colors ───────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

# ── Flags ────────────────────────────────────────────────────────────────────
VERBOSE=0
for arg in "$@"; do
  case "$arg" in
    -v|--verbose) VERBOSE=1 ;;
    -h|--help)
      echo "Usage: $0 [-v|--verbose] [-h|--help]"
      echo "  -v  Show extra details (individual ping times, packet loss)"
      echo "  -h  Show this help"
      exit 0
      ;;
  esac
done

# ── Dependency check ─────────────────────────────────────────────────────────
check_deps() {
  for cmd in ping awk sort; do
    if ! command -v "$cmd" &>/dev/null; then
      echo -e "${RED}Error: '$cmd' is required but not found. Please install it first.${RESET}"
      exit 1
    fi
  done
}

# ── Banner ───────────────────────────────────────────────────────────────────
banner() {
  echo ""
  echo -e "${CYAN}${BOLD}"
  echo "  ╔══════════════════════════════════════════════════════════╗"
  echo "  ║                                                          ║"
  echo "  ║    ⚡ BandwagonHost Speed Test                           ║"
  echo "  ║    搬瓦工全球机房一键测速                                ║"
  echo "  ║                                                          ║"
  echo "  ║    github.com/devguoo/bwg-speed-test                     ║"
  echo "  ║                                                          ║"
  echo "  ╚══════════════════════════════════════════════════════════╝"
  echo -e "${RESET}"
}

# ── Datacenter list ──────────────────────────────────────────────────────────
#  Format: NAME|LOCATION|IP|PROTOCOL
#  PROTOCOL: 4 = IPv4, 6 = IPv6
DATACENTERS=(
  "DC2 QNET|Los Angeles|104.194.76.1|4"
  "DC3 CN2|Los Angeles|23.252.96.1|4"
  "DC4 MCOM|Los Angeles|98.142.136.1|4"
  "DC6 CN2 GIA-E|Los Angeles|162.244.241.103|4"
  "DC8 ZNET|Los Angeles|65.49.128.1|4"
  "DC9 CN2 GIA|Los Angeles|65.49.135.97|4"
  "Fremont|Fremont, CA|184.106.214.1|4"
  "New Jersey|New Jersey|23.29.138.5|4"
  "New York|New York|208.167.227.1|4"
  "Japan Osaka Softbank|Osaka, Japan|185.212.59.1|4"
  "Japan Tokyo CN2 GIA|Tokyo, Japan|2607:f130:0:17e::3b2a|6"
  "Hong Kong CN2 GIA|Hong Kong|93.179.124.161|4"
  "Dubai|Dubai, UAE|45.154.3.1|4"
)

# ── Ping function ────────────────────────────────────────────────────────────
#  Returns average latency in ms, or "timeout" if unreachable
do_ping() {
  local ip="$1"
  local proto="$2"
  local count=4
  local timeout=3
  local ping_cmd="ping"

  # Use ping6 for IPv6 if needed
  if [[ "$proto" == "6" ]]; then
    if command -v ping6 &>/dev/null; then
      ping_cmd="ping6"
    elif ping -6 -c 1 -W 1 ::1 &>/dev/null 2>&1; then
      ping_cmd="ping -6"
    else
      echo "skip_ipv6"
      return
    fi
  fi

  local result
  if [[ "$ping_cmd" == "ping -6" ]]; then
    result=$(ping -6 -c "$count" -W "$timeout" "$ip" 2>/dev/null) || true
  else
    result=$($ping_cmd -c "$count" -W "$timeout" "$ip" 2>/dev/null) || true
  fi

  if [[ -z "$result" ]]; then
    echo "timeout"
    return
  fi

  # Extract average from "min/avg/max/mdev" or "min/avg/max/stddev" line
  local avg
  avg=$(echo "$result" | awk -F'[/ ]' '/avg/ { for(i=1;i<=NF;i++) if($i=="avg") { print $(i+2); exit } }')

  # Fallback: try rtt min/avg/max pattern
  if [[ -z "$avg" ]]; then
    avg=$(echo "$result" | grep -oP 'rtt min/avg/max/\S+ = [^/]+/\K[^/]+' 2>/dev/null || true)
  fi

  # Fallback: try round-trip min/avg/max pattern (macOS)
  if [[ -z "$avg" ]]; then
    avg=$(echo "$result" | grep 'round-trip' | awk -F'/' '{print $5}' 2>/dev/null || true)
  fi

  if [[ -n "$avg" && "$avg" != "0" ]]; then
    # Verbose: show individual times
    if [[ "$VERBOSE" -eq 1 ]]; then
      local times
      times=$(echo "$result" | grep 'time=' | sed 's/.*time=\([0-9.]*\).*/\1/' | tr '\n' ',' | sed 's/,$//')
      local loss
      loss=$(echo "$result" | grep -oP '\d+% packet loss' || echo "0% packet loss")
      echo "${avg}|${times}|${loss}"
    else
      echo "$avg"
    fi
  else
    echo "timeout"
  fi
}

# ── Status label ─────────────────────────────────────────────────────────────
latency_status() {
  local ms="$1"
  if (( $(echo "$ms < 50" | bc -l 2>/dev/null || awk "BEGIN{print ($ms<50)}") )); then
    echo -e "${GREEN}● Excellent${RESET}"
  elif (( $(echo "$ms < 100" | bc -l 2>/dev/null || awk "BEGIN{print ($ms<100)}") )); then
    echo -e "${GREEN}● Great${RESET}"
  elif (( $(echo "$ms < 200" | bc -l 2>/dev/null || awk "BEGIN{print ($ms<200)}") )); then
    echo -e "${YELLOW}● Good${RESET}"
  elif (( $(echo "$ms < 300" | bc -l 2>/dev/null || awk "BEGIN{print ($ms<300)}") )); then
    echo -e "${YELLOW}● Fair${RESET}"
  else
    echo -e "${RED}● Slow${RESET}"
  fi
}

# ── Compare floats ───────────────────────────────────────────────────────────
float_lt() {
  awk "BEGIN { exit !($1 < $2) }"
}

# ── Main ─────────────────────────────────────────────────────────────────────
main() {
  check_deps
  banner

  local total=${#DATACENTERS[@]}
  local current=0

  # Temporary file for results
  local tmpfile
  tmpfile=$(mktemp /tmp/bwg-speed-XXXXXX)
  trap "rm -f '$tmpfile'" EXIT

  echo -e "${BOLD}  Testing $total datacenters...${RESET}"
  echo ""

  for entry in "${DATACENTERS[@]}"; do
    IFS='|' read -r name location ip proto <<< "$entry"
    current=$((current + 1))

    printf "  [%2d/%d] %-28s %-18s " "$current" "$total" "$name" "$location"

    result=$(do_ping "$ip" "$proto")

    if [[ "$result" == "skip_ipv6" ]]; then
      echo -e "${DIM}⊘ Skipped (no IPv6 support)${RESET}"
      echo "99999|$name|$location|skip_ipv6" >> "$tmpfile"
    elif [[ "$result" == "timeout" ]]; then
      echo -e "${RED}✗ Timeout${RESET}"
      echo "99998|$name|$location|timeout" >> "$tmpfile"
    else
      if [[ "$VERBOSE" -eq 1 ]]; then
        local avg times loss
        IFS='|' read -r avg times loss <<< "$result"
        echo -e "${GREEN}${avg} ms${RESET}  ${DIM}[${times}] ${loss}${RESET}"
        echo "${avg}|$name|$location|ok" >> "$tmpfile"
      else
        echo -e "${GREEN}${result} ms${RESET}"
        echo "${result}|$name|$location|ok" >> "$tmpfile"
      fi
    fi
  done

  echo ""
  echo -e "${BOLD}${CYAN}  ─────────────────────────────────────────────────────────${RESET}"
  echo -e "${BOLD}${CYAN}  📊 Results (sorted by latency, lowest first)${RESET}"
  echo -e "${BOLD}${CYAN}  ─────────────────────────────────────────────────────────${RESET}"
  echo ""

  # Header
  printf "  ${BOLD}%-28s  %-18s  %10s  %-16s${RESET}\n" "Datacenter" "Location" "Latency" "Status"
  printf "  %-28s  %-18s  %10s  %-16s\n" "──────────────────────────" "────────────────" "────────" "──────────────"

  # Sort by latency (numeric)
  local sorted
  sorted=$(sort -t'|' -k1 -n "$tmpfile")

  local first=1
  while IFS='|' read -r ms name location status; do
    if [[ "$status" == "skip_ipv6" ]]; then
      printf "  %-28s  %-18s  %10s  ${DIM}⊘ Skipped (IPv6)${RESET}\n" "$name" "$location" "—"
    elif [[ "$status" == "timeout" ]]; then
      printf "  %-28s  %-18s  %10s  ${RED}✗ Unreachable${RESET}\n" "$name" "$location" "—"
    else
      local status_label
      status_label=$(latency_status "$ms")
      if [[ "$first" -eq 1 ]]; then
        # Highlight the fastest in green + bold
        printf "  ${GREEN}${BOLD}%-28s  %-18s  %7s ms  🏆 Fastest!${RESET}\n" "$name" "$location" "$ms"
        first=0
      else
        printf "  %-28s  %-18s  %7s ms  %b\n" "$name" "$location" "$ms" "$status_label"
      fi
    fi
  done <<< "$sorted"

  echo ""
  echo -e "${CYAN}  ─────────────────────────────────────────────────────────${RESET}"
  echo ""
  echo -e "  💡 还没有搬瓦工？查看购买指南 → ${BOLD}https://www.bwhhost.com${RESET}"
  echo -e "  📊 更多 VPS 速度评测 → ${BOLD}https://www.vps-best.com${RESET}"
  echo ""
  echo -e "  ${DIM}⭐ 觉得好用？给个 Star → github.com/devguoo/bwg-speed-test${RESET}"
  echo ""
}

main "$@"
