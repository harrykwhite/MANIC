///@param  damage
///@param  strength
///@param  width
///@param  height
///@param  time
///@param  damage_enemy
///@param  damage_player
///@param  damage_companion
///@param  burn
var damage = argument0;
var strength = argument1;

var width = argument2;
var height = argument3;

var time = argument4;

var damage_enemy = argument5;
var damage_player = argument6;
var damage_companion = argument7;

var burn = argument8;

var d = instance_create(x, y, obj_damage_custom);

d.damage = damage;
d.strength = strength;

d.width = width;
d.height = height;

d.time = time;

d.damage_enemy = damage_enemy;
d.damage_player = damage_player;
d.damage_companion = damage_companion;

d.burn = burn;