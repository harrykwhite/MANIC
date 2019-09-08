pathgrid_cell_width = 6;
pathgrid_cell_height = 6;

pathgrid_width_max = room_width div pathgrid_cell_width;
pathgrid_height_max = room_height div pathgrid_cell_height;

pathgrid = mp_grid_create(0, 0, pathgrid_width_max, pathgrid_height_max, pathgrid_cell_width, pathgrid_cell_height);
mp_grid_add_instances(pathgrid, obj_p_solid, false);