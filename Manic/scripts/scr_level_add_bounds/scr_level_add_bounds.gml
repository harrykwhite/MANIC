var sol_scale = 2;

var sol = instance_create(-16 * sol_scale, 0, obj_block_solid);
sol.image_xscale = sol_scale;
sol.image_yscale = room_height div (16 / sol_scale);
sol.boundary = true;

sol = instance_create(room_width, 0, obj_block_solid);
sol.image_xscale = sol_scale;
sol.image_yscale = room_height div (16 / sol_scale);
sol.boundary = true;

sol = instance_create(0, -16 * sol_scale, obj_block_solid);
sol.image_xscale = room_width div (16 / sol_scale);
sol.image_yscale = sol_scale;
sol.boundary = true;

sol = instance_create(0, room_height, obj_block_solid);
sol.image_xscale = room_width div (16 / sol_scale);
sol.image_yscale = sol_scale;
sol.boundary = true;