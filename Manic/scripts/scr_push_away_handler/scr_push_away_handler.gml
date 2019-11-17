if (global.cutscene_current != -1){
	return;
}

var tpawn_list = ds_list_create();
var tpawn_count = instance_place_list(x, y, obj_p_pawn, tpawn_list, false);

if (tpawn_count > 0){
	for(var t = 0; t < tpawn_count; t ++){
		var tpawn = tpawn_list[| t];
		var tpawn_obj = tpawn.object_index;
		
		if (tpawn_obj != obj_enemy_1) && (tpawn_obj != obj_enemy_3) && (tpawn_obj != obj_enemy_4){
			push_direction = point_direction(x, y, tpawn.x, tpawn.y) - 180;
			
			if (push_speed < push_speed_max){
				push_speed += push_speed_build;
			}
		}
	}
}else{
	push_speed *= 0.85;
}

if (abs(push_speed) > 0.01){
	if (!place_meeting(x + lengthdir_x(push_speed * 2, push_direction), y + lengthdir_y(push_speed * 2, push_direction), obj_p_solid)){
		x += lengthdir_x(push_speed, push_direction);
		y += lengthdir_y(push_speed, push_direction);
	}else{
		push_speed = 0;
	}
}else{
	push_speed = 0;
}

ds_list_destroy(tpawn_list);