if (!checked){
	if (listnum != -1){
		if (global.level_collectable_found[# 0, listnum]){
			instance_destroy();
		}
	}
	
	checked = true;
}

if (instance_exists(deer_flesh_cblock)){
	deer_flesh_cblock.x = x - deer_flesh_cblock_xoff;
	deer_flesh_cblock.y = y - deer_flesh_cblock_yoff;
}