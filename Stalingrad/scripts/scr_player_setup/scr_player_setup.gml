// Movement
spd_build = 0.32;
spd_max = 1.6;
spd_offset = 1;
spd_offset_change = 0.05;
move_time = 0;
move_back = false;
flash_time = 0;
xaxis = 0;
yaxis = 0;
len = 0;
dir = 0;

// Light
flashlight_move = false;
flashlight_direction = 0;
flashlight_alpha = 0;

// White Flash
whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;

// Externally Controlled Movement
move_xTo = -1;
move_yTo = -1;
move_extSpd = -1;

// Dash
dash_length = 0;
dash_length_current = 0;
dash_speed = 0;
dash_direction = 0;
dash_time = 30;

// Footstep
footstep_sound = -1;
footstep_time = 0;
footstep_flip = 1;

// Health
if (room == rm_level_1_00) || (room == rm_level_2_00) || (room == rm_level_3_00) || (room == rm_level_4_00) || (room == rm_level_5_00) || (room == rm_level_6_00) || (room == rm_level_7_00) || (room == rm_level_8_00) || (room == rm_level_9_00){
	global.player_healthMax = 6;
	global.player_healthCurrent = global.player_healthMax;
}

health_alpha = 0;
health_scale = 1;

// Stamina
global.player_staminaMax = 100;
global.player_staminaCurrent = global.player_staminaMax;
global.player_staminaBreak = 0;
global.player_stamina_active = false;

// Weapon
global.player_weapon = 0;

// Knockback
knockback = false;
knockback_speed = 0;
knockback_direction = 0;

// Burn
burn = false;
burn_time = -1;
burn_cycle_amount = 0;
burn_sound = noone;
burn_sound_paused = false;

// Poison
poison = false;
poison_time = -1;
poison_cycle_amount = 0;

// Blend and Invincibility
i_blendTime = 0;
i_time = 0;

// Colliders
var feet = instance_create(x, y, obj_feetbox_0);
feet.owner = id;

// Fly
fly[0] = noone; fly[1] = noone; fly[2] = noone;

// Other
isVisible = true;