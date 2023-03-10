#!/bin/bash

for i in 4096 8192 16384 32768 65536 131072
do
	for j in 1 8 32 128 256 512 1024
	do
		echo $i $j
		if (($i == 0))
			then
			 	nvidia-smi --query-gpu=gpu_name,utilization.gpu,utilization.memory,memory.total,memory.used --format=csv -l 1 > "1.$j.nvsm".txt &
			 	dcgmi dmon -e 203,204,1001,1002,1003,1004,1005 > "1.$j.dcgmi".txt &
				./square 1 $j

				pkill nvidia-smi
				pkill dcgmi
			else
				nvidia-smi --query-gpu=gpu_name,utilization.gpu,utilization.memory,memory.total,memory.used --format=csv -l 1 > "$i.$j.nvsm".txt &
                        	dcgmi dmon -e 203,204,1001,1002,1003,1004,1005 > "$i.$j.dcgmi".txt &
				./square $i $j

				pkill nvidia-smi
				pkill dcgmi
			fi
	done
done
