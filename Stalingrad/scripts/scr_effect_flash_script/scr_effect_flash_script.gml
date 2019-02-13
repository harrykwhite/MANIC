/// @param increase_speed
/// @param  decrease_speed
/// @param  colour
/// @param  script
var increase = argument0;
var decrease = argument1;
var colour = argument2;
var script = argument3;

f = instance_create(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2, camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2, obj_ef_flash);
f.increase_speed = increase;
f.decrease_speed = decrease;
f.colour = colour;
f.script = script;
f.fade = false;
f.alpha = 0;
