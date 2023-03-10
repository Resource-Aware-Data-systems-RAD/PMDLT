# Profiling and Monitoring of Deep Learning Training Tasks
This repository contains the data of our experiments for showing profiling and monitoring tools overhead. Also, it contain our simple CUDA code that we used for showing GRACT, SMACT, SMOCC changes over different number of thread block and threads in each thread block.

1. [CUDA benchmark](benchmark/square.cu) - [script](benchmark/script.sh) for running with different configurations - related [data](data/01-metic_data/)
2. Profiling and monitoing tools overhead measuring experiments
    - Profiling tools
    - Monitoring tools
3. Models we trained while measuring the tools' overhead
    - Simple CNN-based MNIST classifier
    - ResNet50 on ImageNet 