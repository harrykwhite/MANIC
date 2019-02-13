/// @param amount
var amount = argument0;

if (instance_exists(obj_controller_camera)){
    if (!onscreen(x, y)){
		exit;
    }
    obj_controller_camera.camera_screenshake = true;
    obj_controller_camera.camera_screenshake_amount = amount;
}
