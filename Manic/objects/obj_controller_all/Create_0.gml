global.game_option = 0;
camera_resize_w = 0;
camera_resize_h = 0;
camera_resize_time = -1;

gui_resize_w = 0;
gui_resize_h = 0;
gui_resize_time = -1;

app_surf_refresh_time = -1;
app_surf_refresh_w = 0;
app_surf_refresh_h = 0;

center_window_time = -1;

scr_part_setup();
scr_options_init();
scr_options_refresh(true);
scr_update_real_volumes();

gamepad_check_disconnected_time = 0;

camera_get_x1 = camera_get_view_x(view_camera[0]);
camera_get_y1 = camera_get_view_y(view_camera[0]);
camera_get_x2 = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
camera_get_y2 = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);

ds_depth_grid_height = 1200;
ds_depth_grid = ds_grid_create(2, ds_depth_grid_height);
ds_depth_counter = 0;

full = 0;
full_autoswitch = false;
part = 0;

option_refresh = false;

debug = false;
sprite_index = noone;