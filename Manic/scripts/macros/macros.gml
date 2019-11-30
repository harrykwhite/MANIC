#macro gui_scale_x (display_get_gui_width() / camera_get_view_width(view_camera[0]))
#macro gui_scale_y (display_get_gui_height() / camera_get_view_height(view_camera[0]))
#macro gameversion "v1.0.4"
#macro realtime (delta_time / 10000) / 1.6
#macro outlinewhite make_colour_rgb(0.8 * 255, 0.8 * 255, 0.8 * 255)
#macro outlineweapondrop make_colour_rgb(145, 191, 103)
#macro outlinecollectable make_colour_rgb(212, 140, 255)
#macro outlineupgrade make_colour_rgb(255, 120, 104)
#macro outlinecompanion make_colour_rgb(203, 163, 55)
#macro outlinehealth make_colour_rgb(225, 145, 78)
#macro outlineexplosive make_colour_rgb(198, 55, 16)
#macro devmode false
#macro isteaser false
#macro hordespawnrate 2
#macro basewidth 720
#macro baseheight 405
#macro macbuild false