### 1. Weight Streaming Overview
  1. We move to utilize Weight Sparsity instead of Activation Sparsity.
  2. Dataset servers copy activation/delta bufferes to and from CS1.
 
### Weight Streaming Kernels:
  1. Fan-out for weights and activations, to scatter data to multiple rows.
  2. Fan-in is used for evictions(sending activations out), gradients.
  3. Weights streamed over core, commit partial sums to FIFO which allows asynchronous operations, FSUM PE receives final sums.

### Weight Streaming Source and Tools
Code in ```technology/waxpy```
1. 2 parts to the driver: 1. Activation server which lives on x86 machines and 2. Weight and Command Server which
   also lives on x86 machines
2. waxpy server is responsible to handle commands and weights 
