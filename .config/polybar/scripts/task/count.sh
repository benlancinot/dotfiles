#!/bin/bash

WORK_ICON=""
PERSO_ICON=""

PERSO_TASKS_COUNT=`task status:pending project:perso count`
WORK_TASKS_COUNT=`task status:pending project:work count`

echo "$PERSO_ICON $PERSO_TASKS_COUNT $WORK_ICON $WORK_TASKS_COUNT"
