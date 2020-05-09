///@param size
///@param damage
///@param enemy
///@param player
///@param companion
var size = argument0;
var dmg = argument1;
var enemy = argument2;
var player = argument3;
var comp = argument4;

repeat(9){
	part_particles_create(global.ps_front, x + random_range(-size * 0.5, size * 0.5), y + random_range(-size * 0.5, size * 0.5), global.pt_smoke_2, 1);
}

repeat(2){
	part_particles_create(global.ps_front, x + random_range(-size, size), y + random_range(-size, size), global.pt_smoke_2, 1);
}

repeat(7){
	part_particles_create(global.ps_bottom, x + random_range(-size * 0.1, size * 0.1), y + random_range(-size * 0.1, size * 0.1), global.pt_ash_0_perm, 1);
}

part_particles_create(global.ps_front, x, y, global.pt_fire_1, 17);

var fl = instance_create(x, y, obj_block_light);
fl.mylight[0] = noone; fl.size[0] = size * 1.25;
fl.fade_speed = 0.015;

scr_damage_custom(dmg, 1, size, size, 3, enemy, player, comp, true);
scr_effect_screenshake(4);
scr_effect_freeze(9);
scr_effect_zoom(-0.1);
scr_effect_vignette_flash(c_ltgray, 0.6, 0.01);
scr_sound_play(snd_weapon_explode_0, false, 0.8, 1.2);