instance_destroy(obj_player);

var comps = ds_grid_height(global.player_companions);

for(var i = 0; i < comps; i ++){
	var cobj = global.player_companions[# 0, i];
	
	if (cobj != -1){
		if (instance_exists(cobj)){
			instance_destroy(cobj);
		}
	}
}

if (scr_level_is_arena()){
	var index = 0;
	
	switch(room){
		case rm_arena_1_00: index = 0; break;
		case rm_arena_2_00: index = 1; break;
		case rm_arena_3_00: index = 2; break;
	}
	
	scr_arena_update_highscore(index);
	scr_arena_write_highscore(index);
	
	global.level_score[global.level_current] = 0;
}