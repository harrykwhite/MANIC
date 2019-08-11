///@param x
///@param y
var xx = argument0;
var yy = argument1;

var valid = true;
var woodlayerexists = layer_exists("InteriorFloorWood");
var tilelayerexists = layer_exists("InteriorFloorTile");
var onfloor = false;

if (woodlayerexists){
	onfloor = tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("InteriorFloorWood")), xx, yy);
}

if (tilelayerexists){
	onfloor = tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("InteriorFloorTile")), xx, yy);
}

if
(collision_rectangle(xx - 20, yy - 20, xx + 20, yy + 30, obj_p_solid, false, false))
|| (collision_rectangle(xx - 20, yy - 20, xx + 20, yy + 30, obj_p_depth_burn, false, false))
|| (collision_line(xx, yy, obj_player.x, obj_player.y, obj_p_solid, false, true))
|| (point_distance(xx, yy, obj_player.x, obj_player.y) < 80)
|| (onfloor){
	valid = false;
}

return valid;