#!/bin/bash

STREAM_BENCH_SH=~/streaming-benchmarks/stream-bench.sh
LOCAL_CONF_YAML=~/streaming-benchmarks/conf/localConf.yaml
DATA_DIR=~/streaming-benchmarks/data

# LOAD_VALUES=("1000" "10000" "25000" "50000" "100000" "150000" "200000")
# LOAD_VALUES=("100000" "150000" "200000")
LOAD_VALUES=("100000")
PARALLELISM_VALUES=("1" "2" "3" "4" "8" "12" "16" "24")

for LOAD in "${LOAD_VALUES[@]}"; do
  for PARALLELISM in "${PARALLELISM_VALUES[@]}"; do
    sed -i "s/^LOAD=\${LOAD:-.*}$/LOAD=\${LOAD:-${LOAD}}/" $STREAM_BENCH_SH
    sed -i "s/^process.cores: .*/process.cores: ${PARALLELISM}/" $LOCAL_CONF_YAML
    
    ./stream-bench.sh FLINK_TEST
    sleep 160
    
    if [[ -f "$DATA_DIR/seen.txt" && -f "$DATA_DIR/updated.txt" ]]; then
      mkdir -p "$DATA_DIR/load-${LOAD}/p${PARALLELISM}"
      
      mv "$DATA_DIR/seen.txt" "$DATA_DIR/load-${LOAD}/p${PARALLELISM}/seen.txt"
      mv "$DATA_DIR/updated.txt" "$DATA_DIR/load-${LOAD}/p${PARALLELISM}/updated.txt"
      
      echo "Moved files for load=${LOAD}, cores=${PARALLELISM}"
    else
      echo "Benchmark did not generate expected files for load=${LOAD}, cores=${PARALLELISM}"
    fi
done