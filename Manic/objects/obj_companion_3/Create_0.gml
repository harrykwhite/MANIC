pawn = PawnType.Companion;
blend = -1;
flash_time = 0;
wait = 0;
light_brightness = 0;
scale = 1.05;
damage = 2;
strength = 1;

mypath = path_add(); path_set_kind(mypath, 1); path_set_precision(mypath, 8)
prevpath = noone;

cutscene_break_time = 0;

compcounter_alpha = 0;

hitbox = instance_create_layer(x, y, "Hitbox", obj_player_hitbox_0);
hitbox.sprite_index = spr_dog_hitbox_0;
hitbox.owner = id;

whiteflash_alpha = 0;
whiteflash_alphadec = 0.075;
mylight = noone;

order = 0;
registered = false;

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

defense = 4;

bark_time = random_range(400, 650);
target = noone;

bite_time_max = 60 * 0.5;
bite_time = bite_time_max + random_range(-20, 5);
bite_to = false;
bite_to_time = 0;
bite_retreat = false;
bite_retreat_x = x;
bite_retreat_y = y;
bite_retreat_direction = 0;
bite_retreat_time = 0;

move_speed = 0;
move_speed_real = 0;
move_speed_offset = 1.3;
move_time = 0;
move_x_to = x;
move_y_to = y;
move_away_time = 20 + random_range(-10, 10);

i_time = 0;
i_time_alpha = 0;
i_time_flicker = false;
i_time_flicker_time = 0;
i_blend_time = 0;

knockback_speed = 0;
knockback_direction = 0;
knockback_multiplier = 1;

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

finalboss_ymin = 774;
finalboss_ymin_meeting = false;

image_xscale = scale;
image_yscale = scale;

fly[0] = noone; fly[1] = noone; fly[2] = noone;