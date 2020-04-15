var ux = scr_world_to_screen_x(x);
var uy = scr_world_to_screen_y(y);

draw_set_font(fnt_cambria_2);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(ux, uy, scorecurrent, scale, scale, 0);
draw_set_valign(fa_top);