// Deactivating Outside Instances
if (corpse_active_time > 0){
	corpse_active_time --;
}

if (deactivate_time > 0){
    deactivate_time--;
}else{
	deactivate_time = 7;
    scr_deactivate_outside();
}