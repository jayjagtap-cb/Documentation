```
cbrun -t gpu -- sbatch -c 8 -C v100-spot run.sh
```

```
~/ws/miniconda3/envs/tf2/bin/python run.py --params configs/params_gat_qm9.yaml --mode train_and_eval --model_dir ~/ws/models/gat_qm9_00
```
