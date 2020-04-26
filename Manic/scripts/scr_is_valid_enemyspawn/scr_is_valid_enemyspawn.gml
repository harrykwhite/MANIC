///@param x
///@param y
var xx = argument0;
var yy = argument1;

var lvl = scr_level_get_index(room);

var woodlayerexists = layer_exists("InteriorFloorWood");
var tilelayerexists = layer_exists("InteriorFloorTile");
var sidelayerexists = layer_exists("InteriorFloorWallSide");
var onfloor = false;

if (lvl != Level.UndergroundBunker && lvl != Level.HumanPrison && lvl != Level.CityHeadquarters && lvl != Level.Arena_PrisonBase){
	if (woodlayerexists){
		onfloor = tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("InteriorFloorWood")), xx, yy);
	}

	if (tilelayerexists){
		onfloor = tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("InteriorFloorTile")), xx, yy);
	}
}

if (sidelayerexists){
	if (tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("InteriorFloorWallSide")), xx, yy)){
		return false;
	}
}

if (onfloor){
	return false;
}

if (collision_rectangle(xx - 20, yy - 20, xx + 20, yy + 30, obj_p_solid, false, false)){
	return false;
}

if (collision_rectangle(xx - 20, yy - 20, xx + 20, yy + 30, obj_p_depth_burn, false, false)){
	return false;
}

if (collision_line(xx, yy, obj_player.x, obj_player.y, obj_p_solid, false, true)){
	return false;
}

if (point_distance(xx, yy, obj_player.x, obj_player.y) < 50){
	return false;
}

return true;