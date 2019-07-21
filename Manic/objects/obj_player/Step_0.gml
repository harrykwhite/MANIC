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
	
	if (audio_is_playing(burn_sound)){
		audio_pause_sound(burn_sound);
		burn_sound_paused = true;
	}
	return;
}else{
	if (burn_sound_paused){
		audio_resume_sound(burn_sound);
		burn_sound_paused = false;
	}
}

flashlight_alpha += 0.01;
flashlight_alpha = clamp(flashlight_alpha, 0, 1);

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

// Script
scr_player_update();
script_execute(state);

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

image_index = floor(clamp(img_index, 0, image_number));
image_speed = 0;

if (is_visible){
	if (light_brightness < 1){
		light_brightness += 0.05;
	}else if (light_brightness > 1){
		light_brightness -= 0.05;
	}
}

if (instance_exists(mylight)){
	mylight.x = x;
	mylight.y = y;
	scr_modify_player_surrounding_light(mylight, x, y);
}

if (instance_exists(flashlight)){
	if (global.cutscene_current == -1) && (!global.game_pause){
		flashlight_direction = point_direction(x, y, mouse_x, mouse_y);
	}
	
	flashlight.x = x + lengthdir_x(4, flashlight_direction);
	flashlight.y = y + lengthdir_y(4, flashlight_direction);
	flashlight.light[| eLight.X] = x + lengthdir_x(4, flashlight_direction);
	flashlight.light[| eLight.Y] = y + lengthdir_y(4, flashlight_direction);
	flashlight.light[| eLight.LutIntensity] = 1.75;
	flashlight.light[| eLight.Range] = max(360 * light_brightness * surrounding_light, 1);
	flashlight.light[| eLight.Direction] = flashlight_direction;
	flashlight.light[| eLight.Flags] |= eLightFlags.Dirty;
}