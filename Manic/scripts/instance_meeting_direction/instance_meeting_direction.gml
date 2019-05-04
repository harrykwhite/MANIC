/// @description instance_meeting_direction(x, y, dir, object);
/// @function instance_meeting_direction
/// @param x
/// @param  y
/// @param  dir
/// @param  object

/*
    DESCRIPTION:
    This function will cast a line from a point in a given dir, if it meets the object specified it will return the id of the object.
    If the line reaches outsselfe of the boundaries of the room it will cancel out, and return 0. A good use for this function
    is to create hitscan weapons. Where as, instead of firing out a projectile, it will detect if an enemy object is within the range
    of the weapon. If so, the enemy can be damaged.
*/

var _x = argument0;
var _y = argument1;
var _direction = argument2;
var _obj = argument3;

var realX = _x;
var realY = _y;
var r = 0;

while(!place_meeting(realX, realY, _obj)) && (inroom(realX, realY)){
    realX += lengthdir_x(1, _direction);
    realY += lengthdir_y(1, _direction);
}

r = instance_place(realX, realY, _obj);

if (r == noone){
    return 0;
}else{
    return r;
}
