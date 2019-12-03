pawn = PawnType.Enemy;
blend = -1;
scale = 1;
state = 0;
active = false;

scale = 1.15;

hitbox = instance_create_layer(x, y, "Hitbox", obj_enemy_hitbox_0);
hitbox.sprite_index = spr_giantturret_hitbox_0;
hitbox.owner = id;

attack = 0;
attack_time = 0;
attack_time_max = 1;

line_flicker = false;
line_flicker_time = 5;

shoot_time = 120;
shoot_burst = 0;
shoot_dir = 0;
shoot_buildup_time = 0;

flamethrower_angle = 0;
flamethrower_angle_wait = 80;
flamethrower_time = 30;
flamethrower_angle_sign = 1;

for(var i = 0; i < 4; i ++){
	var dir = (360 / 4) * i;
	dir += 45;
	
	flamethrower[i] = instance_create(x + lengthdir_x(80 * scale, dir), y + lengthdir_y(80 * scale, dir), obj_giantturret_flamethrower);
	flamethrower[i].turret = id;
	flamethrower[i].shoot_dir = dir + 45;
}

light_brightness = 0;
mylight = instance_create_layer(x, y, "Lights", obj_giantturret_light);

burn = false;
burn_x = x;
burn_y = y;
burn_start = false;
burn_time = -1;
burn_cycle = 3;
burn_sound = noone;

poison = false;
bleed = false;
headless = false;

defense = 1;

i_time = 0;
i_blend_time = 0;
flash_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_multiplier = 0;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;

cutscene_prop = false;
in_cutscene = false;

health_max = 110;
health_current = health_max;
health_alpha = 0;
health_scale = 1;

target = obj_player;

fly[0] = noone; fly[1] = noone; fly[2] = noone;

image_xscale = scale;
image_yscale = scale;