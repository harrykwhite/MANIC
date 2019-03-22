pawn = PawnType.Enemy;
blend = -1;
scale = random_range(1, 1.1);
destroy = false;

damage = 1;
strength = 1;

shoot_time = 10;
shoot_buildup_time = 120;
shoot_burst_count = 0;
shoot_in_burst = false;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;
mylight = instance_create(x, y, obj_enemy_3_light);
flash_time = 0;
light_brightness = 0;

burn = false;
burn_x = x;
burn_y = y;
burn_start = false;
burn_time = -1;
burn_cycle = 3;
burn_sound = noone;
burn_sound_paused = false;

poison = false;
headless = false;
bleed = false;

defense = 0;

i_time = 0;
i_blend_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_resist = 0.4;

cutscene_prop = false;
in_cutscene = false;

health_max = 12;
health_current = health_max;
health_alpha = 0;
health_scale = 1;

target = obj_player;

var feet = instance_create(x, y, obj_feetbox_0);
feet.owner = id;

fly[0] = noone; fly[1] = noone; fly[2] = noone;
image_xscale = scale;
image_yscale = scale;