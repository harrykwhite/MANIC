if (type != obj_companion_0 || image_index < image_number - 2){
	return;
}

var xx = scr_world_to_screen_x(x + (16 * image_xscale));
var yy = scr_world_to_screen_y(y + 29);
var w = 52;
var h = 3;

if (deathbar_alpha < 1){
	deathbar_alpha += 0.1;
}

draw_set_alpha(deathbar_alpha);
draw_healthbar(xx - (w / 2), yy - (h / 2), xx + (w / 2), yy + (h / 2), 100 * (1 - (global.companion_death_time / global.companion_death_time_max)), make_colour_rgb(38, 38, 38), c_ltgray, c_ltgray, 0, true, false);
draw_set_alpha(1);