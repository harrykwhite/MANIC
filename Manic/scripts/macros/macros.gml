#macro gui_scale_x (display_get_gui_width() / camera_get_view_width(view_camera[0]))
#macro gui_scale_y (display_get_gui_height() / camera_get_view_height(view_camera[0]))
#macro gamestate GameState.Developer
#macro gameversion "Beta v0.05"
#macro realtime (delta_time / 10000) / 1.6
#macro outlinewhite make_colour_rgb(0.8 * 255, 0.8 * 255, 0.8 * 255)
#macro devmode true
#macro hordespawnrate 5