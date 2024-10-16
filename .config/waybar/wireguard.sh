#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Create dictionary object
declare -A servers
servers[wgpf]="🇫🇷 WGPF"
servers[wgpus]="🇺🇸 WGPUS"
servers[wgpsw]="🇨🇭 WGPSW"
servers[pwdr]="🏢 Toggle Powder"

novpn="🚫"
powder_running="🟢 PWDR"

function wg_int() {
    sudo wg show | grep interface | awk '{print $2}'
}

function tailscale_status() {
    status=$(curl --silent --fail --unix-socket /var/run/tailscale/tailscaled.sock http://local-tailscaled.sock/localapi/v0/status | jq --raw-output .BackendState)
    if [[ $status = "Running" ]]; then
        echo $powder_running
    fi
}

function status() {
    WG_INTERFACE=$(wg_int)
    TAILSCALE_STATUS=$(tailscale_status)

    # Check if the interface is in the servers array
    if [[ -n "$WG_INTERFACE" && ${servers[$WG_INTERFACE]+_} ]]; then
        echo "${servers[$WG_INTERFACE]} $TAILSCALE_STATUS"
    else
        echo "$novpn $TAILSCALE_STATUS"
    fi
}

function manager() {
    # Display the current VPN status
    STATUS=$(status)
    WG_INTERFACE=$(wg_int)
    echo -e "\n${YELLOW}Current VPN status: $STATUS${NC}"
    sudo wg show

    # Print the list of servers
    echo -e "\n${YELLOW}Network configs:${NC}"
    for server in "${!servers[@]}"; do
        echo "- $server: ${servers[$server]}"
    done

    echo "- x: ${novpn} No VPN"

    # Prompt user to choose a server
    read -p "> " server_choice

    # Check if the chosen server is valid or server_choice != x
    if [[ $server_choice != "x" && -z "${servers[$server_choice]}" ]]; then
        echo -e "\n${RED}❌ Invalid server choice! Please try again.${NC}"
        exit 1
    fi

    if [[ $server_choice = "pwdr" ]]; then
        if [[ $(tailscale_status) = "$powder_running" ]]; then
            echo -e "\n${YELLOW}🔄 Disconnecting tailscale ...${NC}"
            sudo tailscale down
            sudo systemctl stop tailscaled
        else
            echo -e "\n${GREEN}🔄 Connecting tailscale...${NC}"
            sudo systemctl start tailscaled
            sudo tailscale up
            tailscale status
        fi

        echo -e "\n${YELLOW}❓ Setup another server? (y/N)${NC}"
        read -p "> " setup_another

        if [[ $setup_another = "y" ]]; then
            manager
        fi

        exit 0
    fi

    # Check if any WireGuard server is already running
    if [[ -n "$WG_INTERFACE" ]]; then
        echo -e "\n${YELLOW}🔄 Disconnecting ${servers[$WG_INTERFACE]} ($WG_INTERFACE)...${NC}"
        sudo wg-quick down "$WG_INTERFACE" && echo -e "${RED}✅ $WG_INTERFACE disconnected!\n${NC}"
    fi

    if [[ $server_choice = "x" ]]; then
        exit 0
    fi

    # Connect to the chosen WireGuard server
    echo -e "\n${GREEN}🔄 Connecting to ${servers[$server_choice]} ($server_choice)...${NC}"
    sudo wg-quick up "$server_choice" && echo -e "${GREEN}✅ ${servers[$server_choice]} connected!\n${NC}"

    # Show current WireGuard status
    sudo wg show
}

case $1 in
-s | --status)
    status
    ;;
*)
    manager
    ;;
esac
