pawn = PawnType.Companion;
blend = -1;
flash_time = 0;
wait = 0;
light_brightness = 0;
scale = 1.05;
damage = 2;
strength = 1;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;
mylight = instance_create(x, y, obj_companion_light);

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

bite_time = (60 * 1.25) + random_range(-20, 5);
bite_to = false;
bite_retreat = false;
bite_retreat_x = x;
bite_retreat_y = y;
bite_retreat_direction = 0;

move_speed = 0;
move_speed_real = 0;
move_speed_offset = 1;
move_time = 0;
move_xTo = x;
move_yTo = y;

i_time = 0;
i_blendTime = 0;

heal_time_max = 60 * 1.35;
heal_time = heal_time_max;
heal_self_time_max = 60 * 0.9;
heal_self_time = heal_self_time_max;

knockback_speed = 0;
knockback_direction = 0;
knockback_resist = 1;

attack_time = 62;
attack_time_max = attack_time;
attack_time_offset = 1;
attack_time *= attack_time_offset;

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

var feet = instance_create(x, y, obj_feetbox_0);
feet.owner = id;

livetime = 0;

image_xscale = scale;
image_yscale = scale;