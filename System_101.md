# Reserving a system<br /> 
module load cbscheduler<br/>    
cbs_show system9 or cbs_lres to show all systems<br/>  
cbs_schedule -g "Goal of reservation" system9 04:00<br/>  
cbs_extend reservation_hash 02:00 <br/> 
cbs_release resevation_hash <br/> 
 
# Checking system software and state <br/> 
ssh root@system9 <br/> 
cs software show <br/> 
Note:( software 0.0.0 is the master software)<br/>  
cs system show <br/>  
 
# Install the system with latest master<br /> 
cs1_install -s system9 -w default -b latest  
 
# Log into system's cm 
ssh root@system9
ssh cm 
sh cmlog 

# Soft reboot to bring system back from STAND BY state 
cs system standby 
cs system activate 


