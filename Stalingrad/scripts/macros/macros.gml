#macro FULLSCREEN_WIDTH display_get_width()
#macro FULLSCREEN_HEIGHT display_get_height()
#macro WINDOW_WIDTH display_get_width() / 2
#macro WINDOW_HEIGHT display_get_height() / 2
#macro GUI_POS_X (display_get_gui_width() / camera_get_view_width(view_camera[0]))
#macro GUI_POS_Y (display_get_gui_height() / camera_get_view_height(view_camera[0]))
#macro STATE GameState.Developer