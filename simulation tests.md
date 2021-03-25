## Reference Template for simulation tests  
https://github.com/Cerebras/monolith/blob/master/tests/siemens/conf/cvae_simulation.yml

## Reference Template for compile tests  
https://github.com/Cerebras/monolith/blob/master/tests/siemens/conf/cvae_compile.yml  

## Validation Command:
```
jayj@jayj-dev ~/ws/monolith_0.7.0/monolith (jayjagtap/seimenes_test_fix) $ cb_cli siemens train validate --name gat_simulation
0325 11:44:14 INFO    orchestrator.py:97   validating train - gat_simulation
0325 11:44:16 ERROR   config_manager.py:212  when using predict_csub_node_slots:True, csub_node_slots:24 should not be set in csub_config as it will be predicted
0325 11:44:16 INFO    cb_cli.py:1995 gat_simulation - validation status - 5
```

## Wiki Link  
https://cerebras.atlassian.net/wiki/spaces/IntegrationTeam/pages/1207631885/Integ+Regressions
