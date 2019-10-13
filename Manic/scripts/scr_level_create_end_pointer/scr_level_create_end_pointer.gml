///@param angle
var angle = argument0;

var arrow = instance_create(clamp(x + (sprite_width / 2), 40, room_width - 40), clamp(y + (sprite_height / 2), 40, room_height - 40), obj_section_end_pointer);
arrow.image_angle = angle;