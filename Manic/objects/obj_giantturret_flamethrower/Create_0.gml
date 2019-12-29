pawn = PawnType.Enemy;
blend = -1;
scale = random_range(1, 1.1);

hitbox = instance_create_layer(x, y, "Hitbox", obj_enemy_hitbox_0);
hitbox.sprite_index = spr_giantturret_flamethrower_hitbox_0;
hitbox.owner = id;

shoot = false;
shoot_dir = 0;
turret = noone;

flash_time = 0;
mylight = noone;

burn = false;
burn_x = x;
burn_y = y;
burn_start = false;
burn_time = -1;
burn_cycle = 3;
burn_sound = noone;

poison = false;
headless = false;
bleed = false;

defense = 0;

i_time = 0;
i_blend_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_multiplier = 0;

cutscene_prop = false;
in_cutscene = false;

health_max = 25;
health_current = health_max;
health_alpha = 0;
health_scale = 1;
health_flash = 0;

target = obj_player;

fly[0] = noone; fly[1] = noone; fly[2] = noone;
image_xscale = scale;
image_yscale = scale;