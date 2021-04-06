```
cbrun -t gpu -- sbatch -c 8 -C v100-spot run.sh
```

```
#!/usr/bin/bash
~william/ws/miniconda3/envs/tf2/bin/python run.py --params configs/params_gat_qm9.yaml  --mode eval_all --model_dir /net/jayj-dev/srv/nfs/jayj-data/ws/comparisons/lrelu_fix_for_0/model_dir
```
