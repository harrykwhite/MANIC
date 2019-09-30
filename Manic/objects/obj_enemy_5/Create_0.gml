pawn = PawnType.Enemy;
blend = -1;
scale = random_range(1, 1.1);
destroy = false;

mypath = path_add(); path_set_kind(mypath, 1); path_set_precision(mypath, 8)
prevpath = noone;

offscreen_timer = 0;

hitbox = instance_create_layer(x, y, "Hitbox", obj_enemy_hitbox_0);
hitbox.sprite_index = spr_deer_hitbox_0;
hitbox.owner = id;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;
mylight = noone;

wander = false;
wander_stage = 0;
wander_stage_max = 0;
wander_x_to = x;
wander_y_to = y;
wander_break = random_range(30, 60);
wander_time = 0;

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

headless = false;

defense = 0;

move_speed = 0;
move_speed_real = 0;
move_speed_offset = random_range(1.2, 1.4);
move_x_to = x;
move_y_to = y;

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