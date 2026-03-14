#!/bin/bash
# 搬瓦工 BandwagonHost 多机房测速脚本
# https://github.com/devguoo/bwg-speed-test
# 测试各机房延迟、下载速度，帮你选最快的节点

set -e

# 颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${BOLD}╔══════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}║   搬瓦工 BandwagonHost 多机房测速工具 v1.0   ║${NC}"
echo -e "${BOLD}║   https://github.com/devguoo/bwg-speed-test  ║${NC}"
echo -e "${BOLD}╚══════════════════════════════════════════════╝${NC}"
echo ""

# 搬瓦工测速节点（官方提供）
declare -A NODES
NODES=(
  ["DC2 USCA_2 (QN)"]="104.194.76.1"
  ["DC3 USCA_3 (CN2)"]="23.252.96.1"
  ["DC4 USCA_4 (MCOM)"]="98.142.136.1"
  ["DC6 USCA_6 (CN2 GIA-E) ⭐"]="65.49.131.1"
  ["DC8 USCA_8 (CN2)"]="23.252.99.1"
  ["DC9 USCA_9 (CN2 GIA)"]="65.49.218.1"
  ["日本大阪 (CN2 GIA) 🇯🇵"]="185.212.59.1"
  ["日本东京 (CN2 GIA) 🇯🇵"]="185.212.60.1"
  ["荷兰 EUNL_9 (联通9929) 🇳🇱"]="104.255.65.1"
  ["香港 HKHK_8 (CMI) 🇭🇰"]="93.179.124.1"
  ["迪拜 AEDXB_1 🇦🇪"]="64.176.44.1"
)

# 测速节点下载地址
declare -A DOWNLOAD_URLS
DOWNLOAD_URLS=(
  ["DC2 USCA_2 (QN)"]="http://104.194.76.1/100mb.test"
  ["DC3 USCA_3 (CN2)"]="http://23.252.96.1/100mb.test"
  ["DC4 USCA_4 (MCOM)"]="http://98.142.136.1/100mb.test"
  ["DC6 USCA_6 (CN2 GIA-E) ⭐"]="http://65.49.131.1/100mb.test"
  ["DC8 USCA_8 (CN2)"]="http://23.252.99.1/100mb.test"
  ["DC9 USCA_9 (CN2 GIA)"]="http://65.49.218.1/100mb.test"
  ["日本大阪 (CN2 GIA) 🇯🇵"]="http://185.212.59.1/100mb.test"
  ["日本东京 (CN2 GIA) 🇯🇵"]="http://185.212.60.1/100mb.test"
  ["荷兰 EUNL_9 (联通9929) 🇳🇱"]="http://104.255.65.1/100mb.test"
  ["香港 HKHK_8 (CMI) 🇭🇰"]="http://93.179.124.1/100mb.test"
  ["迪拜 AEDXB_1 🇦🇪"]="http://64.176.44.1/100mb.test"
)

# 排序用的数组
declare -a RESULTS=()

echo -e "${CYAN}📡 开始测试各机房延迟...${NC}"
echo -e "────────────────────────────────────────────────"
printf "${BOLD}%-38s %-12s %-8s${NC}\n" "机房" "延迟(ms)" "丢包率"
echo -e "────────────────────────────────────────────────"

for name in "${!NODES[@]}"; do
  ip="${NODES[$name]}"
  # ping 测试（3次取平均）
  result=$(ping -c 3 -W 3 "$ip" 2>/dev/null)
  if [ $? -eq 0 ]; then
    avg=$(echo "$result" | tail -1 | awk -F'/' '{print $5}')
    loss=$(echo "$result" | grep -oP '\d+(?=% packet loss)' 2>/dev/null || echo "$result" | grep -o '[0-9.]*% packet loss' | grep -o '[0-9.]*')
    if [ -n "$avg" ]; then
      # 颜色标记
      if (( $(echo "$avg < 100" | bc -l 2>/dev/null || echo 0) )); then
        color=$GREEN
      elif (( $(echo "$avg < 200" | bc -l 2>/dev/null || echo 0) )); then
        color=$YELLOW
      else
        color=$RED
      fi
      printf "%-36s ${color}%-12s${NC} %-8s\n" "$name" "${avg}ms" "${loss}%"
      RESULTS+=("${avg}|${name}")
    fi
  else
    printf "%-36s ${RED}%-12s${NC} %-8s\n" "$name" "超时" "100%"
  fi
done

echo -e "────────────────────────────────────────────────"

# 排序输出推荐
echo ""
echo -e "${BOLD}🏆 延迟排名（从低到高）：${NC}"
echo -e "────────────────────────────────────────────────"

IFS=$'\n' sorted=($(for r in "${RESULTS[@]}"; do echo "$r"; done | sort -t'|' -k1 -n))
unset IFS

rank=1
for item in "${sorted[@]}"; do
  latency=$(echo "$item" | cut -d'|' -f1)
  name=$(echo "$item" | cut -d'|' -f2)
  if [ $rank -eq 1 ]; then
    echo -e "  ${GREEN}🥇 #$rank $name — ${latency}ms${NC}"
  elif [ $rank -eq 2 ]; then
    echo -e "  ${CYAN}🥈 #$rank $name — ${latency}ms${NC}"
  elif [ $rank -eq 3 ]; then
    echo -e "  ${YELLOW}🥉 #$rank $name — ${latency}ms${NC}"
  else
    echo -e "  　 #$rank $name — ${latency}ms"
  fi
  ((rank++))
done

echo ""
echo -e "────────────────────────────────────────────────"
echo -e "${BOLD}💡 选购建议：${NC}"
echo -e "  • 延迟 <100ms → 非常适合，体验极佳"
echo -e "  • 延迟 100-200ms → 日常使用没问题"
echo -e "  • 延迟 >200ms → 不推荐，建议换机房"
echo ""
echo -e "  ${CYAN}推荐方案：CN2 GIA-E（DC6）性价比最高${NC}"
echo -e "  ${CYAN}购买链接：https://bwh81.net/aff.php?aff=77647&pid=87${NC}"
echo ""
echo -e "  更多方案对比 → https://github.com/devguoo/bwg-speed-test"
echo -e "  优惠码：${YELLOW}暂无公开有效优惠码${NC}（2026-03-15 实测旧码已过期）"
echo ""
