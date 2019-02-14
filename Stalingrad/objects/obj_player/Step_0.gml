flashlight_move = true;

// Blend Time
if (i_blendTime > 0){
    i_blendTime--;
}else{
    i_blendTime = 0;
    blend = -1;
}

if (global.cutscene_current != -1){
	flashlight_move = false;
}

// Pause
if (global.game_pause){
	image_speed = 0;
	flashlight_move = false;
	
	if (audio_is_playing(burn_sound)){
		audio_pause_sound(burn_sound);
		burn_sound_paused = true;
	}
	exit;
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

// Keys
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_space = keyboard_check_pressed(vk_space);

// Script
scr_player_update();
script_execute(state);

// Animation
if (img_index < image_number){
    img_index += img_speed ;
}else{
    img_index = 0;
}

image_index = floor(img_index);
image_speed = 0;

if (keyboard_check_pressed(ord("G"))){
	inMinecart = !inMinecart;
	minecart = instance_nearest(x, y, obj_pawn_minecart);
}

if (instance_exists(mylight)){
	mylight.x = x;
	mylight.y = y;
	mylight.light[| eLight.X] = x;
	mylight.light[| eLight.Y] = y;
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
	flashlight.light[| eLight.Y] = y + lengthdir_y(4, flashlight_direction);;
	flashlight.light[| eLight.LutIntensity] = 1.75;
	flashlight.light[| eLight.Direction] = flashlight_direction;
	flashlight.light[| eLight.Flags] |= eLightFlags.Dirty;
}