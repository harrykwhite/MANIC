///@param wradius
///@param hradius
///@param part_x
///@param part_y
///@param sprite
///@param index
///@param xscale
///@param yscale
///@param angle
///@param alpha
///@param x
///@param y
///@param 
var wradius = argument[0];
var hradius = argument[1];

var px = argument[2];
var py = argument[3];

var sprite = argument[4];
var index = argument[5];

var xscale = argument[6];
var yscale = argument[7];

var angle = argument[8];
var alpha = argument[9];

var xx = x;
var yy = y;
var rate = 1;

if (argument_count > 10){
	xx = argument[10];
	yy = argument[11];
	rate = argument[12];
}

if (!scr_ceiling_at(x, y)){
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite, index, xx, yy, xscale, yscale, angle, c_white, 0.15 * alpha);
	gpu_set_fog(false, c_black, 0, 0);

	repeat(rate){
		part_particles_create(global.ps_front, px + random_range(-wradius, wradius), py + random_range(-hradius, hradius), global.pt_fire_0, 1);
	}
}