draw_set_colour(colour);
draw_set_alpha(alpha * (global.game_option[| Options.Flashing] / 100));
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);