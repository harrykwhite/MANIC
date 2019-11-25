pawn = PawnType.Enemy;
blend = -1;
scale = 1.1;
state = 0;
state_time = 0;
state_time_max = 0;
type = -1;

mypath = path_add(); path_set_kind(mypath, 1); path_set_precision(mypath, 8)
prevpath = noone;

hitbox = instance_create_layer(x, y, "Hitbox", obj_enemy_hitbox_0);
hitbox.sprite_index = spr_human_hitbox_0;
hitbox.owner = id;

light_brightness = 0;
mylight = instance_create_layer(x, y, "Lights", obj_antagonist_light);

shoot_time = 0;
shoot_delay = 0;

walk_off = false;

run_x = x;
run_y = y;
run_time = 0;
run_away_time = 0;
run_away_direction = 0;
run_away_complete = false;

dash = false;
dash_time = random_range(80, 120);
dash_speed = 6;
dash_direction = 0;

weapon = -1;
weapon_has = true;
weapon_index = (room == rm_level_10_01 ? PawnWeapon.Greatsword : PawnWeapon.Sledgehammer);

weapon_change_time = 0;
weapon_change_time_max = 60 * 2;
weapon_change_origin = weapon_index;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;

greatsword_attack = false;
greatsword_attack_killed = false;

burn = false;
burn_x = x;
burn_y = y;
burn_start = false;
burn_time = -1;
burn_cycle = 3;
burn_sound = noone;

poison = false;
poison_time = 0;
poison_start = false;

bleed = false;
bleed_time = 0;
bleed_cycle = 3;

headless = false; 

throw_weapon_time = 0;
throw_weapon_time_max = 60;
throw_weapon_direction = 0;
throw_weapon_direction_set = false;

barrel_pause_time = random(40);
barrel_pause_break = 0;

defense = 1;
arm = -1;

move_speed = 0;
move_speed_real = 0;
move_speed_offset = random_range(0.75, 0.9);
move_x_to = x;
move_y_to = y;

i_time = 0;
i_blend_time = 0;
flash_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_multiplier = 0;

attack_time = 70;

cutscene_prop = false;
in_cutscene = false;
active = false;

health_max = 85;

health_current = health_max;
health_alpha = 0;
health_scale = 1;

has_mask = true;

target = obj_player;

fly[0] = noone; fly[1] = noone; fly[2] = noone;
image_xscale = scale;
image_yscale = scale;