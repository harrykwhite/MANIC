image_speed = 0;
image_index = random(image_number);
depth = layer_get_depth("Main") + 1;

time = 0;
shake = 0;
bend = false;

render_time = 0;
render_time_max = 5;