map_tile_width = 8;
map_tile_height = 8;
map_width = room_width div map_tile_width;
map_height = room_height div map_tile_height;
map_found_refresh_time_max = 10;
map_found_refresh_time = map_found_refresh_time_max;
scr_map_clear();
scr_map_found_clear();
scr_map_fill();