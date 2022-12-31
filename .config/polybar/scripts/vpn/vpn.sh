#!/bin/sh

# GreyColor="%{F#585858}"
# WhiteColor="%{F#BDBDBD}"

# NORDVPN_SERVER=$(nordvpn status | grep server | tr -d ' ' | cut -d ':' -f2)
# NORDVPN_STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)
# OPENVPN_ISI=$(pgrep -a openvpn | grep -ic "isi.ovpn")
# OPENVPN_NORDVPN=$(pgrep -a openvpn | grep -ic "nordvpn/data/.config.ovpn")

# if pgrep -x openvpn &>/dev/null; then
#     if [ $OPENVPN_ISI -eq 1 ]; then
#         echo "  isi "
#     elif [ $OPENVPN_NORDVPN -eq 1 ]; then
#         echo "  $NORDVPN_SERVER "
#     else
#         echo "  "
#     fi
# elif [[ ! -z $NORDVPN_STATUS && $NORDVPN_STATUS == 'Connected' ]]; then
#     echo "  $NORDVPN_SERVER "
# else
echo "$GreyColor  "
#fi
