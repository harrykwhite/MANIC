if (light_brightness < 1){
	light_brightness += 0.05;
}else if (light_brightness > 1){
	light_brightness -= 0.05;
}

if (global.cutscene_current == 55) && (in_cutscene){
	active = true;
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = max((1.55 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

obj_controller_ui.bosshealth_value_current = health_current;
obj_controller_ui.bosshealth_value_max = health_max;

var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (!active){
	ispaused = true;
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale;
		image_yscale = scale;
	}
	
	image_speed = 0;
	return;
}

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

poison = false;
bleed = false;
headless = false;

scr_pawn_status_handler();

var sprev = state;

state = 0; sprite_index = spr_giantturret_idle_0;
if (health_current <= health_max * 0.75) { state = 1; sprite_index = spr_giantturret_idle_1; }
if (health_current <= health_max * 0.5)  { state = 2; sprite_index = spr_giantturret_idle_2; }
if (health_current <= health_max * 0.25) { state = 2; sprite_index = spr_giantturret_idle_3; }

if (state != sprev){
	shoot_time = 120;
	shoot_burst = 0;
	shoot_buildup_time = 0;
	flamethrower_angle = 0;
	flamethrower_angle_wait = 80;
	flamethrower_time = 30;
	attack_time = 0;
	attack = 0;
	
	for(var i = 0; i < 4; i ++){
		if (instance_exists(flamethrower[i])){
			flamethrower[i].shoot = false;
		}
	}
}

switch(state){
	case 0:
		scr_giantturret_behaviour_0();
		break;
	
	case 1:
		scr_giantturret_behaviour_1();
		break;
	
	case 2:
		scr_giantturret_behaviour_2();
		break;
}

scr_pawn_update();
image_yscale = scale;