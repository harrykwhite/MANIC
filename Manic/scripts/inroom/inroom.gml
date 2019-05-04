/// @param  x
/// @param  y
var xx = argument0;
var yy = argument1;
var r = false;

if ((xx <= room_width) && (xx >= 0)) && ((yy >= 0) && (yy <= room_height)){
    r = true;
}else{
    r = false;
}

return r;