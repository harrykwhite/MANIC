///@param wradius
///@param hradius
///@param xx
///@param yy
///@param alpha
var wradius = argument[0];
var hradius = argument[1];

var px = x;
var py = y;

var alpha = 1;
var draw = true;

switch(argument_count){
	case 3:
		px = argument[2];
		break;
	
	case 4:
		px = argument[2];
		py = argument[3];
		break;
	
	case 5:
		px = argument[2];
		py = argument[3];
		alpha = argument[4];
		break;
}

gpu_set_fog(true, c_white, 0, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 0.125 * alpha);
gpu_set_fog(false, c_black, 0, 0);

if (global.game_pause){
	exit;
}

if (wradius < 7) && (hradius < 7){
	if (random(5) < 1){
		part_particles_create(global.ps_front, px + random_range(-wradius, wradius), py + random_range(-hradius, hradius), global.pt_fire_0, 1);
	}

	if (random(7) < 1){
		part_particles_create(global.ps_front, px + random_range(-wradius, wradius), py + random_range(-hradius, hradius), global.pt_fire_2, 1);
	}
}else{
	if (random(3) < 1){
		part_particles_create(global.ps_front, px + random_range(-wradius, wradius), py + random_range(-hradius, hradius), global.pt_fire_0, 1);
	}

	if (random(5) < 1){
		part_particles_create(global.ps_front, px + random_range(-wradius, wradius), py + random_range(-hradius, hradius), global.pt_fire_2, 1);
	}
}