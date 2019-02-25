state = scr_player_move;
scr_player_setup();

img_index = 0;
img_speed = 0;

hspd = 0;
vspd = 0;

mylight = instance_create(x, y, obj_player_light);
flashlight = instance_create(x, y, obj_player_flashlight);
light_brightness = 0;

image_speed = 0;
image_index = 0;