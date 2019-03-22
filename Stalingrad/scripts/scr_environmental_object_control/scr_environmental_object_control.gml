///@param wrange
///@param hrange
///@param destroyType
var wrange = argument0;
var hrange = argument1;
var destroyType = argument2;

if (durability <= 0){
		death = true;
	}if (durability <= 0){
		death = true;
	}

if (durability_time > 0){
	durability_time--;
}

if (collision_rectangle(xstart - wrange - 8, ystart - hrange - 8, xstart + wrange + 8, ystart + hrange + 8, obj_player, false, true)){
	shake = 0;
	x = xstart;
	y = ystart;
}

x = xstart + random_range(-shake, shake);
y = ystart + random_range(-shake, shake);
shake *= 0.9;