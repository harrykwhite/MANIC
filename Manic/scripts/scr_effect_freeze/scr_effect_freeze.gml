/// @param frame_speed
var fs = argument0;

if (global.game_option[| Options.ScreenFreeze]){
	if (!instance_exists(obj_ef_freeze)){
	    f = instance_create_layer(0, 0, "Control", obj_ef_freeze);
	    f.framespd = fs;
	}else{
	    with(obj_ef_freeze){
	        framespd = fs;
			time = 0;
	    }
	}
}