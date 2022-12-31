#!/bin/bash
set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errexit

# handle errors
trap 'echo "NA "' ERR

if [ -f /var/lib/pacman/db.lck ]; then
    echo "  "
else
    # Updates arch BDD
    sudo yay -Sy > /dev/null 2>&1
    # Count availables updates
    updates="$(yay -Qu 2>/dev/null | wc -l)"
    # Display count
    echo "$updates"
fi
