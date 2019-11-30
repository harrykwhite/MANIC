if (indicate_text_alpha > 0){
    if (indicate_text_time > 0){
        indicate_text_time--;
    } else {
        indicate_text_alpha -= 0.05;
    }

    draw_set_alpha(indicate_text_alpha);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_cambria_0);
    scr_text((display_get_gui_width() / 2), display_get_gui_height() - 30, indicate_text, c_white);
    draw_set_alpha(1);
} else {
    indicate_text = "";
    indicate_text_alpha = 0;
    indicate_text_time = 0;
}

draw_set_valign(fa_top);