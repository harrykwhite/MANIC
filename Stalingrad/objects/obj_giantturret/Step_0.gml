if (light_brightness < 1){
	light_brightness += 0.05;
}

if (global.cutscene_current == 40) && (obj_controller_gameplay.cutscene_look_object == id){
	active = true;
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = max((1.55 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (!active){
	ispaused = true;
}

if (ispaused){
	image_speed = 0;
	exit;
}

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

scr_pawn_status_handler();

switch(state){
	case 0:
		scr_giantturret_behaviour_0();
		break;
}

scr_pawn_update();
image_yscale = scale;