// Minecart State
if (in_minecart){
	state = scr_player_minecart;
}

// Breaking Dash
for(var i = 0; i < (dash_speed) + 1; i ++){
	var inst = instance_place(x + lengthdir_x(i + 1, dash_direction), y + lengthdir_y(i + 1, dash_direction), obj_p_solid);
	
	if (global.cutscene_current != -1) || ((move_x_to != -1) && (move_y_to != -1)) || (dash_length_current >= dash_length) || (inst != noone){
		state = scr_player_move;
	    dash_length_current = 0;
	    return;
	}
}

// Moving
dash_length_current += dash_speed;

dash_after_speed = dash_speed;
dash_after_dir = dash_direction;

x += lengthdir_x(dash_speed, dash_direction);
y += lengthdir_y(dash_speed, dash_direction);

sprite_index = spr_player_idle_1;
image_speed = 0;

footstep_time = 10;

var trail = scr_effect_trail(sprite_index, 0.8, 0.075, 0, image_xscale, 1, 0.01, 0.5, (dash_direction - 180) + random_range(-30, 30));
if (global.player_health_current <= 2){
	trail.special = "LowHealth";
}

part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-12, 12), global.pt_smoke_1, 2);

if (scr_input_get_mouse_x() > global.player_position_x){
    image_xscale = 1;
}else{
    image_xscale = -1;
}