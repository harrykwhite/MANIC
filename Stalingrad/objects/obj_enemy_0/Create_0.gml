pawn = PawnType.Enemy;
blend = -1;
flash_time = 0;
wait = 0;
light_brightness = 0;
scale = random_range(0.975, 1.025);
destroy = false;
sporadic = false;
sporadic_timemax = random_range(30, 50);
sporadic_time = sporadic_timemax;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;
mylight = noone;

type = EnemyOneType.Ordinary;
typedet = false;

sniperboss_opening = true;
sniperboss_movetime = 40;
sniperboss_dash = false;
sniperboss_dashspeed = 0;
sniperboss_dashdirection = 0;
sniperboss_dashtime = 0;
sniperboss_melee = false;
sniperboss_attack_counter = 0;

sniper_shotcancel = 0;

companion_attack_time = 0;
companion_attack_time_max = 145;
companion_attack_break = 0;

burn = false;
burn_x = x;
burn_y = y;
burn_start = false;
burn_time = -1;
burn_cycle = 3;
burn_sound = noone;
burn_sound_paused = false;

poison = false;
poison_time = 0;
poison_start = false;

bleed = false;
bleed_time = 0;

headless = false; 
headless_x = x;
headless_y = y;
headless_image = 0;

healer_instance = noone;
healer_healtime = 5;
healer_healselftime = 40;
healer_findtime = 40;

crazy_runx = x;
crazy_runy = y;
crazy_runback = false;
crazy_runback_time = 0;
crazy_attackdir = 0;
crazy_attackbreak = 50;
crazy_dash = false;
crazy_dashbreak = 0;
crazy_dashspeed = 0;
crazy_dashdirection = 0;
crazy_dashtime = 0;

barrel_pause_time = random(40);
barrel_pause_break = 0;

defense = 0;

weapon = -1;
weapon_index = 0;
weapon_destroyed = false;
weapon_throw = false;
weapon_original = -1;

arm = -1;

move_speed = 0;
move_speed_real = 0;
move_speed_offset = random_range(0.95, 1.1);
move_xTo = x;
move_yTo = y;

i_time = 0;
i_blend_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_resist = 1;

attack_time = 46;
attack_time_offset = random_range(1.1, 1.4);

health_max = 6;
health_current = health_max;
health_alpha = 0;
health_scale = 1;

target = global.player;

in_cutscene = false;
cutscene_prop = false;

var feet = instance_create(x, y, obj_feetbox_0);
feet.owner = id;

livetime = 0;

fly[0] = noone; fly[1] = noone; fly[2] = noone;
image_xscale = scale;
image_yscale = scale;