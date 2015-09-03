/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/      
                                                                                                                                                                 
                                                                                                             



A3M Checkpoint V 1.8 by Cody Salazar AKA Fr33d0m 
www.A3MilSim.com

License:
You can do whatever you were going to do anyway. Just give me the credit i'm due, and don't steal my shit. I'll be pissed. 
If you want to repay me for all my hard work, come and play arma with me! I hang out at a MilSim unit known as A3M (A3 MilSim) 
Come and visit us at ts3.a3milsim.com:1911

WE LOVE JOINT OPS WITH OTHER UNITS!! 

www.A3MilSim.com (A3 MilSim)
All Rights Reserved

For Information and Inquiries, EMAIL: salazar@a3milsim.com

Credits & Thanks: 

God, Because God. 

My wife, for not only supporting my modding ventures, but actually jumping in and helping with mods when she can. What a gal! 

And last, but definitely not least, the A3 community, who through over 250+ encouraging messages highly encouraged me to continue this project. I'm glad you like it, 
and I hope you enjoy the things I have in the works! 


################################## LET US BEGIN #################################### */

ShiftLength = ParamsArray Select 2; 

if ((CheckPointActive == 1) AND (missionspassed < ShiftLength)) then {	

// Make server pick random car from list of cars below: 
DoPickRandomCar = {
RCRandomNumber= ["M0","M1","M2","M3","M4"]; 
RCPickedNumber= RCRandomNumber select floor random count RCRandomNumber; 
	switch (RCPickedNumber) do {

		Case "M0": {
        //hint "Case M0 selected, Hatchback"; 

		CVeh= CreateVehicle ["C_Hatchback_01_F", getMarkerPos "RBStage1", [], 0, "NONE"]; 
		RBVeh = Cveh;
		publicVariable "RBVeh";  
					}; 

		Case "M1": { 
		//hint "Case M1 selected, Pickup"; 
		CVeh= CreateVehicle ["C_Offroad_01_F", getMarkerPos "RBStage1", [], 0, "NONE"];	
		RBVeh = Cveh;
		publicVariable "RBVeh";  
					}; 

		Case "M2": {
		//hint "Case M2 selected, SUV"; 
		CVeh= CreateVehicle ["C_SUV_01_F", getMarkerPos "RBStage1", [], 0, "NONE"]; 
		RBVeh = Cveh;
		publicVariable "RBVeh";
		
		EnChance = [1, 0, 0, 0, 0, 0, 0, 1, 0, 0];
		EnPres= EnChance select floor random count EnChance;
		if (EnPres == 1) then {
		_RBen= [getMarkerPos "ENStage1", EAST, ["LOP_ChDKZ_Infantry_Rifleman", "LOP_ChDKZ_Infantry_Rifleman", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_AT"]] call BIS_fnc_spawnGroup;
		[_RBen, getMarkerPos "RBC"] call BIS_fnc_taskAttack; 
		EnPres = nil; 			
						}; 
				}; 

		Case "M3": { 
		//hint "Case M3 selected, Box Truck"; 
		CVeh= CreateVehicle ["C_Van_01_Box_F", getMarkerPos "RBStage1", [], 0, "NONE"];

		RBVeh = Cveh;
		publicVariable "RBVeh";  
					}; 

		Case "M4": {
		//hint "Case M4 selected, Fuel Truck"; 
		CVeh= CreateVehicle ["C_Van_01_fuel_F", getMarkerPos "RBStage1", [], 0, "NONE"];
		RBVeh = Cveh;
		publicVariable "RBVeh";  
		EnChance = [1, 0, 0, 0, 0, 0, 0, 1, 0, 0];
		EnPres= EnChance select floor random count EnChance;
		if (EnPres == 1) then {
		_RBen= [getMarkerPos "ENStage1", EAST, ["LOP_ChDKZ_Infantry_Rifleman", "LOP_ChDKZ_Infantry_Rifleman", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_AT"]] call BIS_fnc_spawnGroup;
		[_RBen, getMarkerPos "RBC"] call BIS_fnc_taskAttack; 
		EnPres = nil; 	
							}; 
					}; 
}; 
};

 // Random Attitude Picker
DoPickRandomAttitude = {
RARandomNumber = ["M0","M1","M2","M3","M4","M5","M6","M7","M8","M9","M10","M11"];
RAPickedNumber = RARandomNumber select floor random count RARandomNumber;
publicVariable "RAPickedNumber"; 
}; 

// Random Haji Maker
doPickRandomHaji = {

RHClassArray = ["LOP_Tak_Civ_Man_01", "LOP_Tak_Civ_Man_02","LOP_Tak_Civ_Man_04","C_man_1", "C_man_p_beggar_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F", "C_man_1_1_F", "C_journalist_F", "C_journalist_F", "C_scientist_F", "C_man_shorts_2_F", "C_man_shorts_3_F", "C_man_w_worker_F"]; 
ChosenHaji = RHClassArray select floor random count RHClassArray; 
CivHaji= createGroup Civilian;
ChosenHaji createUnit [getMarkerPos "RBStage1B", CivHaji, "RBVehD = this" , 0.8, "COLONEL"];
}; 

// Clap Clap - Make it all happen in order. 

_DPRC= [] spawn DoPickRandomCar;
waitUntil {scriptDone _DPRC};
_DPRA= [] spawn doPickRandomAttitude;
waitUntil {scriptDone _DPRA};
_DPRH= [] spawn doPickRandomHaji; 
waitUntil {scriptDone _DPRH};

// Make him jump in the hooptie and approach the checkpoint

_wp1 = CivHaji addWaypoint [position RBVeh, 1];
_wp1 setWaypointType "GETIN";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointSpeed "FULL";
_wp1 waypointAttachVehicle RBVeh;

_wp2 = CivHaji addWaypoint [getMarkerPos "RBC", 2];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "CARELESS";
_wp2 setWaypointSpeed "FULL";

// Create his attitude for all players/ rig it with a bomb. 
[ '','MP_Roadblock_Attitude',True,False] call BIS_fnc_MP;

// Tell Death Check Loop that Man is Alive, so no duplication. 
CPManAlive = 1; 


} else {
// End Mission for All 
[ '','A3M_fnc_rbmissionend',True,False] call BIS_fnc_MP;

// Deactive Checkpoint
CheckpointActive = 0; 


// Reset Car Counter
missionspassed = 0; 
publicVariable "missionspassed"; 

 }; 