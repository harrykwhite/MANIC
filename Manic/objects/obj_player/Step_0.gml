// Lights
if (!instance_exists(obj_player_light) && surrounding_light >= 0.1){
	mylight = instance_create_layer(x, y, "Lights", obj_player_light);
}

if (surrounding_light < 0.1) || (global.weapon_slot[global.weapon_slotcurrent] != -1) || (global.level_current != Level.Prologue){
	if (!instance_exists(obj_player_flashlight)){
		flashlight = instance_create_layer(x, y, "Lights", obj_player_flashlight);
	}
}else{
	if (instance_exists(obj_player_flashlight)){
		instance_destroy(obj_player_flashlight);
		flashlight = noone;
	}
}

// Canmove
if (!canmove){
	sprite_index = spr_player_idle_1;
	image_speed = 0;
	return;
}

// Blend Time
if (i_blend_time > 0){
    i_blend_time--;
}else{
    i_blend_time = 0;
    blend = -1;
}

// Pause
if (global.game_pause){
	image_speed = 0;
	
	if (audio_is_playing(heartbeat)){
		audio_stop_sound(heartbeat);
	}
	return;
}

flashlight_alpha += 0.01;
flashlight_alpha = clamp(flashlight_alpha, 0, 1);

// Script
scr_player_update();
script_execute(state);

// Confining the player to the room.
var confine_range = 12;

if (global.cutscene_current != -1){
	confine_range = -240;
}

x = clamp(x, confine_range, room_width - confine_range);
y = clamp(y, confine_range, room_height - confine_range);

// Animation
if (in_minecart){
	img_speed = 0.03;
}

if (sign(img_speed) == 1){
	if (img_index < image_number){
	    img_index += img_speed;
	}else{
	    img_index = 0;
	}
}else{
	if (img_index > 0){
	    img_index += img_speed;
	}else{
	    img_index = image_number;
	}
}

image_yscale = 1;

image_index = floor(clamp(img_index, 0, image_number));
image_speed = 0;

if (is_visible){
	if (light_brightness < 1){
		light_brightness += 0.025;
	}else if (light_brightness > 1){
		light_brightness -= 0.025;
	}
	
	if (flash_time > 0){
		flash_time --;
	}
}

if (instance_exists(mylight)){
	mylight.x = x;
	mylight.y = y;
	scr_modify_player_surrounding_light(mylight, x, y);
}

if (instance_exists(flashlight)){
	flashlight_brightness = approach(flashlight_brightness, 1, 20);
	
	if (global.cutscene_current == -1) && (!global.game_pause){
		flashlight_direction = point_direction(x, y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
	}
	
	flashlight.x = x + lengthdir_x(4, flashlight_direction);
	flashlight.y = y + lengthdir_y(4, flashlight_direction);
	flashlight.Light_Intensity = 1.75;
	flashlight.Light_Range = max(100 * light_brightness * surrounding_light * (1 + ((global.game_option[| Options.Flashing] / 100) * (flashlight_brightness - 1))), 1);
	flashlight.Light_Direction = flashlight_direction;
}