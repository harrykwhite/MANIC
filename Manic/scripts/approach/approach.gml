/// @param from
/// @param  to
/// @param  spd_percentage
var from = argument0;
var to = argument1;
var spd = clamp((argument2 / 100) , 0, 1);

from += ((to - from) * spd);

return from;