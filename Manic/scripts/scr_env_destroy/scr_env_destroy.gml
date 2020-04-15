///@param brksprite
var brksprite = argument0;

scr_sound_play(snd_object_box_break_0, false, 0.8, 1.2);
instance_destroy();

// Effects
scr_effect_screenshake(3);
scr_effect_freeze(15);
scr_effect_vignette_flash(c_ltgray, 0.1, 0.01);

// Particles
repeat(12)part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-6, 6), global.pt_wood_0, 1);
repeat(6)part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-6, 6), global.pt_scraps_0, 1);

// Break
var brk = instance_create(x, y, obj_break);
brk.shake = 3;
brk.sprite_index = brksprite;