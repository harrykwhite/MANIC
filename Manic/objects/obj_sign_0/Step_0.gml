if (global.game_pause){
	return;
}

var player = obj_player;
if (instance_exists(player)){
	if (point_distance(x, y, player.x, player.y) < 30){
		interact = true;
	}else{
		interact = false;
	}
}else{
	interact = false;
}

if (interact) && (obj_controller_ui.dialogue_time <= 0) && (global.cutscene_current == -1){
	sprite_index = spr_sign_0_interact;
	scr_ui_control_indicate("Read");
	
	if (interact_break <= 0){
		if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active){
			interact_break = 15;
			talking = true;
			scr_player_stamina_drain(4);
			
			obj_controller_ui.dialogue = text;
			obj_controller_ui.dialogue_voice = snd_character_dialogue_generic_in;
			obj_controller_ui.dialogue_time = 60 * 4;
			obj_controller_ui.dialogue_pause = false;
			obj_controller_ui.dialogue_length = string_length(obj_controller_ui.dialogue);
			obj_controller_ui.dialogue_char_count = 0;
			obj_controller_ui.dialogue_x = x;
			obj_controller_ui.dialogue_y = y - 24;
		}
	}else{
		interact_break --;
	}
}else{
	sprite_index = spr_sign_0;
}

if (talking){
	obj_controller_ui.dialogue_x = x;
	obj_controller_ui.dialogue_y = y - 24;
	
	if (obj_controller_ui.dialogue_time <= 0){
		talking = false;
	}
}

// Flash
flash -= 0.15;
flash = clamp(flash, 0, 1);

// Motion
if (spd > 0.375){
	if (!place_meeting(x + lengthdir_x(spd + 3, dir), y + lengthdir_y(spd + 3, dir), obj_p_pawn)){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}
	
	spd *= 0.9;
}else{
	if (point_distance(x, y, basex, basey) >= 1){
		var dirto = point_direction(x, y, basex, basey);
		if (!place_meeting(x + lengthdir_x(3, dirto), y + lengthdir_y(3, dirto), obj_p_pawn)){
			x += lengthdir_x(abs(basex - x) * 0.1, dirto);
			y += lengthdir_y(abs(basey - y) * 0.1, dirto);
		}
	}else{
		x = basex;
		y = basey;
	}
}

// Hit Control
if (hit <= 0){
	death = true;
}

if (hit_time > 0){
	hit_time--;
}

// Object Death
if (death){
	scr_env_destroy(spr_sign_0_break);
	
	if (talking){
		obj_controller_ui.dialogue_time = 0;
	}
}