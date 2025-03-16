# Evaluation of Parallelism Tuning for Flink  

## Overview  
This project evaluates the impact of parallelism tuning on the performance of Apache Flink using the Yahoo Streaming Benchmark (YSB). The goal is to analyze how varying levels of parallelism and workload affect throughput, latency, and overall system efficiency. Our findings provide insights into Flink's ability to scale under load and highlight potential bottlenecks in the processing pipeline.  

## Repository Structure  
```
├── eval.ipynb # Jupyter notebook containing data analysis, charts, and insights
├── run-benchmark.sh # Shell script to automate bulk test runs
└── data/ # Directory containing test data for benchmarking
``` 

## How to Run  
1. Clone the repository:  
   ```bash
   git clone https://github.com/your-repo/flink-parallelism-tuning.git
   ```
2. Navigate to the project directory: 
    ```bash 
    cd flink-parallelism-tuning
    ```
3. Run the benchmark tests:
    ```bash
    ./run-benchmark.sh
    ```
4. Analyze the results using the Jupyter notebook:
    ```bash
    jupyter notebook eval.ipynb
    ```

## Key Findings
- Increasing parallelism did not always lead to better performance due to bottlenecks in Kafka and Redis.
- Single-node constraints (I/O and resource allocation) limited Flink’s ability to scale efficiently.
- Further analysis is needed to explore Kafka partitioning, Redis write latency, and disk I/O limitations.

## Authors
Fahimeh Fakour, Yuri Kim, Brooke Simon, Vishal Yathish (Group 6)

