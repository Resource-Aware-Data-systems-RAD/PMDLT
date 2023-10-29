# Profiling and Monitoring Deep Learning Training Tasks
This repository contains the data of our experiments for showing profiling and monitoring tools overhead in our paper "Profiling and Monitoring Deep Learning Training Tasks". Also, it contains our simple CUDA benchmark that we used for showing GRACT, SMACT, and SMOCC metrics changes over different numbers of thread blocks and threads in each thread block.

1. [CUDA benchmark](benchmark/square.cu) - [script](benchmark/script.sh) for running with different configurations - related [data](data/01-metic_data/)
2. Profiling and monitoring tools overhead measuring experiments
    - Profiling tools
    - Monitoring tools
3. Models we trained while measuring the tools' overhead
    - Simple CNN-based MNIST classifier
    - ResNet50 on ImageNet
## Paper presentation video

[![Watch the video](https://img.youtube.com/vi/-dZkowi_zpM/hqdefault.jpg)](https://www.youtube.com/embed/-dZkowi_zpM)

[<img src="https://img.youtube.com/vi/-dZkowi_zpM/hqdefault.jpg" width="600" height="300"
/>](https://www.youtube.com/embed/-dZkowi_zpM)

## Cite our paper

### latex
```latex
@inproceedings{10.1145/3578356.3592589,
author = {Yousefzadeh-Asl-Miandoab, Ehsan and Robroek, Ties and Tozun, Pinar},
title = {Profiling and Monitoring Deep Learning Training Tasks},
year = {2023},
isbn = {9798400700842},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
url = {https://doi.org/10.1145/3578356.3592589},
doi = {10.1145/3578356.3592589},
abstract = {The embarrassingly parallel nature of deep learning training tasks makes CPU-GPU co-processors the primary commodity hardware for them. The computing and memory requirements of these tasks, however, do not always align well with the available GPU resources. It is, therefore, important to monitor and profile the behavior of training tasks on co-processors to understand better the requirements of different use cases. In this paper, our goal is to shed more light on the variety of tools for profiling and monitoring deep learning training tasks on server-grade NVIDIA GPUs. In addition to surveying the main characteristics of the tools, we analyze the functional limitations and overheads of each tool by using a both light and heavy training scenario. Our results show that monitoring tools like nvidia-smi and dcgm can be integrated with resource managers for online decision making thanks to their low overheads. On the other hand, one has to be careful about the set of metrics to correctly reason about the GPU utilization. When it comes to profiling, each tool has its time to shine; a framework-based or system-wide GPU profiler can first detect the frequent kernels or bottlenecks, and then, a lower-level GPU profiler can focus on particular kernels at the micro-architectural-level.},
booktitle = {Proceedings of the 3rd Workshop on Machine Learning and Systems},
pages = {18–25},
numpages = {8},
keywords = {co-processors, monitoring, optimization, deep learning, profiling},
location = {Rome, Italy},
series = {EuroMLSys '23}
}
```
