#!/bin/bash

# =========================
#       RECONPORT
# =========================

# BlackArch-style colors
GREEN='\033[0;32m'   # Green text
BOLD='\033[1m'       # Bold
NC='\033[0m'         # Reset

# ASCII RECONPORT BlackArch-style
echo -e "${BOLD}${GREEN}"
echo "██████╗ ███████╗ ██████╗ ██████╗ ███╗   ██╗██████╗  ██████╗ ██████╗ ████████╗"
echo "██╔══██╗██╔════╝██╔════╝██╔═══██╗████╗  ██║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝"
echo "██████╔╝█████╗  ██║     ██║   ██║██╔██╗ ██║██████╔╝██║   ██║██████╔╝   ██║   "
echo "██╔══██╗██╔══╝  ██║     ██║   ██║██║╚██╗██║██╔═══╝ ██║   ██║██╔══██╗   ██║   "
echo "██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║  ██║   ██║   "
echo "╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   "
echo -e "${NC}"
echo

# Argument check
if [ "$#" -ne 1 ]; then
    echo -e "${GREEN}[!] Usage: $0 <network/subnet>${NC}"
    exit 1
fi

NETWORK=$1
REPORT="reconport_report_$(date +%Y%m%d_%H%M%S).txt"

echo -e "${GREEN}[*] Starting network reconnaissance on ${NETWORK}${NC}" | tee $REPORT
echo >> $REPORT

# Active host discovery
echo -e "${GREEN}[*] Scanning for active hosts...${NC}" | tee -a $REPORT
HOSTS=$(nmap -sn $NETWORK | grep "Nmap scan report" | awk '{print $5}')

if [ -z "$HOSTS" ]; then
    echo -e "${GREEN}[!] No active hosts found!${NC}" | tee -a $REPORT
    exit 0
fi

# Loop through each host
for ip in $HOSTS; do
    echo -e "${GREEN}[+] Active host found: $ip${NC}" | tee -a $REPORT

    # Port scan 20-1024 with service detection
    echo -e "${GREEN}    Scanning ports 20-1024...${NC}" | tee -a $REPORT
    nmap -sV -p 20-1024 $ip | tee -a $REPORT

    # Separator
    echo -e "${GREEN}----------------------------------------${NC}" | tee -a $REPORT
done

echo -e "${GREEN}[*] Reconnaissance completed!${NC}"
echo -e "${GREEN}[*] Report saved to $REPORT${NC}"
echo -e "${GREEN} Happy pentesting with RECONPORT!${NC}"
