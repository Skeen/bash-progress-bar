#!/bin/bash

function progress()
{
    # Progress (0-100)
    PROGRESS=$1

    echo -ne "\r\e[0K"
    # Check limits
    if [ $PROGRESS -gt 100 ]; then
        echo "Progress > 100" >&2
        PROGRESS=100
    elif [ $PROGRESS -lt 0 ]; then
        echo "Progress < 0" >&2
        PROGRESS=0
    fi

    # Calculate number of hashes / marks
    HASHES=$(($PROGRESS * 72 / 100))
    MARKS=$(($HASHES + 1))

    # Print hashes and marks
    if [ $HASHES -ne 0 ]; then
        printf '#%.0s' $(seq 1 1 $HASHES)
    fi
    if [ $HASHES -ne 72 ]; then
        printf '*%.0s' $(seq $MARKS 1 72)
    fi
    # Print percentage
    printf "%7s" "$PROGRESS.0%"
}

for i in $(seq 0 1 100)
do
    progress $i
    sleep 1
done
