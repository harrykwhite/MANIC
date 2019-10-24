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