image_speed = 1;
image_index = 0;

mylight = instance_create_layer(x, y - 2, "Lights", obj_torch_wall_0_light);
mylight.Light_Type = "Point Light";
burn_sound = noone;