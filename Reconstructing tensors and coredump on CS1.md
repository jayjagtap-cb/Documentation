
# cd to workdir
```
[onprem@sc-r10ra4-s1 ~]$ cd /cb/cs1-job-logs/siemens_logs/system35/workdir-test_153_gsk_gat-test_run-test_tf_sys_flow-system35-chembl20-base_nightly.20210303.1747.04.1/fixtures
```
# enter singularity shell
```
[onprem@sc-r10ra4-s1 fixtures]$ singularity shell /cb/data/tests/sif_images/cbcore-0.0.0-202103021129-2304-9c511ba3.sif
```
# load plan
```
cs_load_plan --planmeta cs_eb534058d88bb5b3e4192df3f96ebd0bba346de4b38a3757c65f8b15c7cce726/plan.meta --cmaddr 10.254.91.192:9000 --init --load --weights init/weights_start.npz
```
# stream coordinator
```
cs_stream_coordinator --cmaddr 10.254.91.192:9000 --planmeta cs_eb534058d88bb5b3e4192df3f96ebd0bba346de4b38a3757c65f8b15c7cce726/plan.meta --batchsize 16 --steps 2
```
# finalize (PEs start running cycles
```
cs_load_plan --cmaddr 10.254.91.192:9000 --finalize --planmeta cs_eb534058d88bb5b3e4192df3f96ebd0bba346de4b38a3757c65f8b15c7cce726/plan.meta
```
# send data
```
cs_stream_driver --planmeta cs_eb534058d88bb5b3e4192df3f96ebd0bba346de4b38a3757c65f8b15c7cce726/plan.meta --cmaddr 10.254.91.192:9000 --auto --send --data 
init/streams.npz --steps 16 --offset 0
```
# receieve data
```
cs_stream_receiver --cmaddr 10.254.91.192:9000 --planmeta cs_eb534058d88bb5b3e4192df3f96ebd0bba346de4b38a3757c65f8b15c7cce726/plan.meta --out_dir ./test --block_size 16 --steps 1
```
# take checkpoint
```
cs_debug -c checkpoint --cmaddr 10.254.47.224:9000 --planmeta cs_c5a07b7a9b9f1161c34955a920c94b748b917159f3261936bbbaaff80b65a447/plan.meta --checkpoint core_exp_stall.ckpt
```
# get exceptions
```
cs_debug -c config --checkpoint ./core_exp_stall.ckpt --dump_exceptions --output ./exceptions --planmeta ./cs_c5a07b7a9b9f1161c34955a920c94b748b917159f3261936bbbaaff80b65a447/plan.meta --redirect ./exceptions.log
```

# Monitor mode on CS1
```
cs_numerical_debug --session test_session10 --init --input cs_eb534058d88bb5b3e4192df3f96ebd0bba346de4b38a3757c65f8b15c7cce726 --cmaddr 10.254.91.192:9000
cs_numerical_debug --session test_session10 --start_monitor
```
# after stall
```
cs_numerical_debug --session test_session10 --end_of_iteration
df_tensor_reconstruct -d test_session10 -o reconstructed_tensors
```
# take checkpoint
```
cs_debug -c checkpoint --cmaddr 10.254.91.192:9000 --planmeta cs_eb534058d88bb5b3e4192df3f96ebd0bba346de4b38a3757c65f8b15c7cce726/plan.meta --checkpoint cs_eb534058d88bb5b3e4192df3f96ebd0bba346de4b38a3757c65f8b15c7cce726/core_stall.ckpt
```
# Unmask a exception
```
cs_debug -c exceptiondebug --exceptions oflow,invld,div_z --planmeta cs_c5a07b7a9b9f1161c34955a920c94b748b917159f3261936bbbaaff80b65a447/plan.meta --cmaddr 10.254.47.224:9000
```
# Symbol dump for a layer
```
cs_debug -c data --detailed --checkpoint nan_core.ckpt --planmeta model_dir/cs_2d88c0633676ae0515bbfd403cc4687fa81df323ab4cad4a4b1801aeb02cab75/plan.meta --layer  layer_norm1 >  layer_norm1.symbols
```
# Config dump for a layer
```
cs_debug -c config --detailed --checkpoint nan_core.ckpt --planmeta model_dir/cs_2d88c0633676ae0515bbfd403cc4687fa81df323ab4cad4a4b1801aeb02cab75/plan.meta --layer  layer_norm1 >  layer_norm1.symbols
```
# To get symbol dump in T_F16
```
previous_cmd --type _T_F16
Other options can be seen with --help
```
