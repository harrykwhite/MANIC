pawn = PawnType.Enemy;
blend = -1;
scale = 1.1;
state = 0;

mypath = path_add(); path_set_kind(mypath, 1); path_set_precision(mypath, 8)
prevpath = noone;

hitbox = instance_create_layer(x, y, "Hitbox", obj_enemy_hitbox_0);
hitbox.sprite_index = spr_human_hitbox_0;
hitbox.owner = id;

light_brightness = 0;
levelobj = scr_level_get_object();
mylight = instance_create_layer(x, y, "Lights", obj_thedogkeeper_light);

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

weapon = -1;
weapon_has = false;
weapon_index = PawnWeapon.HeavyShotgun;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;

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

barrel_pause_time = random(40);
barrel_pause_break = 0;

defense = 3;
arm = -1;

dog_count = 3;
dogs_alive = 3;
dogs_downed = false;
dog[0] = instance_create(x, y, obj_thedogkeeper_dog);
dog[0].keeper = id;
dog[0].leash_length = 80;
dog[0].leash_offset = -35;

dog[1] = instance_create(x, y, obj_thedogkeeper_dog);
dog[1].keeper = id;
dog[1].leash_length = 100;
dog[1].leash_offset = 0;

dog[2] = instance_create(x, y, obj_thedogkeeper_dog);
dog[2].keeper = id;
dog[2].leash_length = 80;
dog[2].leash_offset = 35;

move_speed = 0;
move_speed_real = 0;
move_speed_offset = random_range(0.75, 0.9);
move_x_to = x;
move_y_to = y;
move_dir = 0;
move_time = 60;

i_time = 0;
i_blend_time = 0;
flash_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_multiplier = 0;

cutscene_prop = true;
in_cutscene = false;

health_max = 50;
health_current = health_max;
health_alpha = 0;
health_scale = 1;

push_speed = 0;
push_speed_build = 0.25;
push_speed_max = 3;
push_direction = 0;

target = obj_player;

mid_cutscene_played = false;

fly[0] = noone; fly[1] = noone; fly[2] = noone;
image_xscale = scale;
image_yscale = scale;