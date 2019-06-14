pawn = PawnType.Companion;
blend = -1;
flash_time = 0;
wait = 0;
light_brightness = 0;
scale = random_range(0.975, 1.025);

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;
mylight = noone;

order = 0;
registered = false;

runaway_starttime = 0;
runaway_time = 0;

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

defense = 4;
target = noone;

weapon = -1;
weapon_index = PawnWeapon.Crowbar;
weapon_destroyed = false;
weapon_throw = false;
weapon_original = -1;

arm = -1;

move_speed = 0;
move_speed_real = 0;
move_speed_offset = random_range(0.75, 0.9);
move_time = 0;
move_x_to = x;
move_y_to = y;

i_time = 0;
i_time_alpha = 0;
i_time_flicker = false;
i_time_flicker_time = 0;
i_blend_time = 0;

heal_time_max = 60 * 0.75;
heal_time = heal_time_max;
heal_can = false;

knockback_speed = 0;
knockback_direction = 0;
knockback_multiplier = 1;

attack_time = 36;
attack_time_max = attack_time;

dash = false;
dashspeed = 0;
dashdirection = 0;
dashtime = 0;
dashbreak = 0;

cutscene_prop = false;
in_cutscene = false;

health_max = 6;
health_current = health_max;
health_alpha = 0;
health_scale = 1;
health_flash = 0;

var feet = instance_create(x, y, obj_feetbox_0);
feet.owner = id;

image_xscale = scale;
image_yscale = scale;

fly[0] = noone; fly[1] = noone; fly[2] = noone;