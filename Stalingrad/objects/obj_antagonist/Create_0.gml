pawn = PawnType.Enemy;
blend = -1;
scale = 1.1;
destroy = false;
state = 0;
state_time = 0;
state_time_max = 0;
type = -1;

light_brightness = 0;
mylight = instance_create_layer(x, y, "Lights", obj_antagonist_light);

shoot_time = 0;
shoot_delay = 0;

run_x = x;
run_y = y;
run_time = 0;
run_away_time = 0;
run_away_direction = 0;

dash = false;
dash_time = random_range(80, 120);
dash_speed = 6;
dash_direction = 0;

weapon = -1;
weapon_has = true;
weapon_index = PawnWeapon.Machete;

weapon_change_time = 0;
weapon_change_time_max = 60 * 2;
weapon_change_origin = weapon_index;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;

burn = false;
burn_x = x;
burn_y = y;
burn_start = false;
burn_time = -1;
burn_cycle = 3;
burn_sound = noone;
burn_sound_paused = false;

poison = false;
bleed = false;
headless = false; 

throw_weapon_time = 0;
throw_weapon_time_max = 40;

barrel_pause_time = random(40);
barrel_pause_break = 0;

defense = 0;
arm = -1;

move_speed = 0;
move_speed_real = 0;
move_speed_offset = random_range(0.75, 0.9);
move_xTo = x;
move_yTo = y;

i_time = 0;
i_blend_time = 0;
flash_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_multiplier = 0;

attack_time = 40;

cutscene_prop = false;
in_cutscene = false;
active = false;

health_max = 40;
health_current = health_max;
health_alpha = 0;
health_scale = 1;

has_mask = true;

target = obj_player;

var feet = instance_create(x, y, obj_feetbox_0);
feet.owner = id;

fly[0] = noone; fly[1] = noone; fly[2] = noone;
image_xscale = scale;
image_yscale = scale;