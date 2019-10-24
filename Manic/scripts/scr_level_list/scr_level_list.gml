enum Level{
	Prologue = 0,
	RavagedTown,
	WesternFarmland,
	UndergroundBunker,
	WinterTown,
	HumanPrison,
	TrainStation,
	TheCemetery,
	DesolateVillage,
	IntoTheCity,
	CityHeadquarters,
}

global.level_name[Level.Prologue] = "The Prologue";
global.level_room[Level.Prologue] = rm_prologue_00;
global.level_preroom[Level.Prologue] = noone;
global.level_collectable_current[Level.Prologue] = 0;
global.level_collectable_number[Level.Prologue] = 0;
global.level_turret_number[Level.Prologue] = 0;
global.level_entered[Level.Prologue] = false;
global.level_complete[Level.Prologue] = false;
global.level_checkpoint_found[Level.Prologue, 0] = false;

global.level_name[Level.RavagedTown] = "Ravaged Town";
global.level_room[Level.RavagedTown] = rm_level_1_00;
global.level_preroom[Level.RavagedTown] = noone;
global.level_collectable_current[Level.RavagedTown] = 0;
global.level_collectable_number[Level.RavagedTown] = 0;
global.level_turret_number[Level.RavagedTown] = 0;
global.level_entered[Level.RavagedTown] = false;
global.level_complete[Level.RavagedTown] = false;
global.level_checkpoint_found[Level.RavagedTown, 0] = false;

global.level_name[Level.WesternFarmland] = "Western Farmland";
global.level_room[Level.WesternFarmland] = rm_level_2_00;
global.level_preroom[Level.WesternFarmland] = rm_level_2_pre_00;
global.level_collectable_current[Level.WesternFarmland] = 0;
global.level_collectable_number[Level.WesternFarmland] = 7;
global.level_turret_number[Level.WesternFarmland] = 0;
global.level_entered[Level.WesternFarmland] = false;
global.level_complete[Level.WesternFarmland] = false;
global.level_checkpoint_found[Level.WesternFarmland, 0] = false;
global.level_checkpoint_found[Level.WesternFarmland, 1] = false;

global.level_name[Level.UndergroundBunker] = "Underground Bunker";
global.level_room[Level.UndergroundBunker] = rm_level_3_00;
global.level_preroom[Level.UndergroundBunker] = noone;
global.level_collectable_current[Level.UndergroundBunker] = 0;
global.level_collectable_number[Level.UndergroundBunker] = 0;
global.level_turret_number[Level.UndergroundBunker] = 0;
global.level_entered[Level.UndergroundBunker] = false;
global.level_complete[Level.UndergroundBunker] = false;
global.level_checkpoint_found[Level.UndergroundBunker, 0] = false;

global.level_name[Level.WinterTown] = "Winter Town";
global.level_room[Level.WinterTown] = rm_level_4_00;
global.level_preroom[Level.WinterTown] = rm_level_4_pre_00;
global.level_collectable_current[Level.WinterTown] = 0;
global.level_collectable_number[Level.WinterTown] = 6;
global.level_turret_number[Level.WinterTown] = 0;
global.level_entered[Level.WinterTown] = false;
global.level_complete[Level.WinterTown] = false;
global.level_checkpoint_found[Level.WinterTown, 0] = false;
global.level_checkpoint_found[Level.WinterTown, 1] = false;

global.level_name[Level.HumanPrison] = "Human Prison";
global.level_room[Level.HumanPrison] = rm_level_5_00;
global.level_preroom[Level.HumanPrison] = noone;
global.level_collectable_current[Level.HumanPrison] = 0;
global.level_collectable_number[Level.HumanPrison] = 0;
global.level_turret_number[Level.HumanPrison] = 1;
global.level_entered[Level.HumanPrison] = false;
global.level_complete[Level.HumanPrison] = false;
global.level_checkpoint_found[Level.HumanPrison, 0] = false;

global.level_name[Level.TrainStation] = "Train Station";
global.level_room[Level.TrainStation] = rm_level_6_00;
global.level_preroom[Level.TrainStation] = rm_level_6_pre_00;
global.level_collectable_current[Level.TrainStation] = 0;
global.level_collectable_number[Level.TrainStation] = 0;
global.level_turret_number[Level.TrainStation] = 1;
global.level_entered[Level.TrainStation] = false;
global.level_complete[Level.TrainStation] = false;
global.level_checkpoint_found[Level.TrainStation, 0] = false;

global.level_name[Level.TheCemetery] = "The Cemetery";
global.level_room[Level.TheCemetery] = rm_level_7_00;
global.level_preroom[Level.TheCemetery] = noone;
global.level_collectable_current[Level.TheCemetery] = 0;
global.level_collectable_number[Level.TheCemetery] = 4;
global.level_turret_number[Level.TheCemetery] = 6;
global.level_entered[Level.TheCemetery] = false;
global.level_complete[Level.TheCemetery] = false;
global.level_checkpoint_found[Level.TheCemetery, 0] = false;

global.level_name[Level.DesolateVillage] = "Desolate Village";
global.level_room[Level.DesolateVillage] = rm_level_8_00;
global.level_preroom[Level.DesolateVillage] = noone;
global.level_collectable_current[Level.DesolateVillage] = 0;
global.level_collectable_number[Level.DesolateVillage] = 0;
global.level_turret_number[Level.DesolateVillage] = 1;
global.level_entered[Level.DesolateVillage] = false;
global.level_complete[Level.DesolateVillage] = false;
global.level_checkpoint_found[Level.DesolateVillage, 0] = false;

global.level_name[Level.IntoTheCity] = "Into The City";
global.level_room[Level.IntoTheCity] = rm_level_9_00;
global.level_preroom[Level.IntoTheCity] = noone;
global.level_collectable_current[Level.IntoTheCity] = 0;
global.level_collectable_number[Level.IntoTheCity] = 0;
global.level_turret_number[Level.IntoTheCity] = 3;
global.level_entered[Level.IntoTheCity] = false;
global.level_complete[Level.IntoTheCity] = false;
global.level_checkpoint_found[Level.IntoTheCity, 0] = false;

global.level_name[Level.CityHeadquarters] = "City Headquarters";
global.level_room[Level.CityHeadquarters] = rm_level_10_00;
global.level_preroom[Level.CityHeadquarters] = noone;
global.level_collectable_current[Level.CityHeadquarters] = 0;
global.level_collectable_number[Level.CityHeadquarters] = 0;
global.level_turret_number[Level.CityHeadquarters] = 0;
global.level_entered[Level.CityHeadquarters] = false;
global.level_complete[Level.CityHeadquarters] = false;
global.level_checkpoint_found[Level.CityHeadquarters, 0] = false;