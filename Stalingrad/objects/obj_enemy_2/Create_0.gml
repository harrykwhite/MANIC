pawn = PawnType.Enemy;
blend = -1;
scale = random_range(1, 1.1);
destroy = false;

damage = 1;
strength = 1;

bite_time = (60 * 1.25) + random_range(-20, 5);
bite_to = false;
bite_retreat = false;
bite_retreat_x = x;
bite_retreat_y = y;
bite_retreat_direction = 0;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;
mylight = noone;

companion_attack_time = 0;
companion_attack_time_max = 145;
companion_attack_break = 0;

burn = false;
burn_x = x;
burn_y = y;
burn_start = false;
burn_time = -1;
burn_cycle = 3;
burn_sound = noone;
burn_sound_paused = false;

poison = false;
poison_time = 0;
poison_start = false;

bleed = false;
bleed_time = 0;

headless = false; 
headless_x = x;
headless_y = y;
headless_image = 0;

barrel_pause_time = random(40);
barrel_pause_break = 0;

defense = 0;

bark_time = random(30);

move_speed = 0;
move_speed_real = 0;
move_speed_offset = random_range(1.2, 1.4);
move_xTo = x;
move_yTo = y;
move_away_time = 20 + random_range(-10, 10);

i_time = 0;
i_blend_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_multiplier = 1;

cutscene_prop = false;
in_cutscene = false;

health_max = 4;
health_current = health_max;
health_alpha = 0;
health_scale = 1;
health_flash = 0;

target = obj_player;

var feet = instance_create(x, y, obj_feetbox_0);
feet.owner = id;

fly[0] = noone; fly[1] = noone; fly[2] = noone;
image_xscale = scale;
image_yscale = scale;

if (global.level_current >= LevelIndex.HumanPrison){
	knockback_multiplier *= 0.95;
}

if (global.level_current >= LevelIndex.TheCemetery){
	knockback_multiplier *= 0.9;
}

if (global.level_current >= LevelIndex.IntoTheCity){
	knockback_multiplier *= 0.85;
}