///@param change
var change = argument0 / 2;

change *= global.game_option[| Options.QuickZoom] / 100;

with(obj_controller_camera){
	camera_zoom_add += change;
	camera_zoom_add = clamp(camera_zoom_add, -0.3, 0.3);
	
	camera_zoom = camera_zoom + camera_zoom_add;
}