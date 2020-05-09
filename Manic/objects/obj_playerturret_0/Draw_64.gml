var ux = scr_world_to_screen_x(x);
var uy = scr_world_to_screen_y(y + 24);

if (activated_alpha < 1){
	draw_set_font(fnt_cambria_1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(1 - activated_alpha);
	scr_text(ux, uy, string(obj_controller_ui.arena_score_current) + "/" + string(scorelevel * scoreinterval), c_white);
	draw_set_alpha(1);
	draw_set_valign(fa_top);
}