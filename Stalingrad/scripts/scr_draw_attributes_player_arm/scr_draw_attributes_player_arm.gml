var wv = wave(0.05, 0.15, 2, 0);
var player = global.player;

shader_set(sh_pawntint);
var shader_alpha = shader_get_uniform(sh_pawntint, "_alpha");
var shader_red = shader_get_uniform(sh_pawntint, "_red");
var shader_green = shader_get_uniform(sh_pawntint, "_green");
var shader_blue = shader_get_uniform(sh_pawntint, "_blue");
var r = 0, g = 0, b = 0, a = 0;

if (global.player_healthCurrent <= 2){
    a = wv;
	r = 80;
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
	a = wv;
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
	draw_self();
}

shader_reset();