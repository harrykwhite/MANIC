pawn = PawnType.Enemy;
blend = -1;
scale = 1;
destroy = false;
state = 0;
active = false;

attack = 0;
attack_time = 0;
attack_time_max = 1;

shoot_time = 120;
shoot_burst = 0;
shoot_dir = 0;
shoot_buildup_time = 0;

flamethrower_angle = 0;
flamethrower_angle_wait = 80;
flamethrower_time = 30;
flamethrower_angle_sign = 1;

for(var i = 0; i < 4; i ++){
	var dir = (90 * i) + 45;
	flamethrower[i] = instance_create(x + lengthdir_x(60, dir), y + lengthdir_y(60, dir), obj_giantturret_flamethrower);
	flamethrower[i].turret = id;
	flamethrower[i].shoot_dir = dir + 45;
}
light_brightness = 0;
mylight = instance_create(x, y, obj_giantturret_light);

burn = false;
burn_sound = noone;
poison = false;
bleed = false;
headless = false;

defense = 0;

i_time = 0;
i_blend_time = 0;
flash_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_resist = 0;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;

cutscene_prop = false;
in_cutscene = false;

health_max = 100;
health_current = health_max;
health_alpha = 0;
health_scale = 1;

target = global.player;

fly[0] = noone; fly[1] = noone; fly[2] = noone;
image_xscale = scale;
image_yscale = scale;