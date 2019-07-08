/// @desc Gets the active camera
/// @returns The active camera port [X, Y, Width, Height]

if (global.worldCustomCamera == undefined){
	// Get active view camera
	var camera = view_camera[0];
	var cameraX = camera_get_view_x(camera);
	var cameraY = camera_get_view_y(camera);
	var cameraW = ceil(camera_get_view_width(camera));
	var cameraH = ceil(camera_get_view_height(camera));
	return [cameraX, cameraY, cameraW, cameraH];
}

return global.worldCustomCamera;