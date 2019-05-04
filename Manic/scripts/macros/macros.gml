#macro gui_scale_x (display_get_gui_width() / camera_get_view_width(view_camera[0]))
#macro gui_scale_y (display_get_gui_height() / camera_get_view_height(view_camera[0]))
#macro gamestate GameState.Developer
#macro realtime (delta_time / 10000) / 1.6