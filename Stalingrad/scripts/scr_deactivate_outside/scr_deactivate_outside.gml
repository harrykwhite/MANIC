var wrange = 70;
var hrange = 70;
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var camw = camera_get_view_width(view_camera[0]);
var camh = camera_get_view_height(view_camera[0]);

instance_deactivate_layer("Main");
//instance_deactivate_layer("InteriorFadeObjects");
instance_activate_region(camx - wrange, camy - hrange, camw + (2 * wrange), camh + (2 * hrange), true);
instance_activate_object(obj_player);