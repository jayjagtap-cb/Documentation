cd to
```
cd src/customer_models/gsk/tensorflow/gnn/
```

setup cuda environment and load cbrun module
```
source ~abhay/ws/envs/tf22_cuda101/bin/activate
module load cbrun
```

copy remote CS1 model_dir into local
```
cbrun -t gpu -- srun -c 8 -C v100-spot ~abhay/miniconda3/envs/tf_22_cuda101/bin/python -B run.py --params <path to model_params.yaml> --model_dir <path to model_dir> --mode eval
```
