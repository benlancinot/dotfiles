#!/usr/bin/env bash

GreyColor="%{F#585858}"
WhiteColor="%{F#BDBDBD}"

MEDIUM_TEMPERATURE=55
WARN_TEMPERATURE=85
MAX_CORETEMPERATURE=$(sensors | grep Core | awk '{print substr($3, 2, length($3)-5)}' | sort -n | tail -1)

if [ $MAX_CORETEMPERATURE -lt $MEDIUM_TEMPERATURE ]
then
    printf " %s  %s%s°C " $GreyColor $WhiteColor $MAX_CORETEMPERATURE
elif [ $MAX_CORETEMPERATURE -lt $WARN_TEMPERATURE ]
then
    printf " %s  %s%s°C " $GreyColor $WhiteColor $MAX_CORETEMPERATURE
else
    printf " %s  %s%s°C " $GreyColor $WhiteColor $MAX_CORETEMPERATURE
fi
