V100
```
cbrun -t gpu -- sbatch -c 8 -C v100-spot run.sh
```
g4
```
cbrun -t gpu -- sbatch -p gpu -C g4dn.xlarge -c 4 run.sh
```
V100 on-demand
```
cbrun -t gpu -- sbatch -p gpu -C v100 -c 8 run.sh
```
```
#!/usr/bin/bash
~william/ws/conda/envs/tf//bin/python run.py --params configs/params_gat_qm9.yaml  --mode train_and_eval --model_dir /net/jayj-dev/srv/nfs/jayj-data/ws/comparisons/lrelu_fix_for_0/model_dir
```

```
cbrun -t gpu -- srun -p gpu -C v100  ~william/ws/conda/envs/tf//bin/python run.py -p /net/ribhu-dev/srv/nfs/ribhu-data/ws/ws2/simulate/tests/ws/test_018_transformers/model_params/gpt2_small.yaml -v small_64k -o small -m train
```
