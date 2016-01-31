#!/bin/bash

MAX_LENGTH="$1"

SPACE_TOTAL=$(df -h "$2" | grep -E '/' | awk '{ print $2 }' | sed 's/.$//')
SPACE_USED=$(df -h "$2" | grep -E '/' | awk '{ print $3 }' | sed 's/.$//')
USED_PERC=$(( ($MAX_LENGTH*$SPACE_USED)/$SPACE_TOTAL ))
FREE_PERC=$(( $MAX_LENGTH-$USED_PERC ))

used_bar() {
 num=$1
 v=$(printf "%-${num}s" "")
 echo -en "\033[30;48;5;228m $v \e[0m"
}

free_bar() {
 num=$1
 v=$(printf "%-${num}s" "")
 echo -en "\033[30;48;5;202m $v \e[0m"
}

used_bar $USED_PERC
free_bar $FREE_PERC
