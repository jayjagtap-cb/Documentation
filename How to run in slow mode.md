1. Add this to config
```
config.plangen.address_map = True
```
2. Optional but preferred
```
--cifparam config.plangen.emit_plan_file=True
```
3. Finally enable cifparam for HW exception flow to run in slow mode
```
--cifparam debug.debug_hw_exception=True
```
