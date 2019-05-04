// Minecart State
if (in_minecart){
	state = scr_player_minecart;
}

// Breaking Dash
for(var i = 0; i < (dash_speed) + 1; i ++){
	var inst = instance_place(x + lengthdir_x(i, dash_direction), y + lengthdir_y(i, dash_direction), obj_p_solid);
	
	if (global.cutscene_current != -1) || ((move_xTo != -1) && (move_yTo != -1)) || (dash_length_current >= dash_length) || (inst != noone){
		/*if (inst != noone){
			scr_env_objects();
			len = array_length_1d(envobject);
			
			for(var e = 0; e < len; e ++){
				if (inst.object_index == envobject[e]){
					scr_effect_screenshake(3);
					scr_effect_freeze(5);
					inst.death = true;
					return;
				}
			}
		}*/
		
		state = scr_player_move;
	    dash_length_current = 0;
	    return;
	}
}

// Moving
dash_length_current += dash_speed;

x += lengthdir_x(dash_speed, dash_direction);
y += lengthdir_y(dash_speed, dash_direction);
sprite_index = spr_player_idle_1;
image_speed = 0;

var trail = scr_effect_trail(sprite_index, 0.8, 0.075, 0, image_xscale, 1, 0.01, 0.5, (dash_direction - 180) + random_range(-30, 30));
if (global.player_health_current <= 2){
	trail.special = "LowHealth";
}

part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-12, 12), global.pt_smoke_1, 2);

if (mouse_x > x){
    image_xscale = 1;
}else{
    image_xscale = -1;
}