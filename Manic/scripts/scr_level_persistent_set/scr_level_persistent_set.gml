///@param level
var level = argument0;

var room_count = room_last;

for(var r = 0; r < room_count; r ++){
	var str = "level_" + string(level) + "_";
	
	if (level == 0){
		str = "prologue_";
	}
	
	var valid = string_pos(str, room_get_name(r)) != 0;
	
	if (valid){
		show_debug_message(room_get_name(r));
	}
	
	if (r == room){
		room_persistent = valid;
	}else{
		room_set_persistent(r, valid);
	}
}