enum Objectives{
	KillEnemies,
	EscortResidents,
	KillDeer,
	WaitForTrain,
	ReleasePrisoners,
	DefeatEnemyTrain,
	TravelToCemetery,
	DestroyProductionEngines,
	CollectAllArtifacts,
	CollectAllChestplatePieces,
	LocateTheAnvil,
	TalkToFarmer,
	ExploreUndergroundBunker,
	CollectAllLeggingsPieces,
}

// Insert '^' to indicate counter positioning in text

global.objective_name[0] = "Clear the area of ^ enemies.";
global.objective_counter[0] = 0;
global.objective_counter_max[0] = 0;

global.objective_name[1] = "Talk to and escort ^ residents in the town.";
global.objective_counter[1] = 0;
global.objective_counter_max[1] = 4;
audio_get_listener_count();
global.objective_name[2] = "Hunt and gather ^ deer meat.";
global.objective_counter[2] = 0;
global.objective_counter_max[2] = 4;

global.objective_name[3] = "Wait for an enemy train to arrive.";
global.objective_counter[3] = 0;
global.objective_counter_max[3] = 0;

global.objective_name[4] = "Release all ^ prisoners.";
global.objective_counter[4] = 0;
global.objective_counter_max[4] = 10;

global.objective_name[5] = "Defeat the enemy train.";
global.objective_counter[5] = 0;
global.objective_counter_max[5] = 0;

global.objective_name[6] = "Travel to the cemetery.";
global.objective_counter[6] = 0;
global.objective_counter_max[6] = 0;

global.objective_name[7] = "Locate and destroy ^ production engines.";
global.objective_counter[7] = 0;
global.objective_counter_max[7] = 5;

global.objective_name[8] = "Collect ^ artifacts throughout the map.";
global.objective_counter[8] = 0;
global.objective_counter_max[8] = 0;

global.objective_name[9] = "Collect ^ pieces of the chestplate throughout the map.";
global.objective_counter[9] = 0;
global.objective_counter_max[9] = 0;

global.objective_name[10] = "Locate the anvil room in the city.";
global.objective_counter[10] = 0;
global.objective_counter_max[10] = 0;

global.objective_name[11] = "Talk to the farmer";
global.objective_counter[11] = 0;
global.objective_counter_max[11] = 0;

global.objective_name[12] = "Explore the underground bunker";
global.objective_counter[12] = 0;
global.objective_counter_max[12] = 0;

global.objective_name[13] = "Collect ^ pieces of the leggings throughout the map.";
global.objective_counter[13] = 0;
global.objective_counter_max[13] = 0;

global.game_objective_current = 0;
global.game_objective_set = false;
global.game_objective_complete = false;