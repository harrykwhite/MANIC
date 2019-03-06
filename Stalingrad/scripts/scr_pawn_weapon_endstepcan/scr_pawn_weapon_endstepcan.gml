if (instance_exists(owner)){
	if (owner.pawn == PawnType.Enemy){
		if (!global.game_pause)
		|| ((global.cutscene_current == -1)
		|| (owner.type == EnemyOneType.TrainBoss)
		|| ((global.cutscene_current == 33) && (owner.cutscene_prop))
		|| ((global.cutscene_current == 34) && (owner.cutscene_prop))
		|| ((global.cutscene_current == 35) && (owner.cutscene_prop))
		|| ((global.cutscene_current == 36) && (owner.cutscene_prop))
		|| ((global.cutscene_current == 38) && (owner.cutscene_prop))){
			return true; exit;
		}
	}

	if (owner.pawn == PawnType.Companion){
		if (!global.game_pause)
		|| ((global.cutscene_current == -1)
		|| (owner.cutscene_prop)){
			return true; exit;
		}
	}
}

return false;