map_tile_width = 8;
map_tile_height = 8;
map_width = room_width div map_tile_width;
map_height = room_height div map_tile_height;

map_refresh = 2;

scr_map_clear();
scr_map_fill();

scr_level_add_bounds();