///@param level
var level = argument0;

var room_count = room_last;
var found = false;

for(var r = 0; r < room_count; r ++){
	var str = "level_" + string(level) + "_";
	
	if (level == 0){
		str = "prologue_";
	}
	
	if (string_pos(str, room_get_name(r)) != 0){
		if (!found){
			obj_controller_all.room_pers_clear = true;
			obj_controller_all.room_pers_clear_min = r;
			found = true;
		}
		
		obj_controller_all.room_pers_clear_max = r;
	}else{
		if (found){
			obj_controller_all.room_pers_clear_max = r;
			break;
		}
	}
}

if (obj_controller_all.room_pers_clear){
	obj_controller_all.room_pers_clear_at = obj_controller_all.room_pers_clear_min;
}

global.pers_runthrough_pre = true;