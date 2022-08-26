Source Environment
```
source /cb/home/eugene/ws/venv/setup_venv.sh
```

V100
```
cbrun -t gpu -- sbatch -p v100-spot run.sh
```
g4
```
cbrun -t gpu -- sbatch -p gpu -C g4dn.xlarge -c 4 run.sh
```
V100 on-demand
```
cbrun -t gpu -- sbatch -p gpu -C v100 -c 8 run.sh

```
Reserve from 2b cluster
```
cbrun -t gpu-2b -- srun --pty -p v100 -C p3.2xlarge -c 8 --time 4:00:00 bash
```
To run sbatch with 4 v100
```
cbrun -t gpu -- sbatch  -p v100x4 -c 32 run.sh
```
```
#!/usr/bin/bash
~william/ws/conda/envs/tf//bin/python run.py --params configs/params_gat_qm9.yaml  --mode train_and_eval --model_dir /net/jayj-dev/srv/nfs/jayj-data/ws/comparisons/lrelu_fix_for_0/model_dir
```

```
cbrun -t gpu -- srun -p gpu -C v100  ~william/ws/conda/envs/tf//bin/python run.py -p /net/jayj-dev/srv/nfs/jayj-data/ws/MONOLITHS/mnist_activation/monolith/tests/ws/test_018_transformers/model_params/gpt2_mini.yaml  -v mini_no_dp_ls -o mini_no_dp_ls_32kvocab -m train
```


