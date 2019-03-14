index = 40;
look_x = 504;
look_y = 448;
look_time = 80;
look_object = inst_112E097F;
look_prop = true;
destroy_on_activate = false;
reactivate_on_death = true;
deactivate_on_activate = true;
if (global.game_boss_final_killed){
	instance_destroy();
}