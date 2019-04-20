var player = obj_player;
var drawshader = (global.player_health_current <= 2) || (player.burn) || (player.poison) || (player.whiteflash_alpha > 0);

var ucount = array_length_1d(global.upgrade_name);
if (ucount > 0){
	for(var i = 0; i < ucount; i ++){
		if (scr_player_has_upgrade(i)){
			if (i == PlayerUpgrade.IronGlove){
				draw_sprite_ext(global.upgrade_sprite[i], 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha * player.i_time_alpha);
			}
		}
	}
}

if (drawshader){
	shader_set(sh_pawntint);
	var shader_alpha = shader_get_uniform(sh_pawntint, "_alpha");
	var shader_red = shader_get_uniform(sh_pawntint, "_red");
	var shader_green = shader_get_uniform(sh_pawntint, "_green");
	var shader_blue = shader_get_uniform(sh_pawntint, "_blue");
	var r = 0, g = 0, b = 0, a = 0;
	var wv = wave(0.05, 0.1, 2, 0);

	if (global.player_health_current <= 2){
	    a = wv * 0.5;
		r = 255;
		g = 0;
		b = 0;
	}

	if (player.burn){
		a = wv;
		r = 255;
		g = 255;
		b = 255;
	}

	if (player.poison){
		a = wv * 0.7;
		r = 255;
		g = 255;
		b = 255;
	}

	if (player.whiteflash_alpha > 0){
		a = player.whiteflash_alpha;
		r = 255;
		g = 255;
		b = 255;
	}

	if (r > 0) || (g > 0) || (b > 0) || (a > 0){
		shader_set_uniform_f(shader_alpha, a);
		shader_set_uniform_f(shader_red, r);
		shader_set_uniform_f(shader_green, g);
		shader_set_uniform_f(shader_blue, b);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * player.i_time_alpha);
	}

	shader_reset();
}