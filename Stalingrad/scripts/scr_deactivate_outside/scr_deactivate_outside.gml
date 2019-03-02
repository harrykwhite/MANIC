var wrange = 70;
var hrange = 70;

instance_deactivate_layer("Main");
instance_deactivate_layer("InteriorFadeObjects");
instance_activate_region(camera_get_view_x(view_camera[0]) - wrange, camera_get_view_y(view_camera[0]) - hrange, camera_get_view_width(view_camera[0]) + (2 * wrange), camera_get_view_height(view_camera[0]) + (2 * hrange), true);