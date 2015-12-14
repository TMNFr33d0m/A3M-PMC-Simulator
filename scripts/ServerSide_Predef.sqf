// Server Side Scripting (Things Only The Server Should Be Doing)

// Force Cleanup
A3M_Fnc_Cleanup = {

_A3MCleanupIsForced = _This Select 0; 
if (_A3MCleanupIsForced == 1) then {["InformationRed", ["Cleanup Initiated"]] call bis_fnc_showNotification;}; 

{ if (!alive _x) then { deletevehicle _x } } foreach (nearestObjects [center, ["Man", "Car", "Tank", "Helicopter"], 7500]);

};

ALiVEBudgetPush = {
["P_defensebudget", B_defensebudget] call ALiVE_fnc_setData;
};

A3M_svr_VIPEscort= {

// JIP Handler Mission Status
MissionStatus= "M1"; 
PublicVariable "MissionStatus"; 

// Mission Repeat Denial
EscortActive = 1; 
publicVariable "EscortActive"; 

// Randomly Select HVT's Position from array, broadcast position to all players
HVTposarray = ["HVTpos1", "HVTpos2", "HVTpos3", "HVTpos4", "HVTpos5", "HVTpos6", "HVTpos7", "HVTpos8", "HVTpos9"];
HVTDestination= HVTposarray select floor random count HVTposarray;
PublicDestination= HVTDestination;
publicVariable "PublicDestination";

// Create task for all players
["","A3M_MP_EscortTask",True,False] spawn BIS_fnc_MP; 

// Random chance of enemy presence at Destination

EnChance = [1, 0, 0, 0, 0, 0, 0, 1, 0, 0];
EnPres= EnChance select floor random count EnChance;

// Create Cadre on Random Chance (Contains Leights Opfor)
if (EnPres == 1) then {
_HVTen= [getMarkerPos "PublicDestination", EAST, ["O_G_Soldier_F", "O_G_Soldier_SL_F","O_G_Soldier_AR_F", "O_G_Soldier_GL_F"]] call BIS_fnc_spawnGroup;
[_HVTen, getMarkerPos "PublicDestination"] call BIS_fnc_taskDefend; 
}; 

// Create Trigger For Mission Completion (Deliver VIP To Trigger)
A3M_fnc_DestinationTrigger = {

VIPDest= createTrigger ["EmptyDetector", getMarkerPos PublicDestination]; 
VIPDest setTriggerArea [12, 12, 0, false]; 
VIPDest setTriggerActivation ["ANY", "PRESENT", True]; 
VIPDest setTriggerType "NONE";
VIPDest setTriggerStatements ["VIP1 in thislist", "[] spawn A3M_svr_EscortSuccess", "" ]; 

}; 

// Create trigger to handle VIP Death
A3M_fnc_DeathTrigger = {

VIPDead= createTrigger ["EmptyDetector", getMarkerPos PublicDestination]; 
VIPDead setTriggerArea [0, 0, 0, false]; 
VIPDead setTriggerActivation ["ANY", "PRESENT", True]; 
VIPDead setTriggerType "NONE";
VIPDead setTriggerStatements ["!Alive VIP1", "[] call A3M_svr_EscortFailed", ""]; 

}; 

[] call A3M_fnc_DestinationTrigger;
[] call A3M_fnc_DeathTrigger; 

while {EscortActive == 1} do {"VIP1ICO" setmarkerpos getpos VIP1; sleep 0.5;};

};
A3M_svr_TRKEscort= {

// JIP Handler Mission Status
MissionStatus = "M2"; 
PublicVariable "MissionStatus"; 

// Mission Repeat Denial
ConveyActive = 1; 
publicVariable "ConvoyActive";

// Random Selection of Destination, and public broadcast of destination to all players
DELposarray = ["DELpos1", "DELpos2", "DELpos3", "DELpos4", "DELpos5", "DELpos6", "DELpos7", "DELpos8", "DELpos9"];
DelDestination= DELposarray select floor random count DELposarray;
sleep 1.0; 
PubDelDestination=DelDestination;
publicVariable "PubDelDestination"; 

// Random chance of enemy ambush
EnChance = [1, 0, 0, 0, 0, 0, 0, 1, 0, 0];
EnPres= EnChance select floor random count EnChance;

if (EnPres == 1) then {
_HVTen= [getMarkerPos "PubDelDestination", EAST, ["O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_AR_F","O_G_Soldier_GL_F"]] call BIS_fnc_spawnGroup;
[_HVTen, getMarkerPos "PubDelDestination"] call BIS_fnc_taskDefend; 
}; 

// Create Trigger to Handle Mission Success
A3M_fnc_DelDestinationTrigger = {
DelDest= createTrigger ["EmptyDetector", getMarkerPos PubDelDestination]; 
DelDest setTriggerArea [10, 10, 0, false]; 
DelDest setTriggerActivation ["ANY", "PRESENT", True]; 
DelDest setTriggerType "NONE";
DelDest setTriggerStatements ["DEL1 in thislist", '["", "A3M_svr_ConvoySuccess", false, false, false] call bis_fnc_MP', ""]; 
}; 

// Create Trigger to handle mission failure
A3M_fnc_DelDeathTrigger = {
DelDead= createTrigger ["EmptyDetector", getMarkerPos PubDelDestination]; 
DelDead setTriggerArea [0, 0, 0, false]; 
DelDead setTriggerActivation ["ANY", "PRESENT", True]; 
DelDead setTriggerType "NONE";
DelDead setTriggerStatements ["!Alive DEL1", "[] call A3M_svr_ConvoyFailed", ""]; 
}; 

// Create Box Truck for Delivery
DEL1 = "C_Van_01_box_F" createVehicle (getMarkerPos "deltruck");

// Call creation of triggers
call A3M_fnc_DelDestinationTrigger;
call A3M_fnc_DelDeathTrigger; 

// Create Task for all players
["","A3M_MP_ConvoyTask",True,False] spawn BIS_fnc_MP; 

};
A3M_svr_SandE= {

SEActive = 1; 
PublicVariable "SEActive"; 

MissionStatus = "M4"; 
publicVariable "MissionStatus"; 

SEARRAY= ["SE1", "SE2", "SE3", "SE4", "SE5", "SE6", "SE7", "SE8", "SE9"]; 

SELOC= SEARRAY select floor random count SEARRAY; 

publicLoc= SELOC; 
publicVariable "publicLoc"; 

A3M_fnc_SEVIPDead = {
SARDead= createTrigger ["EmptyDetector", (getMarkerPos PublicLoc)]; 
SARDead setTriggerArea [0, 0, 0, false]; 
SARDead setTriggerActivation ["ANY", "PRESENT", True]; 
SARDead setTriggerType "NONE";
SARDead setTriggerStatements ["!Alive SAR1", "[] call A3M_svr_SEFailed;", ""]; 
}; 

A3M_fnc_SEVIPSaved = {
SAResc= createTrigger ["EmptyDetector", (getMarkerPos "BA")]; 
SAResc setTriggerArea [30, 30, 0, false]; 
SAResc setTriggerActivation ["ANY", "PRESENT", True]; 
SAResc setTriggerType "NONE";
SAResc setTriggerStatements ["SAR1 in ThisList", "[] call A3M_svr_SESucceeded;", ""]; 
}; 

// Random Select Hostage 
RandomVIP2= ["C_Nikos_aged","C_scientist_F"];
RandomVIPSel2= RandomVIP2 select floor random count RandomVIP2;

CO= createGroup civilian; 
RandomVIPSel2 createUnit [getMarkerPos PublicLoc, group CO, "SAR1 = this", 0.9, "COLONEL" ];

sleep 1; 
(group SAR1) setBehaviour "CARELESS"; 
sleep 0.5; 

RescueAction = SAR1 addAction ["Rescue" , {
		[[SAR1],'A3M_MP_EscVIPCmds',True,False] call BIS_fnc_MP;
		[ '','A3M_MP_ChangeSARDest',True,False] spawn BIS_fnc_MP;
		
	}];  

[] call A3M_fnc_SEVIPDead; 
[] call A3M_fnc_SEVIPSaved; 

sleep 1; 

// Create Hostage Takers / Captors (Contains Leights Opfor)
_HSTF= [getPos SAR1, EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_HSTF, getPos SAR1] call BIS_fnc_taskDefend; 

_bluNums = west countSide allPlayers;

if (_bluNums > 10) then {
_HSTF2= [getPos SAR1, EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_HSTF2, getPos SAR1, 200] call BIS_fnc_taskPatrol; 

_HSTF3= [getPos SAR1, EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_HSTF3, getPos SAR1, 200] call BIS_fnc_taskPatrol; 
};
if (_bluNums > 20) then {
_HSTF4= [getPos SAR1, EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_HSTF4, getPos SAR1] call BIS_fnc_taskDefend; 
}; 

[ '','A3M_mp_SARmission',True,False] spawn BIS_fnc_MP;

while {SEActive == 1} do {"SAR1ICO" setmarkerpos getpos SAR1; sleep 0.5;};

};
A3M_svr_Raid1={

MissionStatus = "M5"; 
publicVariable "MissionStatus";

raid1Active = 1; 
publicVariable "raid1Active"; 

_bluNums = west countSide allPlayers;

// Create Enemy Presence (Contains Leights Opfor)
_GH1tm= [getMarkerPos "GH1", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH1tm, getMarkerPos "GH1"] call BIS_fnc_taskDefend; 

_GH2tm= [getMarkerPos "GH2", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH2tm, getMarkerPos "GH2"] call BIS_fnc_taskDefend; 

if (_bluNums > 10) then {
_GH3tm= [getMarkerPos "GH3", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH3tm, getMarkerPos "GH3"] call BIS_fnc_taskDefend; 

_GH4tm= [getMarkerPos "GH4", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH4tm, getMarkerPos "sg1"] call BIS_fnc_taskDefend; 
};

if (_bluNums > 20) then {
_GH5tm= [getMarkerPos "GH5", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH5tm, getMarkerPos "GH5", 200] call BIS_fnc_taskPatrol; 

_GH6tm= [getMarkerPos "GH6", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH6tm, getMarkerPos "GH6", 200] call BIS_fnc_taskPatrol; 
};

[ '','A3M_MP_Raid1',True,False] spawn BIS_fnc_MP;

Raid1Win= createTrigger ["EmptyDetector", (getMarkerPos "sg1")]; 
Raid1Win setTriggerArea [250, 250, 0, false]; 
Raid1Win setTriggerActivation ["WEST SEIZED", "EAST D", false]; 
Raid1Win setTriggerType "NONE";
Raid1Win setTriggerStatements ["this", "[[], 'A3M_svr_RaidClear', false, false, false] call bis_fnc_MP",""]; 

};
A3M_svr_Raid2= {

MissionStatus = "M6"; 
publicVariable "MissionStatus";

raid1Active = 1; 
publicVariable "raid1Active"; 

_bluNums = west countSide allPlayers;

// Create Enemy Presence (Contains Leights Opfor)
_GH1tm= [getMarkerPos "RO1", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH1tm, getMarkerPos "RO1"] call BIS_fnc_taskDefend; 

_GH2tm= [getMarkerPos "RO2", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH2tm, getMarkerPos "RO2"] call BIS_fnc_taskDefend; 

if (_bluNums > 10) then {
_GH3tm= [getMarkerPos "RO3", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH3tm, getMarkerPos "RO3"] call BIS_fnc_taskDefend; 

_GH4tm= [getMarkerPos "RO4", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH4tm, getMarkerPos "sg2"] call BIS_fnc_taskDefend; 
};

if (_bluNums > 20) then {
_GH5tm= [getMarkerPos "RO5", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH5tm, getMarkerPos "RO5"] call BIS_fnc_taskDefend; 

_GH6tm= [getMarkerPos "RO6", EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH6tm, getMarkerPos "RO6"] call BIS_fnc_taskDefend; 
};

[ '','A3M_MP_Raid2',True,False] spawn BIS_fnc_MP;

Raid2Win= createTrigger ["EmptyDetector", (getMarkerPos "sg2")]; 
Raid2Win setTriggerArea [450, 450, 0, false]; 
Raid2Win setTriggerActivation ["WEST SEIZED", "EAST D", false]; 
Raid2Win setTriggerType "NONE";
Raid2Win setTriggerStatements ["this", "[[], 'A3M_svr_RaidClear', false, false, false] call bis_fnc_MP",""]; 

};
A3M_svr_RaidClear= {

[ '','A3M_MP_RaidClear',True,False] spawn BIS_fnc_MP;

B_defensebudget= (B_defensebudget + 2000000); 

publicVariable "B_defensebudget"; 
MissionStatus = "M0"; 

publicVariable "MissionStatus";

raid1Active = 0; 
publicVariable "raid1Active"; 

if (!isNull Raid1Win) then {deleteVehicle Raid1Win};
if (!IsNull Raid2Win) then {deleteVehicle Raid2Win};  

}; 
A3M_svr_reinforce= {

MissionStatus = "M7"; 
publicVariable "MissionStatus";

NSARActive = 1; 
publicVariable "NSARActive"; 

sleep 1; 
execVM "scripts\nsar.sqf"; 

};
A3M_svr_T9sec={

MissionStatus = "M8"; 
publicVariable "MissionStatus";

T9Active = 1; 
publicVariable "T9Active"; 

TimearrayCounter = 0; 

[ '','A3M_MP_StartTaskT9',True,False] call BIS_fnc_MP;

T9trg= createTrigger ["EmptyDetector", getMarkerPos "T9"]; 
T9trg setTriggerArea [40, 40, 0, false]; 
T9trg setTriggerActivation ["WEST", "PRESENT", false]; 
T9trg setTriggerType "NONE";
T9trg setTriggerStatements ["This","['', 'A3M_svr_T9sec2', false, false, false] call bis_fnc_MP",""]; 
}; 

A3M_svr_T9sec2 = {

['','A3M_MP_T9Shift',True,False] call BIS_fnc_MP; 

['', 'A3M_fnc_SelectIncident', false, false, false] call bis_fnc_MP;
};
// Protestors Incident
A3M_fnc_Protest = {
if (!IsNull "T9Pros") then { {deleteVehicle _x} foreach (units T9Pros)};

T9Pros= [getMarkerPos "Prostart", civilian, ["C_man_1", "C_man_polo_2_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F", "C_man_p_fugitive_F"]] call BIS_fnc_spawnGroup;
"C_Nikos_aged" createUnit [getMarkerPos "Prostart", T9Pros, "ProtestLeader = this", 0.9, "COLONEL" ];
_wp1 = T9Pros addWaypoint [getMarkerPos "protest", 0]; 
_wp1 setWaypointType "MOVE"; 
_wp1 setWaypointFormation "DIAMOND";
[] call A3M_fnc_ProtestTrg;
}; 
A3M_fnc_ProtestTrg = {

T9ProsTrg= createTrigger ["EmptyDetector", getMarkerPos "Protest"]; 
T9ProsTrg setTriggerArea [30, 30, 0, false]; 
T9ProsTrg setTriggerActivation ["CIV", "PRESENT", True]; 
T9ProsTrg setTriggerType "NONE";
T9ProsTrg setTriggerStatements ["ProtestLeader in ThisList", "[ '','A3M_MP_T9ProtestChant',True,False] call BIS_fnc_MP;", 'ProtestActive = 0; PublicVariable "ProtestActive";']; 
}; 
A3M_fnc_AttackT9 = {
T9HostArray= ["T9_HostL1", "T9_HostL2", "T9_HostL3", "T9_HostL4"]; 
T9EnSource= T9HostArray select floor random count T9HostArray; 

T9EF= [getMarkerPos T9EnSource, EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F"]] call BIS_fnc_spawnGroup;
_wpE1 = T9EF addWaypoint [getMarkerPos "T9", 0]; 
_wpE1 setWaypointType "SAD"; 
_wpE1 setWaypointFormation "DIAMOND";

T9wpE1= createTrigger ["EmptyDetector", getMarkerPos "Protest"]; 
T9wpE1 setTriggerArea [30, 30, 0, false]; 
T9wpE1 setTriggerActivation ["CIV", "PRESENT", True]; 
T9wpE1 setTriggerType "NONE";
T9wpE1 setTriggerStatements ["({alive _x} count units T9EF) < 1", "[ '','A3M_MP_T9EnemyElim',True,False] call BIS_fnc_MP; ", ""]; 
}; 
//  End Hostile Attack
// Double Hostile Attack
A3M_fnc_dblAttackT9 = {

T9HostArray= ["T9_HostL1", "T9_HostL2", "T9_HostL3", "T9_HostL4"]; 
T9EnSource= T9HostArray select floor random count T9HostArray; 

T9EF2= [getMarkerPos T9EnSource, EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F"]] call BIS_fnc_spawnGroup;
_wpE2 = T9EF2 addWaypoint [getMarkerPos "T9", 0]; 
_wpE2 setWaypointType "SAD"; 
_wpE2 setWaypointFormation "DIAMOND";

T9wpE2= createTrigger ["EmptyDetector", getMarkerPos "Protest"]; 
T9wpE2 setTriggerArea [30, 30, 0, false]; 
T9wpE2 setTriggerActivation ["ANY", "PRESENT", True]; 
T9wpE2 setTriggerType "NONE";
T9wpE2 setTriggerStatements ["({alive _x} count units T9EF2) < 1", "[ '','A3M_MP_T9EnemyElim',True,False] call BIS_fnc_MP; ", ""]; 

T9HostArray= ["T9_HostL1", "T9_HostL2", "T9_HostL3", "T9_HostL4"]; 
T9EnSource= T9HostArray select floor random count T9HostArray; 

T9EF3= [getMarkerPos T9EnSource, EAST, ["O_G_Soldier_AR_F", "O_G_Soldier_LAT_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_GL_F"]] call BIS_fnc_spawnGroup;
_wpE3 = T9EF3 addWaypoint [getMarkerPos "T9", 0]; 
_wpE3 setWaypointType "SAD"; 
_wpE3 setWaypointFormation "DIAMOND";

T9wpE3= createTrigger ["EmptyDetector", getMarkerPos "Protest"]; 
T9wpE3 setTriggerArea [30, 30, 0, false]; 
T9wpE3 setTriggerActivation ["ANY", "PRESENT", True]; 
T9wpE3 setTriggerType "NONE";
T9wpE3 setTriggerStatements ["({alive _x} count units T9EF3) < 1", "[ '','A3M_MP_T9EnemyElim',True,False] call BIS_fnc_MP; ", ""]; 

}; 
A3M_Fnc_Delivery = {

if (IsNil "T9GateOpen") then {T9GateOpen = 0};
DeliveryComplete = 0; 
PublicVariable "DeliveryComplete";

T9DelGrp = createGroup Civilian; 

T9DelTrk= "C_Van_01_box_F" createVehicle GetMarkerPos "T9Stage1";
T9DelTrk_crew = [T9DelTrk, T9DelGrp] call BIS_fnc_spawnCrew;

_wpT1 = T9DelGrp addWaypoint [GetMarkerPos "T9Stop1", 1];
_wpT1 setWaypointType "MOVE";
_wpT1 setWaypointBehaviour "CARELESS";
_wpT1 setWaypointSpeed "NORMAL";

T9wpT2= createTrigger ["EmptyDetector", getMarkerPos "T9Stop1"]; 
T9wpT2 setTriggerArea [10, 10, 0, false]; 
T9wpT2 setTriggerActivation ["ANY", "PRESENT", True]; 
T9wpT2 setTriggerType "NONE";
T9wpT2 setTriggerStatements ["T9DelTrk in ThisList", "[ '','A3M_MP_T9TrkInPos',True,False] call BIS_fnc_MP; ", ""]; 

waitUntil {T9GateOpen == 1};

_wpT2 = T9DelGrp addWaypoint [GetMarkerPos "T9TrkDest", 2];
_wpT2 setWaypointType "MOVE";
_wpT2 setWaypointBehaviour "CARELESS";
_wpT2 setWaypointSpeed "LIMITED";

T9wpT3= createTrigger ["EmptyDetector", getMarkerPos "T9TrkDest"]; 
T9wpT3 setTriggerArea [20, 20, 0, false]; 
T9wpT3 setTriggerActivation ["ANY", "PRESENT", True]; 
T9wpT3 setTriggerType "NONE";
T9wpT3 setTriggerStatements ["T9DelTrk in ThisList", "[ '','A3M_MP_T9TrkDelIP',True,False] call BIS_fnc_MP; ", ""]; 

waitUntil {TriggerActivated T9wpT3}; 

DeleteVehicle T9wpT2;
Sleep 60; 
["","A3M_MP_T9TrkDelIP2",True,False] call BIS_fnc_MP; 

WaitUntil {DeliveryComplete == 1};

_wpT3 = T9DelGrp addWaypoint [GetMarkerPos "T9Stop2", 3];
_wpT3 setWaypointType "MOVE";
_wpT3 setWaypointBehaviour "CARELESS";
_wpT3 setWaypointSpeed "NORMAL";

waitUntil {T9GateOpen == 1};

_wpT3 = T9DelGrp addWaypoint [GetMarkerPos "T9Return", 4];
_wpT3 setWaypointType "MOVE";
_wpT3 setWaypointBehaviour "CARELESS";
_wpT3 setWaypointSpeed "FULL";

T9wpT4= createTrigger ["EmptyDetector", getMarkerPos "T9Return"]; 
T9wpT4 setTriggerArea [20, 20, 0, false]; 
T9wpT4 setTriggerActivation ["ANY", "PRESENT", True]; 
T9wpT4 setTriggerType "NONE";
T9wpT4 setTriggerStatements ["T9DelTrk in ThisList", "[ '','A3M_MP_T9TrkDelCplt',True,False] call BIS_fnc_MP; ", ""]; 

waitUntil {TriggerActivated T9wpT4};
sleep 10; 
[] Spawn A3M_Svr_T9Cleanup
}; 
A3M_Svr_T9Cleanup = {
DeleteVehicle T9DelTrk; 
{DeleteVehicle _x} Foreach (Units T9DelGrp);
DeleteVehicle T9wpT3;
DeleteVehicle T9wpT4;

};
// Incident Randomizer
A3M_fnc_SelectIncident= { 

T9IncidentArray= ["I0","I1","I2","I3", "I4"]; 
T9Incident= T9IncidentArray select floor random count T9IncidentArray;

switch (T9Incident) do {

case "I0": {
// Nothing
[] Spawn A3M_fnc_Incident_Causer;
};

case "I1": {
[] spawn A3M_fnc_Protest; 
[] Spawn A3M_fnc_Incident_Causer;
};

case "I2": {
[] spawn A3M_fnc_AttackT9; 
[] Spawn A3M_fnc_Incident_Causer;
}; 

case "I3": {
[] spawn A3M_fnc_dblAttackT9; 
[] Spawn A3M_fnc_Incident_Causer;
};

case "I4": {
[] spawn A3M_fnc_Delivery; 
[] Spawn A3M_fnc_Incident_Causer;
};

}; 
}; 
// End Incident Randomizer
A3M_fnc_Incident_Causer = {

TimeArray = [60,90,120,130,150,180,210,270]; 
RandomTime= TimeArray select floor random count TimeArray;

timearrayCounter = (timearrayCounter + RandomTime); 

if (timearrayCounter < 1200) then {

sleep RandomTime;
[] call A3M_fnc_SelectIncident; 

} else {

[ '','A3M_MP_T9Success',True,False] call BIS_fnc_MP;

MissionStatus = "M0"; 
publicVariable "MissionStatus";

T9Active = 0; 
publicVariable "T9Active"; 

B_defensebudget= (B_defensebudget + 750000); 
publicVariable "B_defensebudget"; 

timearrayCounter = nil; 
publicVariable "TimearrayCounter";
}; 

}; 
// 

A3M_svr_EscortFailed= {

['','A3M_MP_EscortFailed',True,False] call BIS_fnc_MP;

"VIP1ICO" setmarkerpos (getMarkerpos "offmap");
[VIP1] joinSilent grpnull; 

deleteVehicle VIPDest;
deleteVehicle VIPDead; 

sleep 10; 

deleteVehicle VIP1;

escortActive = 0; 
publicVariable "escortActive";
 
missionStatus = "M0"; 
publicVariable "missionStatus";

}; 

A3M_svr_EscortSuccess= {

['','A3M_MP_EscortSuccess',True,False] call BIS_fnc_MP;

"VIP1ICO" setmarkerpos (getMarkerpos "offmap");

[VIP1] join grpnull; 
TAgroup = createGroup Civilian; 
[VIP1] join TAgroup; 
TAgroup addWaypoint [ getMarkerPos PublicDestination, 1];
[TAgroup, 1] setWPPos GetMarkerPos PublicDestination; 
[TAgroup, 1] setWaypointType "move"; 

VIP1 allowDamage False;

deleteVehicle VIPDest;
deleteVehicle VIPDead;

escortActive = 0; 
publicVariable "escortActive";

missionStatus = "M0";
publicVariable "missionStatus"; 

B_defensebudget = (B_defensebudget + 50000); 
publicVariable "B_defensebudget"; 

PublicDestination= nil; 
publicVariable "PublicDestination"; 

sleep 30; 

deleteVehicle VIP1;

}; 
A3M_svr_ConvoyFailed= {
['','A3M_MP_ConvoyFailed',True,False] call BIS_fnc_MP;
deleteVehicle DelDest;
deleteVehicle DelDead; 
sleep 10.0; 
deleteVehicle DEL1;
convoyActive = 0; 
publicVariable "convoyActive"; 
missionStatus = "M0";
publicVariable "missionStatus";  
}; 
A3M_svr_SEFailed= {
['','A3M_MP_SEFailed',True,False] call BIS_fnc_MP;
SEActive = 0; 
PublicVariable "SEActive"; 
"SAR1ICO" setmarkerpos (getMarkerpos "offmap");
deleteVehicle SAR1; 
MissionStatus = "M0";
publicVariable "MissionStatus"; 
}; 
A3M_svr_SESucceeded= {
['','A3M_MP_SESucceeded',True,False] call BIS_fnc_MP;
SEActive = 0; 
publicVariable "SEActive"; 
"SAR1ICO" setmarkerpos (getMarkerpos "offmap");
deleteVehicle SARDead;
B_DefenseBudget = (B_DefenseBudget+ 1500000); 
publicVariable "B_defensebudget"; 
deleteVehicle SAR1; 
MissionStatus = "M0";
publicVariable "MissionStatus"; 
}; 
A3M_svr_ConvoySuccess = {
['','A3M_MP_ConvoySuccess',True,False] call BIS_fnc_MP;
deleteVehicle DelDest;
deleteVehicle DelDead;
sleep 5.0; 
deleteVehicle DEL1;
convoyActive = 0;
publicVariable "convoyActive"; 
missionStatus = "M0"; 
publicVariable "missionStatus"; 
B_defensebudget = (B_defensebudget+ 75000); 
publicVariable "B_defensebudget"; 
};

// Roadblock Mission - This one works differently, and, pending a total re-write, transcends the rules of _svr_ and _MP_ names, as every call is a hybrid of server and client calls. Ignore naming rules below...
A3M_fnc_RoadBlock = {

RBduty=player createSimpleTask ["Move To Checkpoint Duty"]; 
RBduty SetSimpleTaskDescription ["Stand at the checkpoint and perform stop and search checkpoint duties with the authority of the Altis Armed Forces.", "Move To Checkpoint Duty", " Checkpoint C-12N"];
RBduty SetSimpleTaskDestination (getMarkerPos "RBC");
RBduty setTaskState "Assigned"; 
player setCurrentTask RBduty; 
["TaskAssigned", ["Move to C-12 checkpoint. Check map."]] call bis_fnc_showNotification; 

if (isServer) then {

RBtrg= createTrigger ["EmptyDetector", getMarkerPos "RBC"]; 
RBtrg setTriggerArea [20, 20, 0, false]; 
RBtrg setTriggerActivation ["WEST", "PRESENT", false]; 
RBtrg setTriggerType "NONE";
RBtrg setTriggerStatements ["This","[[], 'A3M_fnc_Checkpoint', True, False, False] call BIS_fnc_MP",""]; 

}; 

}; 
A3M_fnc_checkpoint = {

RBduty setTaskState "Succeeded"; 
playMusic "Success"; 
player addRating 100; 
["ScoreAdded",["Checkpoint Reached",100]] call bis_fnc_showNotification;

	if (isServer) then {
	deleteVehicle RBtrg; 
	}; 

RBduty2=player createSimpleTask ["Perform Checkpoint Duty"]; 
RBduty2 SetSimpleTaskDescription ["Wait for cars to stop at the checkpoint and perform stop and search checkpoint duties with the authority of the Altian Government.", "Perform Checkpoint Duty", " Checkpoint C-12N"];
RBduty2 SetSimpleTaskDestination (getMarkerPos "RBC");
RBduty2 setTaskState "Assigned"; 

titleText ["Welcome to the C-12 South Checkpoint. Perform stop and search duties on Altian Nationals. Be suspicious of terroristic threats.", "PLAIN DOWN"];

if (isServer) then {

	_ChkPt = execVM 'Scripts\A3MCheckpoint.sqf';
	waitUntil {scriptDone _ChkPt};
	
		while { (CheckPointActive == 1) } do {
			sleep 5; 
				if ((!alive RBVehD) AND (CPManAlive == 1)) then {
						CPManAlive == 0;
						[ '','RemAllAct',True,False] call BIS_fnc_MP;
						[] call A3M_fnc_handleSol;
						// sleep 10;
				}; 

		};

} else { 
systemChat "A Checkpoint Mission is currently active."; 
}; 

};
A3M_fnc_HandleSol= {

switch (mantype) do {

case "M0": {
systemChat "Oh Noes! No mantype was found. Phantom Exec. Crash, Crash, Crash."; 
sleep 1; 
execVM "scripts\A3MCheckpoint.sqf";
};

case "M1": {
missionspassed= (missionspassed + 1); 
publicVariable "missionspassed"; 
['','A3M_FNC_CRIMMP',True,False] call BIS_fnc_MP;
sleep 1; 
execVM "scripts\A3MCheckpoint.sqf";
};

case "M2": {
missionspassed= (missionspassed + 1); 
publicVariable "missionspassed"; 
RightsViols = (RightsViols+1); 
publicVariable "RightsViols";
['','A3M_FNC_CIVMP',True,False] call BIS_fnc_MP;
sleep 1; 
execVM "scripts\A3MCheckpoint.sqf";
};

case "M3": {
[ '','RemAllAct',True,False] call BIS_fnc_MP;
missionspassed= (missionspassed + 1) ; 
publicVariable "missionspassed";
['','A3M_fnc_TERRMP',True,False] call BIS_fnc_MP;
sleep 5; 
deleteVehicle RBVeh;
sleep 1; 
execVM "scripts\A3MCheckpoint.sqf";
};

case "M4": {
missionspassed= (missionspassed + 1); 
publicVariable "missionspassed";
RightsViols = (RightsViols+1); 
publicVariable "RightsViols"; 
['','A3M_FNC_PRISMP',True,False] call BIS_fnc_MP; 
sleep 1; 
execVM "scripts\A3MCheckpoint.sqf";
};

case "M5": {
missionspassed= (missionspassed + 1); 
publicVariable "missionspassed"; 
sleep 1; 
execVM "scripts\A3MCheckpoint.sqf";
};

default { 
	systemChat "Oh Noes! Mission Crash! Something went horribly wrong, could not determine ManType. Trying Again..."; 
	sleep 1; 
	execVM "scripts\A3MCheckpoint.sqf";
	};

};
}; 
MP_Roadblock_Attitude = {

switch (RAPickedNumber) do { 
//Innocent 1
Case "M0": {
mantype= "M2"; 
removeAllActions RBVeh; 
greet= RBVeh addAction ["Greeting", {Hint "Hello. How are you today sir? Im a Altian Citizen." }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Vehicle Appears Normal"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The vehicle appears clean and in good repair. \n Smells:\n The vehicle doesn't smell of anything at all.  \n Driver Attitude: \n Driver appears calm and cooperative"} ];
search= RBVeh addAction ["Search", {RBVehD LeaveVehicle RBVeh; hint "Officer, is this really needed? I know my rights!"; sleep 2; hint "Searching Car....."; sleep 5; hint "Nothing illegal or interesting was found in the car"; rightsviols= (rightsviols + 1); publicVariable "rightsviols"; getincar= RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; } ]; 
goSouth= RBVeh addAction ["Allow to Proceed", {hint "Thank you sir, I'll be moving on now"; [] Call DoExitStopSouth; }]; 
goNorth= RBveh addAction ["Order To Turn Around", {hint "Are you kidding me? I'm perfectly legal! You are out of your mind, buster! "; [] Call DoExitStopNorth;  }]; 
}; 

// Drunk Driver
Case "M1": {
mantype= "M1"; 
removeAllActions RBVeh; 
RBveh addAction ["Greeting", {Hint "Yeth Thir! I'm...I'mmm...Okay. Yeah I'm Okay.  Fuck YOU okay! Don't judge me. Who are you to judge me? Only GOD can judge me. Or the judge. Who judges the judge? He probably judges himself every day under the bench! " }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Vehicle Appears normal"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The vehicle appears clean and in good repair.  \n Smells: \n The vehicle smells of alcohol and vomit \n Driver Attitude: \n Driver appears Impaired and Uncooperative"} ];
RBveh addAction ["Search", {RBVehD LeaveVehicle RBVeh; hint "I did nothing to you! Why are you judging me like this? Don't judge me! "; sleep 2; hint "Searching Car....."; sleep 5; hint "Found open bottle of Russian vodka"; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; RBVehD addAction ["Arrest for DWI", { mantype= 4; publicVariable "mantype"; Hint "Abreast? Arrest meee? Fuck YOU! You aren't GAWD!"; sleep 2; hint "Escort the Suspect to Altian jail. Alternately, use the Fast Transport option in the action menu to fast travel the suspect to Altian Jail."; sleep 2; [] call A3M_fnc_jailtrigger;}];}];
RBveh addAction ["Allow to Proceed", {hint "Yesh, Yesh it's okay. I'm okay. You're okay. Okay. Bye."; [] Call DoExitStopSouth;}]; 
RBveh addAction ["Order To Turn Around", {hint "Who are YOU to JUDGE ME!! FUCK YOU!! I'll go home and get my box of ROTTEN EGGS! That's what I'LL DO!!"; [] Call DoExitStopNorth;}]; 
}; 

// Drug Runner
Case "M2": {
mantype= "M1";
removeAllActions RBVeh; 
RBveh addAction ["Greeting", {Hint "Hello sir. All is okay here, yes? I am Altian Citizen." }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Anomaly Detected"}]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The Vehicle appears clean and in good repair. \n Smells:\n A faint smell of Anise is radiating from the vehicle.  \n Driver Attitude: \n The driver appears to be quite nervous."} ];
RBveh addAction ["Search", {RBVehD LeaveVehicle RBVeh; hint "I better call my lawyer. I'm not saying anything until my attorney arrives. Oh my God."; sleep 2.0; hint "Searching Car....."; sleep 6; hint "You found a load of cocaine"; sleep 2; hint "Driver: Step out of the vehicle! \n \n If the driver refuses to exit, shoot the vehicle's tires and disable it!";
		RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; 
		RBVehD addAction ["Sir, You are under arrest...", { mantype= "M4"; publicVariable "mantype"; Hint "Oh God...Oh My God....Ohhhh Shit. Fuck...FUCK ME! "; sleep 3.0; hint "Transport the Criminal to Altian Jail. Alternately, use the Fast Transport option in the action menu to fast travel the suspect to Altian Jail."; [] call A3M_fnc_jailtrigger; }];}];	
RBveh addAction ["Allow to Proceed", {hint "Okay...thanks to you sir!"; [] Call DoExitStopSouth;  }]; 
RBveh addAction ["Order To Turn Around", {hint "Okay...No problem officer. I'll just go back where I came from then."; [] Call DoExitStopNorth;} ];  
};

// Illegal Alien
Case "M3": {
mantype= "M1"; 
removeAllActions RBVeh; 
RBveh addAction ["Greeting", {Hint "Allu." }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Vehicle appears normal"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The Vehicle appears dirty and aged. \n Smells:\n The vehicle smells like chewing tobacco. \n Driver Attitude: \n  The driver appears disoriented, but cooperative."} ];
RBveh addAction ["Search", { RBVehD LeaveVehicle RBVeh; hint "Dis No Gut."; sleep 2.0; hint "Searching Car....."; sleep 5; hint "Found Multiple Identifications. Upon further review, the Altian Citizen Number on the Altian ID doesn't check out..."; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh}]; RBVehD addAction ["Arrest for Illegal Immigration", { mantype= "M4"; publicVariable "mantype"; Hint "Fock you mane. You cops are always trying to keepa de mano down!  "; sleep 3.0; hint "Escort the Illegal Alien to Altian Jail. Alternately, use the Fast Transport option in the action menu to fast travel the suspect to Altian Jail."; [] call A3M_fnc_jailtrigger; } ]; } ];
RBveh addAction ["Allow to Proceed", {hint "Peace on you sire"; [] Call DoExitStopSouth;} ]; 
RBveh addAction ["Order To Turn Around", {hint "Eat a deek, bottmonch."; [] Call DoExitStopNorth;} ];
}; 

// Terrorist Attack on checkpoint - carbomb
Case "M4": {
mantype= "M3";
removeAllActions RBVeh; 
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Anomaly Detected!"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Bad1= createGroup East; [RBVeh] joinSilent Bad1; Hint "Visual Inspection: \n The vehicle appears clean, but in disrepair. Wires appear to be protruding from the drivers side door frame. \n Smells:\n The smell of Jet Fuel permeates the air. \n Driver Attitude: \n The driver appears very calm."; } ];
RBveh addAction ["Greeting", {Bad1= createGroup East; [RBVeh] joinSilent Bad1; Hint "Allahu Akbar"; [ '','RemAllAct',True,False] call BIS_fnc_MP; sleep 3; if (alive RBVehD) then { mantype = "M5"; publicVariable "mantype"; bomb = 'Bo_GBU12_LGB' createVehicle getPos RBVeh; hint "TERRORIST ATTACK"; }; } ];
RBveh addAction ["Search", {Bad1= createGroup East; [RBVeh] joinSilent Bad1; Hint "Allahu Akbar"; [ '','RemAllAct',True,False] call BIS_fnc_MP;  sleep 5; if (alive RBVehD) then { mantype = "M5"; publicVariable "mantype"; bomb = 'Bo_GBU12_LGB' createVehicle getPos RBVeh; hint "TERRORIST ATTACK"; }; } ];
RBveh addAction ["Allow to Proceed", {Bad1= createGroup East; [RBVeh] joinSilent Bad1; Hint "Allahu Akbar"; [ '','RemAllAct',True,False] call BIS_fnc_MP; sleep 2; if (alive RBVehD) then { mantype = "M5"; publicVariable "mantype"; bomb = 'Bo_GBU12_LGB' createVehicle getPos RBVeh; hint "TERRORIST ATTACK"; }; } ]; 
RBveh addAction ["Order To Turn Around", {Bad1= createGroup East; [RBVeh] joinSilent Bad1; Hint "Allahu Akbar"; [ '','RemAllAct',True,False] call BIS_fnc_MP;  sleep 2:  if (alive RBVehD) then { mantype = "M5"; publicVariable "mantype"; bomb = 'Bo_GBU12_LGB' createVehicle getPos RBVeh; hint "TERRORIST ATTACK"; }; } ]; 
}; 

// Innocent 2
Case "M5": {
mantype= "M2"; 
removeAllActions RBVeh; 
RBVeh setDamage 0.3; 
RBveh addAction ["Greeting", {Hint "Im an Altian Citizen. What the fuck do you want? Fuck outta my way, bitch!" }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Anomaly Detected"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The Vehicle appears clean, but in disrepair. A single red wire is protruding from under the vehicle. A fluid is dripping on the ground.  \n Smells:\n The vehicle smells of rich burning fuel and exhaust. \n Driver Attitude: \n The driver appears angry and combative"} ];
RBveh addAction ["Search", {RBVehD LeaveVehicle RBVeh; hint "Officer, You're a real fucking prick. I know my rights, fuckhead!!"; sleep 2.0; hint "Searching Car....."; sleep 5; hint "Nothing illegal or interesting was found in the car. Anomaly was a false alert - damaged vehicle. "; rightsviols= (rightsviols + 1); publicVariable "rightsviols"; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; }]; 
RBveh addAction ["Allow to Proceed", {hint "Yeah, that's what I thought. Civil Rights Violatin' muthafuckas!" ; [] Call DoExitStopSouth;}]; 
RBveh addAction ["Order To Turn Around", {hint "Civil Rights Violatin' muthafuckas! I'll have your ass for this!" ;[] Call DoExitStopNorth;}]; 
}; 

// Innocent 3
Case "M6": { 
mantype= "M2";
removeAllActions RBVeh; 
RBveh addAction ["Greeting", {Hint "Hi...I'd like to pass on that ass, please? " }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Vehicle Appears Normal"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The Vehicle appears clean and in good repair. \n Smells:\n The vehicle smells like Strawberries. \n Driver Attitude: \n The driver appears to be feeling snarky."} ];
RBveh addAction ["Search", { RBVehD LeaveVehicle RBVeh; hint "Officer, What the hell? Is this really needed? I know my rights!"; sleep 2.0; hint "Searching Car....."; sleep 10; hint "Nothing illegal or interesting was found in the car"; rightsviols= (rightsviols + 1); publicVariable "rightsviols"; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; } ];  
RBveh addAction ["Allow to Proceed", {hint "Later bitches"; [] Call DoExitStopSouth;} ]; 
RBveh addAction ["Order To Turn Around", {hint "Fuck you bitches. I'm filing a complaint and fucking your mother in the ass!"; [] Call DoExitStopNorth; } ]; 
}; 

//Innocent 4
Case "M7": {
mantype= "M2"; 
removeAllActions RBVeh; 
RBveh addAction ["Greeting", {Hint "I'm an Altian Citizen. Let me pass." }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Anomaly Detected"}]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The Vehicle appears clean and in good repair. \n Smells:\n The vehicle smells of an oil substance. \n Driver Attitude: \n The driver appears uncertain."}];
RBveh addAction ["Search", { RBVehD LeaveVehicle RBVeh; hint "Officer, please, This is insane. Is this really needed? I know my rights!"; sleep 2.0; hint "Searching Car....."; sleep 10; hint "You found a KingCock Double Trouble Dildo. Nothing illegal in this vehicle. "; rightsviols= (rightsviols + 1); publicVariable "rightsviols"; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; } ]; 
RBveh addAction ["Allow to Proceed", {hint "Have a nice day"; [] Call DoExitStopSouth;} ]; 
RBveh addAction ["Order To Turn Around", {hint "Doom on you!"; [] Call DoExitStopNorth;} ]; 
}; 

//Innocent 5
Case "M8": {
mantype= "M2"; 
removeAllActions RBVeh; 
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Anomaly Detected"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The vehicle appears clean and in good repair. \n Smells:\n The vehicle smells sulphuric, like rotten eggs. \n Driver Attitude: \n The drive appears nervous."} ];
RBveh addAction ["Greeting", {Hint "I'm an Altian Citizen. Let me pass. Immediately" }];
RBveh addAction ["Search", { RBVehD LeaveVehicle RBVeh; hint "Officer, This is insane. Is this really needed? I know my rights!"; sleep 2.0; hint "Searching Car....."; sleep 10; hint "Nothing illegal or interesting was found in the car. A suspicious smell turns out to be a rotten sandwich. "; rightsviols= (rightsviols + 1); publicVariable "rightsviols"; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; } ]; 
RBveh addAction ["Allow to Proceed", {hint "Have a good one!"; [] Call DoExitStopSouth;} ]; 
RBveh addAction ["Order To Turn Around", {hint "Eat shit, dickbag!"; [] Call DoExitStopNorth;} ]; 
}; 

// Innocent 6
Case "M9": {
mantype= "M2"; 
removeAllActions RBVeh; 
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Vehicle Appears Normal"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The Vehicle appears to have excessive junk in the back. \n Smells:\n The vehicle smells strongly of wintergreen air freshener. \n Driver Attitude: \n The driver appears nervous."} ];
RBveh addAction ["Greeting", {Hint "I'm an Altian Citizen. Let me pass." }];
RBveh addAction ["Search", { RBVehD LeaveVehicle RBVeh; hint "Officer, What the fuck. You gonna ask me to suck your cock next?"; sleep 2.0; hint "Searching Car....."; sleep 10; hint "Nothing illegal or interesting was found in the car. A suspicious smell turns out to be a moldy gym sock. "; rightsviols= (rightsviols + 1); publicVariable "rightsviols"; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; } ]; 	
RBveh addAction ["Allow to Proceed", {[] Call DoExitStopSouth; hint "Have a good day!" } ]; 
RBveh addAction ["Order To Turn Around", {[] Call DoExitStopNorth; hint "Oh, that's fucking great. Thanks bitch!" } ]; 
}; 

// Foiled  Terrorist Attack
Case "M10": {
mantype= "M3"; 
removeAllActions RBVeh; 
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Anomaly Detected"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The Vehicle appears to have wires slightly protruding from the grill. \n Smells:\n The vehicle smells of alcohol or paint thinner \n Driver Attitude: \n The driver appears fidgety."} ];
RBveh addAction ["Greeting", {Hint "Hello! I'm an Altian Citizen." }];
RBveh addAction ["Search", {Bad1= createGroup East; [RBVeh] joinSilent Bad1; hint "You stupid fuck. I'll kill you. Allahu Akbar."; [ '','RemAllAct',True,False] call BIS_fnc_MP; sleep 2.0; if (alive RBVehD) then { mantype = "M5"; publicVariable "mantype"; bomb = 'Bo_GBU12_LGB' createVehicle getPos RBVeh; hint "TERRORIST ATTACK"; }; } ]; 
RBveh addAction ["Allow to Proceed", {[] call DoExitStopSouth; hint "You live to fight another day, infidel!"; } ]; 
RBveh addAction ["Order To Turn Around", {[] call DoExitStopNorth; hint "Fuck you infidels!";} ]; 
}; 

// Heroin Runner
Case "M11": {
mantype= "M1"; 
removeAllActions RBVeh; 
greet= RBVeh addAction ["Greeting", {Hint "How are you today sir. Im an Altian Citizen." }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Anomaly Detected"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The vehicle appears clean and in good repair. \n Smells:\n The vehicle doesn't smell of anything at all.  \n Driver Attitude: \n Driver appears calm and cooperative"} ];
search= RBVeh addAction ["Search", {RBVehD LeaveVehicle RBVeh; hint "Officer, is this really needed? This is just stupid. I know my rights! Call my lawyer! "; hint "Searching Car....."; sleep 6; hint "You found a load of heroin."; sleep 2; hint "Driver: Step out of the vehicle! \n \n If the driver refuses to exit, shoot the vehicle's tires and disable it!"; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; RBVehD addAction ["Sir, You are under arrest...", { mantype= "M4"; publicVariable "mantype"; Hint "Oh Mother of God. I've really done it now."; sleep 3.0; hint "Transport the Criminal to Altian Jail.  Alternately, use the Fast Transport option in the action menu to fast travel the suspect to Altian Jail.";[] call A3M_fnc_jailtrigger;}];}]; 
goSouth= RBVeh addAction ["Allow to Proceed", {hint "Thank you sir, I'll be moving on now"; [] Call DoExitStopSouth; }];  
goNorth= RBveh addAction ["Order To Turn Around", {hint "Are you kidding me? But...that's where I CAME from! "; [] Call DoExitStopNorth;}]; 
}; 

}; 
};
RemAllAct = {
removeAllActions RBVeh;
removeAllActions RBVehD; 
}; 
DoExitStopSouth = {

// Remove Options from Vehicle (Encounter Complete) 
[ '','RemAllAct',True,False] call BIS_fnc_MP;

// Get fucking going...
[RBVeh] joinSilent (group Sam); 
RBVeh doMove (getMarkerPos "RBStage2");

// Add to missions passed counter
sleep 10; 
mantype= "M5"; 
publicVariable "mantype";
sleep 5; 
deleteVehicle RBVeh;
deleteVehicle RBVehD; 
}; 
DoExitStopNorth = {
// Remove Options from Vehicle (Encounter Complete) 
[ '','RemAllAct',True,False] call BIS_fnc_MP;
// Get fucking going...
[RBVeh] joinSilent (group hector); 
RBVeh doMove (getMarkerPos "RBStage1");
// Add to missions passed counter
sleep 10; 
mantype= "M5"; 
publicVariable "mantype";
sleep 5; 
deleteVehicle RBVeh;
deleteVehicle RBVehD; 
}; 
A3M_fnc_jailtrigger= {
[ '','RemAllAct',True,False] call BIS_fnc_MP;
deleteVehicle RBVeh; 
MJMP= createTrigger ["EmptyDetector", getMarkerPos "AAF_Jail"]; 
MJMP setTriggerArea [15, 15, 0, false]; 
MJMP setTriggerActivation ["ANY", "PRESENT", True]; 
MJMP setTriggerType "NONE";
MJMP setTriggerStatements ["RBVehD in ThisList", "[] call A3M_fnc_booked", ""]; 
MoveToJail = MJMP; 
PublicVariable "MoveToJail"; 
[ '','A3M_fnc_jailtask',True,False] call BIS_fnc_MP;
}; 
A3M_Booked_MP = {
hint "Prisoner has been booked into Altian Police Custody. Thank you!";
ALTEscort setTaskState "Succeeded";  
playMusic "Success";
mantype = "M0";
}; 
A3M_fnc_booked= {
RBVehD setPos (GetMarkerPos "AAF_Jail"); 
deleteVehicle MoveToJail; 
mantype= "M5";
publicVariable "mantype"; 
deleteVehicle RBVehD; 
['','A3M_Booked_MP',True,False] call BIS_fnc_MP;

};
A3M_fnc_jailtask= {
deleteVehicle RBVeh; 
hint "Suspect's Vehicle has been Impounded"; 
ALTEscort=player createSimpleTask ["Escort Prisoner to Altian Jail"]; 
ALTEscort SetSimpleTaskDescription ["Escort the Altian Law Breaker to Altian Jail.", "Jail Transport", "Altian Jail"];
ALTEscort SetSimpleTaskDestination (getMarkerPos "AAF_Jail");
ALTEscort setTaskState "Assigned"; 
player setCurrentTask ALTEscort; 
playMusic "Assigned";
["TaskAssigned", ["Escort the law breaker to jail."]] call bis_fnc_showNotification; 
RBVehD addAction ["Fast Transport", {[] call A3M_fnc_booked} ]; 
}; 
A3M_FNC_PRISMP= { 
["TaskFailed", ["The prisoner has been killed in custody."]] call bis_fnc_showNotification; 
ALTEscort setTaskState "Failed"; 
mantype = "M0";
}; 
A3M_FNC_CIVMP= {
removeAllActions RBVeh; 
["TaskFailed", ["The Driver has been killed."]] call bis_fnc_showNotification; 
hint "This is a major civil rights violation. Expect backlash! "; 
mantype = "M0";
}; 
A3M_fnc_TerrMP= {
["TaskDone", ["The Terrorist has been killed."]] call bis_fnc_showNotification;
hint "The terrorist has been neutralized. Great Job. The shooting was in policy, and the terrorist was killed before he could detonate a very lethal bomb.";
mantype = "M0";
};
A3M_FNC_CRIMMP= {
["InformationRed", ["The suspect has been neutralized."]] call bis_fnc_showNotification;
hint "The shooting will come under investigation by command staff, but for your moral sake, we hope it was an in policy shooting. You know the truth in your heart."; 
mantype = "M0";
};
A3M_fnc_rbmissionend = { 

if (CheckPointActive == 1) then {
["TaskDone", ["Checkpoint Duty Shift Completed."]] call bis_fnc_showNotification;
["ScoreAdded",["Performed Checkpoint Shift",1500]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $150,000.00"]] call bis_fnc_showNotification;

hint format ["Checkpoint Duty Complete. \n \n You had %1 Rights Violation Complaints. \n ~ Altis Government HR", rightsviols];
RBduty2 setTaskState "Succeeded";
player addRating 1500;
}; 

CheckpointActive = 0; 
MissionActive = 0; 

[0] call A3M_Fnc_Cleanup;
sleep 2; 

if (isServer) then {
B_DefenseBudget = (B_DefenseBudget + 150000);
publicVariable "B_DefenseBudget"; 
}; 

player setCurrentTask CO1;

};
A3M_msn_chkpt = {

if (IsServer) then {

	if isNil "MissionActive" then { 
	MissionActive = 0; 
	publicVariable "MissionActive"; 
	}; 

	if (MissionActive == 0) then {

		MissionActive = 1; 
		publicVariable "MissionActive"; 

		if (isNil "CheckpointActive") then {CheckpointActive = 0};

		if (CheckpointActive == 0) then {

			CheckpointActive = 1;
			publicVariable "CheckpointActive"; 

			RightsViols= 0; 
			publicVariable "RightsViols"; 

			missionspassed = 0; 
			publicVariable "missionspassed"; 

			[ '','A3M_fnc_RoadBlock',True,False] call BIS_fnc_MP;

			}; 
			
	} else {systemChat "A Mission of this type is already active, and cannot be duplicated."}; 
	
  } else {systemChat "A Checkpoint Mission has been activated. "};
}; 
// End of Roadblock Debacle. Seriously, at some point, I need to re-write this with what I know now. The checkpoint was a helluva learning experience in it's time, and now, It's time to update it. Soon...Soon. 