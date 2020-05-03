enum Level{
	Prologue,
	RavagedTown,
	EasternFarmland,
	UndergroundBunker,
	WinterTown,
	HumanPrison,
	TrainStation,
	TheCemetery,
	DesolateVillage,
	IntoTheCity,
	CityHeadquarters,
	Arena_NorthernFarmhouse,
	Arena_WinterForest,
	Arena_PrisonBase
}

global.level_name[Level.Prologue] = "The Prologue";
global.level_location_name[Level.Prologue] = "area";
global.level_room[Level.Prologue] = rm_prologue_00;
global.level_preroom[Level.Prologue] = noone;
global.level_collectable_current[Level.Prologue] = 0;
global.level_collectable_number[Level.Prologue] = 0;
global.level_turret_number[Level.Prologue] = 0;
global.level_entered[Level.Prologue] = false;
global.level_complete[Level.Prologue] = false;
global.level_checkpoint_found[Level.Prologue, 0] = false;

global.level_name[Level.RavagedTown] = "Ravaged Town";
global.level_location_name[Level.RavagedTown] = "town";
global.level_room[Level.RavagedTown] = rm_level_1_00;
global.level_preroom[Level.RavagedTown] = noone;
global.level_collectable_current[Level.RavagedTown] = 0;
global.level_collectable_number[Level.RavagedTown] = 0;
global.level_turret_number[Level.RavagedTown] = 0;
global.level_entered[Level.RavagedTown] = false;
global.level_complete[Level.RavagedTown] = false;
global.level_checkpoint_found[Level.RavagedTown, 0] = false;

global.level_name[Level.EasternFarmland] = "Eastern Farmland";
global.level_location_name[Level.EasternFarmland] = "farmland";
global.level_room[Level.EasternFarmland] = rm_level_2_00;
global.level_preroom[Level.EasternFarmland] = rm_level_2_pre_00;
global.level_collectable_current[Level.EasternFarmland] = 0;
global.level_collectable_number[Level.EasternFarmland] = 7;
global.level_turret_number[Level.EasternFarmland] = 0;
global.level_entered[Level.EasternFarmland] = false;
global.level_complete[Level.EasternFarmland] = false;
global.level_checkpoint_found[Level.EasternFarmland, 0] = false;
global.level_checkpoint_found[Level.EasternFarmland, 1] = false;

global.level_name[Level.UndergroundBunker] = "Underground Bunker";
global.level_location_name[Level.UndergroundBunker] = "underground bunker";
global.level_room[Level.UndergroundBunker] = rm_level_3_00;
global.level_preroom[Level.UndergroundBunker] = noone;
global.level_collectable_current[Level.UndergroundBunker] = 0;
global.level_collectable_number[Level.UndergroundBunker] = 0;
global.level_turret_number[Level.UndergroundBunker] = 0;
global.level_entered[Level.UndergroundBunker] = false;
global.level_complete[Level.UndergroundBunker] = false;
global.level_checkpoint_found[Level.UndergroundBunker, 0] = false;

global.level_name[Level.WinterTown] = "Winter Town";
global.level_location_name[Level.WinterTown] = "town";
global.level_room[Level.WinterTown] = rm_level_4_post_01;
global.level_preroom[Level.WinterTown] = rm_level_4_pre_00;
global.level_collectable_current[Level.WinterTown] = 0;
global.level_collectable_number[Level.WinterTown] = 6;
global.level_turret_number[Level.WinterTown] = 0;
global.level_entered[Level.WinterTown] = false;
global.level_complete[Level.WinterTown] = false;
global.level_checkpoint_found[Level.WinterTown, 0] = false;
global.level_checkpoint_found[Level.WinterTown, 1] = false;

global.level_name[Level.HumanPrison] = "Human Prison";
global.level_location_name[Level.HumanPrison] = "prison";
global.level_room[Level.HumanPrison] = rm_level_5_00;
global.level_preroom[Level.HumanPrison] = noone;
global.level_collectable_current[Level.HumanPrison] = 0;
global.level_collectable_number[Level.HumanPrison] = 0;
global.level_turret_number[Level.HumanPrison] = 1;
global.level_entered[Level.HumanPrison] = false;
global.level_complete[Level.HumanPrison] = false;
global.level_checkpoint_found[Level.HumanPrison, 0] = false;

global.level_name[Level.TrainStation] = "Train Station";
global.level_location_name[Level.TrainStation] = "train station";
global.level_room[Level.TrainStation] = rm_level_6_00;
global.level_preroom[Level.TrainStation] = rm_level_6_pre_00;
global.level_collectable_current[Level.TrainStation] = 0;
global.level_collectable_number[Level.TrainStation] = 0;
global.level_turret_number[Level.TrainStation] = 1;
global.level_entered[Level.TrainStation] = false;
global.level_complete[Level.TrainStation] = false;
global.level_checkpoint_found[Level.TrainStation, 0] = false;

global.level_name[Level.TheCemetery] = "The Cemetery";
global.level_location_name[Level.TheCemetery] = "cemetery";
global.level_room[Level.TheCemetery] = rm_level_7_00;
global.level_preroom[Level.TheCemetery] = noone;
global.level_collectable_current[Level.TheCemetery] = 0;
global.level_collectable_number[Level.TheCemetery] = 4;
global.level_turret_number[Level.TheCemetery] = 6;
global.level_entered[Level.TheCemetery] = false;
global.level_complete[Level.TheCemetery] = false;
global.level_checkpoint_found[Level.TheCemetery, 0] = false;

global.level_name[Level.DesolateVillage] = "Desolate Village";
global.level_location_name[Level.DesolateVillage] = "village";
global.level_room[Level.DesolateVillage] = rm_level_8_00;
global.level_preroom[Level.DesolateVillage] = noone;
global.level_collectable_current[Level.DesolateVillage] = 0;
global.level_collectable_number[Level.DesolateVillage] = 3;
global.level_turret_number[Level.DesolateVillage] = 1;
global.level_entered[Level.DesolateVillage] = false;
global.level_complete[Level.DesolateVillage] = false;
global.level_checkpoint_found[Level.DesolateVillage, 0] = false;

global.level_name[Level.IntoTheCity] = "Into The City";
global.level_location_name[Level.IntoTheCity] = "city";
global.level_room[Level.IntoTheCity] = rm_level_9_00;
global.level_preroom[Level.IntoTheCity] = noone;
global.level_collectable_current[Level.IntoTheCity] = 0;
global.level_collectable_number[Level.IntoTheCity] = 0;
global.level_turret_number[Level.IntoTheCity] = 3;
global.level_entered[Level.IntoTheCity] = false;
global.level_complete[Level.IntoTheCity] = false;
global.level_checkpoint_found[Level.IntoTheCity, 0] = false;

global.level_name[Level.CityHeadquarters] = "City Headquarters";
global.level_location_name[Level.CityHeadquarters] = "city headquarters";
global.level_room[Level.CityHeadquarters] = rm_level_10_00;
global.level_preroom[Level.CityHeadquarters] = noone;
global.level_collectable_current[Level.CityHeadquarters] = 0;
global.level_collectable_number[Level.CityHeadquarters] = 0;
global.level_turret_number[Level.CityHeadquarters] = 0;
global.level_entered[Level.CityHeadquarters] = false;
global.level_complete[Level.CityHeadquarters] = false;
global.level_checkpoint_found[Level.CityHeadquarters, 0] = false;

ini_open(working_directory + "arena.ini");

global.level_name[Level.Arena_NorthernFarmhouse] = "Northern Farmhouse";
global.level_location_name[Level.Arena_NorthernFarmhouse] = "area";
global.level_room[Level.Arena_NorthernFarmhouse] = rm_arena_1_00;
global.level_preroom[Level.Arena_NorthernFarmhouse] = noone;
global.level_collectable_current[Level.Arena_NorthernFarmhouse] = 0;
global.level_collectable_number[Level.Arena_NorthernFarmhouse] = 0;
global.level_turret_number[Level.Arena_NorthernFarmhouse] = 0;
global.level_entered[Level.Arena_NorthernFarmhouse] = false;
global.level_complete[Level.Arena_NorthernFarmhouse] = false;
global.level_checkpoint_found[Level.Arena_NorthernFarmhouse, 0] = false;
global.level_score[Level.Arena_NorthernFarmhouse] = 0;
global.level_highscore[Level.Arena_NorthernFarmhouse] = ini_read_real("Highscores", "Arena0", 0);

global.level_name[Level.Arena_WinterForest] = "Winter Forest";
global.level_location_name[Level.Arena_WinterForest] = "forest";
global.level_room[Level.Arena_WinterForest] = rm_arena_2_00;
global.level_preroom[Level.Arena_WinterForest] = noone;
global.level_collectable_current[Level.Arena_WinterForest] = 0;
global.level_collectable_number[Level.Arena_WinterForest] = 0;
global.level_turret_number[Level.Arena_WinterForest] = 0;
global.level_entered[Level.Arena_WinterForest] = false;
global.level_complete[Level.Arena_WinterForest] = false;
global.level_checkpoint_found[Level.Arena_WinterForest, 0] = false;
global.level_score[Level.Arena_WinterForest] = 0;
global.level_highscore[Level.Arena_WinterForest] = ini_read_real("Highscores", "Arena1", 0);

global.level_name[Level.Arena_PrisonBase] = "Prison Base";
global.level_location_name[Level.Arena_PrisonBase] = "prison";
global.level_room[Level.Arena_PrisonBase] = rm_arena_3_00;
global.level_preroom[Level.Arena_PrisonBase] = noone;
global.level_collectable_current[Level.Arena_PrisonBase] = 0;
global.level_collectable_number[Level.Arena_PrisonBase] = 0;
global.level_turret_number[Level.Arena_PrisonBase] = 0;
global.level_entered[Level.Arena_PrisonBase] = false;
global.level_complete[Level.Arena_PrisonBase] = false;
global.level_checkpoint_found[Level.Arena_PrisonBase, 0] = false;
global.level_score[Level.Arena_PrisonBase] = 0;
global.level_highscore[Level.Arena_PrisonBase] = ini_read_real("Highscores", "Arena2", 0);

ini_close();

global.level_campaign_count = Level.CityHeadquarters + 1;
global.level_arena_count = array_length_1d(global.level_name) - global.level_campaign_count;