pawn = PawnType.Enemy;
blend = -1;
scale = random_range(1, 1.1);

mypath = path_add(); path_set_kind(mypath, 1); path_set_precision(mypath, 8)
prevpath = noone;

hitbox = instance_create_layer(x, y, "Hitbox", obj_enemy_hitbox_0);
hitbox.sprite_index = spr_dog_hitbox_0;
hitbox.owner = id;

damage = 1;
strength = 0.75;

leash_dir = 0;
leash_offset = 0;
leash_length = 0;
leash_length_offset = 0;
leash_bite = false;
leash_bite_retreat = false;

attack_time = random_range(30, 45);
attack_active_time = 45;

mylight = noone;
light_brightness = 0.25;

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
headless_x = x;
headless_y = y;
headless_image = 0;

barrel_pause_time = random(40);
barrel_pause_break = 0;

defense = 1;

bark_time = random(30);

move_speed = 0;
move_speed_real = 0;
move_speed_offset = random_range(0.75, 0.9);
move_x_to = x;
move_y_to = y;
move_away_time = 20 + random_range(-10, 10);

i_time = 0;
i_blend_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_multiplier = 1;

cutscene_prop = false;

health_max = 10;
health_current = health_max;
health_alpha = 0;
health_scale = 1;
health_flash = 0;

idleanim_time = 0;

target = obj_player;

cellx = -1;
celly = -1;
tox = -1;
toy = -1;

fly[0] = noone; fly[1] = noone; fly[2] = noone;
image_xscale = scale;
image_yscale = scale;