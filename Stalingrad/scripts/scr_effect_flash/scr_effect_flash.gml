/// @function scr_effect_flash
/// @param increase_speed
/// @param  decrease_speed
/// @param  colour
var increase = argument[0];
var decrease = argument[1];
var colour = argument[2];
var fade = false;

if (argument_count > 3){
	fade = argument[3];
}

f = instance_create(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2, camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2, obj_ef_flash);
f.increase_speed = increase;
f.decrease_speed = decrease;
f.colour = colour;
f.script = -1;
f.fade = fade;
f.alpha = increase;