# Reserving a system<br />
```
module load cbscheduler
cbs_show system9 or cbs_lres to show all systems  
cbs_schedule -g "Goal of reservation" system9 04:00  
cbs_extend reservation_hash 02:00 
cbs_release resevation_hash 
```
 
# Checking system software and state
```
ssh root@system9 
cs software show 
Note:( software 0.0.0 is the master software)
cs system show   
 ```
 
# Install the system with latest master
```
cs1_install -s system9 -w default -b latest
cs1_install -s <system> -w default --release-stable
cs1_install -s <system> -w rel-1.6.0ease-stable
 ```
# Install latest release branch build
```
cs1_install -s system9 -w rel-0.7.0 -b latest
```
# Install release branch and particular build
```
cs1_install -s system9 -w rel-0.7.0 -b build_no
```
# Log into system's cm
```
ssh root@system9
ssh cm 
sh cmlog 
```
# Soft reboot to bring system back from STAND BY state 
```
cs system standby 
cs system activate 
```

# Change system execution mode
```
1. cs system standby ->
2. cs config execmode setup ,enter ->
3. choose pipeline/weight streaming ->
4. cs system activate
```

