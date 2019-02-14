visible = true;

if (instance_exists(global.player)){
	if (global.player.inMinecart){
		if (global.player.minecart == id){
			visible = false;
		}
	}
}