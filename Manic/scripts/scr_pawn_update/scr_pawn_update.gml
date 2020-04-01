// Light brightness
if (light_brightness < 1){
	light_brightness += 0.025;
}else if (light_brightness > 1){
	light_brightness -= 0.025;
}

// Knockback
var kbs = knockback_speed * knockback_multiplier;

if (kbs > 0.1) && (!place_meeting(x + lengthdir_x(kbs + 3, knockback_direction), y + lengthdir_y(kbs + 3, knockback_direction), obj_p_solid)){
    x += lengthdir_x(kbs, knockback_direction);
    y += lengthdir_y(kbs, knockback_direction);
    
    knockback_speed *= 0.9;
}else{
    knockback_speed = 0;
}

// Invincibility
if (i_time > 0){
    i_time--;
}else{
    i_time = 0;
}

if (i_blend_time > 0){
    i_blend_time--;
}else{
    blend = -1;
}

// Lock in room
if (global.cutscene_current == -1){
	x = clamp(x, 16, room_width - 16);
	y = clamp(y, 16, room_height - 16);
}