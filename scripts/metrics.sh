#!/bin/bash

## MEMORY CONSUMPTION
echo -n "Maximum resident set size (Kbytes) = "
/usr/bin/time -f "%M" ./scripts/run_demo_client.sh

## THROUGHTPUT
# Grep the number of decisions (lines with 'get <fin decision')
# divide this number by 30
echo -n "Throughput = "
echo "$(grep 'got <fin decision' log | wc -l) / 30" | bc

## LATENCY
python3 latency.py --file log
