///@param sprite
///@param alpha
///@param alpha_decline
///@param angle
///@param xscale
///@param yscale
///@param size_decline
///@param spd
///@param dir

var trail = instance_create(x, y, obj_ef_trail);
trail.sprite = argument0;
trail.alpha = argument1;
trail.alpha_decline = argument2;
trail.angle = argument3;
trail.xscale = argument4;
trail.yscale = argument5;
trail.size_decline = argument6;
trail.spd = argument7;
trail.dir = argument8;

return trail;