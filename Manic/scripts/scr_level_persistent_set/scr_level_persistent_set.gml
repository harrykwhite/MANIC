///@param level
var level = argument0;

var room_count = room_last + 1;

for(var r = 0; r <= room_count; r ++){
	var str = "level_" + string(level) + "_";
	
	if (level == 0){
		str = "prologue_";
	}
	
	var valid = string_pos(str, room_get_name(r)) != 0;
	
	if (r == room){
		room_persistent = valid;
	}else{
		room_set_persistent(r, valid);
	}
}