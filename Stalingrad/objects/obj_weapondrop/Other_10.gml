draw_self();

var yy = wave(-1, -3, 1, 0);
var alpha_glow = wave(0, 0.2, 2.5, 0);
animation += animation_speed;

gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite, animation, x, y, scale, scale, angle, c_white, alpha * 0.175);
gpu_set_fog(false, c_black, 0, 0);

draw_sprite_ext(sprite, animation, x, y + yy, scale, scale, angle, c_white, 1);
mask_index = spr_mask_0;

if (ammo == 0) && (global.weapon_type[index] == WeaponType.Ranged){
    gpu_set_fog(true, c_red, 0, 0);
    draw_sprite_ext(sprite, animation, x, y + yy, scale, scale, angle, c_white, alpha_glow);
    gpu_set_fog(false, c_black, 0, 0);
    draw_set_alpha(1);
}