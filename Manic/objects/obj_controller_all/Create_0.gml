global.game_option = 0;
scr_part_setup();
scr_option_init();
scr_options_refresh(true);
scr_update_real_volumes();

key_right = global.game_option[| Options.Input_MoveRight];
key_left = global.game_option[| Options.Input_MoveLeft];
key_up = global.game_option[| Options.Input_MoveUp];
key_down = global.game_option[| Options.Input_MoveDown];
key_dash = global.game_option[| Options.Input_Dash];
key_interact = global.game_option[| Options.Input_Interact];
key_attack = global.game_option[| Options.Input_Attack];
key_throw = global.game_option[| Options.Input_Throw];

app_surf_refresh_time = -1;
app_surf_refresh_w = 0;
app_surf_refresh_h = 0;

ds_depth_grid_height = 1200;
ds_depth_grid = ds_grid_create(2, ds_depth_grid_height);
ds_depth_counter = 0;

full = 0;
full_autoswitch = false;
part = 0;
center_window_time = -1;

option_refresh = false;

debug = false;
sprite_index = noone;

scr_display_update();