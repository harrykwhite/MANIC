pawn = PawnType.Enemy;
blend = -1;
scale = 1.1;
destroy = false;
state = 0;
mid_cutscene_played = false;

mypath = path_add(); path_set_kind(mypath, 1); path_set_precision(mypath, 8)
prevpath = noone;

hitbox = instance_create_layer(x, y, "Hitbox", obj_enemy_hitbox_0);
hitbox.sprite_index = spr_human_hitbox_0;
hitbox.owner = id;

light_brightness = 0;
mylight = instance_create_layer(x, y, "Lights", obj_thescorched_light);

arena_x = 0;
arena_y = 0;
arena_width = 0;
arena_height = 0;

run_x = x;
run_y = y;
run_count = 0;

release_count = 0;
release_time = 45;
release_offset = 0;

shoot_time = 0;
shoot_delay = 0;

weapon = -1;
weapon_has = false;
weapon_index = 0;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;

burn = true;
burn_x = x;
burn_y = y;
burn_start = false;
burn_time = -1;
burn_cycle = 3;
burn_sound = noone;

poison = false;
bleed = false;
headless = false; 

barrel_pause_time = random(40);
barrel_pause_break = 0;

defense = 2;
arm = -1;

slowfire_time = 0;

move_speed = 0;
move_speed_real = 0;
move_speed_offset = random_range(0.75, 0.9);
move_x_to = x;
move_y_to = y;
move_away_time = 20 + random_range(-10, 10);

i_time = 0;
i_blend_time = 0;
flash_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_multiplier = 0;

cutscene_prop = true;
in_cutscene = false;

health_max = 95;
health_current = health_max;
health_alpha = 0;
health_scale = 1;

target = obj_player;

var feet = instance_create(x, y, obj_feetbox_0);
feet.owner = id;

fly[0] = noone; fly[1] = noone; fly[2] = noone;
image_xscale = scale;
image_yscale = scale;