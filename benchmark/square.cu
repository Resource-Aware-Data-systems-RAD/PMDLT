#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string>

#include <iostream>

using namespace std;

void delay(int number_of_seconds)
{
    // Converting time into milli_seconds
    int milli_seconds = 1000 * number_of_seconds;
 
    // Storing start time
    clock_t start_time = clock();
 
    // looping till required time is not achieved
    while (clock() < start_time + milli_seconds)
        ;
}

__global__ void square(float * d_out, float * d_in) {
    int idx = threadIdx.x; // threadIdx is a cuda built-in variable
    float f = d_in[idx];
    d_out[idx] = f * f;
}

int main(int argc, char* argv[]) {

	cout << "comes" << endl;
    const int NUM_OF_BLOCKS = stoi(argv[1]);
    const int ARRAY_SIZE = stoi(argv[2]);
    const int ARRAY_BYTES = ((NUM_OF_BLOCKS * ARRAY_SIZE) *  (sizeof(float)));
    float h_in[ARRAY_BYTES];
    
    int counter = 0;

    for (int i = 0; i < ARRAY_SIZE; i++) {
        h_in[i] = float(i);
    }
    float h_out[ARRAY_BYTES];

    float * d_in;
    float * d_out;


    cout << "come here too before allocation" << endl;

    cudaMalloc((void **) &d_in, ARRAY_BYTES);
    cudaMalloc((void **) &d_out, ARRAY_BYTES);
cout << "after allocation and before copy" << endl;

    cudaMemcpy(d_in, h_in, ARRAY_BYTES, cudaMemcpyHostToDevice);
	
    
    
    while(counter < 2000000) {
    	square<<<NUM_OF_BLOCKS, ARRAY_SIZE>>>(d_out, d_in);
    	//delay(10);

	counter++;
    }
cout << "before copy back" << endl;
    cudaMemcpy(h_out, d_out, ARRAY_BYTES, cudaMemcpyDeviceToHost);

    cudaFree(d_in);
    cudaFree(d_out);
    
    return 0;
}
