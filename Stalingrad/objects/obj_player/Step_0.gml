// Lights
if (!instance_exists(obj_player_light)){
	mylight = instance_create(x, y, obj_player_light);
}

if (!instance_exists(obj_player_flashlight)){
	flashlight = instance_create(x, y, obj_player_flashlight);
}

// Canmove
if (!canmove){
	sprite_index = spr_player_idle_1;
	image_speed = 0;
	return;
}

flashlight_move = true;

// Blend Time
if (i_blend_time > 0){
    i_blend_time--;
}else{
    i_blend_time = 0;
    blend = -1;
}

if (global.cutscene_current != -1){
	flashlight_move = false;
}

// Pause
if (global.game_pause){
	image_speed = 0;
	flashlight_move = false;
	
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

if (isVisible){
	if (light_brightness < 1){
		light_brightness += 0.05;
	}else if (light_brightness > 1){
		light_brightness -= 0.05;
	}
}

if (instance_exists(mylight)){
	mylight.x = x;
	mylight.y = y;
	mylight.light[| eLight.X] = x;
	mylight.light[| eLight.Y] = y;
	mylight.light[| eLight.Range] = 210 * light_brightness;
	mylight.light[| eLight.LutIntensity] = 1.65 + (clamp(flash_time, 0, 2) / 10);
	mylight.light[| eLight.Flags] |= eLightFlags.Dirty;
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
	flashlight.light[| eLight.Range] = 400 * light_brightness;
	flashlight.light[| eLight.Direction] = flashlight_direction;
	flashlight.light[| eLight.Flags] |= eLightFlags.Dirty;
}