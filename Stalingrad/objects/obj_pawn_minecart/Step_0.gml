visible = true;

if (instance_exists(global.player)){
	if (global.player.in_minecart){
		if (global.player.minecart == id){
			visible = false;
		}
	}
}