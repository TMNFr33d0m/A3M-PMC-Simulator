/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/    


Email Based Mission Deployment System (EBDMS) V 1.0 by Cody Salazar AKA Fr33d0m 
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

My wife, for not only supporting my modding ventures, but actually jumping in and helping with mods when she can. What a gal! 

And last, but definitely not least, the A3 community, who through over 250+ encouraging messages highly encouraged me to continue this project. I'm glad you like it, 
and I hope you enjoy the things I have in the works! 

################################## LET US BEGIN #################################### */

disableSerialization;
debug = 1; 

///////////////////////////////////////////////////////////////////////////////////////////
// Open Dialog
_handle= CreateDialog "A3M_VMS";
//playMusic "gearup"; 

///////////////////////////////////////////////////////////////////////////////////////////
//Menu Music Killer
//A3M_fnc_silence = {
//playMusic ""; 
//};
 
DoAddMissions = {
lbClear 1905; 
_index0= lbAdd [1905,"V.I.P. Escort Contract"];
_index1= lbAdd [1905,"High Value Shipment Escort / Delivery Contract"]; 
_index2= lbAdd [1905,"Traffic Enforcement Checkpoint Contract"]; 
_index3= lbAdd [1905,"Hostage Rescue Contract"]; 
_index4= lbAdd [1905,"Terrorist Cell Raid I (Assault Compound)"]; 
_index5= lbAdd [1905,"Terrorist Cell Raid II (Assault City)"]; 
_index6 = lbAdd [1905,"*Urgent* Stranded unit requires E&E support"]; 
_index7 = lbAdd [1905,"Premise Security Shift (T-9 Facility)"]; 
};

[]call doAddMissions;

// Mission Functions below: 
A3M_msn_VIPEscort = {

if (isNil "EscortActive") then { EscortActive = 0; };

if (EscortActive == 0) then {

MissionStatus= "M1"; 
PublicVariable "MissionStatus"; 
hint "Mission Accepted";
playSound "MissionAccepted"; 
EscortActive = 1; 
publicVariable "EscortActive"; 
HVTposarray = ["HVTpos1", "HVTpos2", "HVTpos3", "HVTpos4", "HVTpos5", "HVTpos6", "HVTpos7", "HVTpos8", "HVTpos9"];
HVTDestination= HVTposarray select floor random count HVTposarray;
sleep 1.0; 
PublicDestination= HVTDestination;
publicVariable "PublicDestination"; 
["","A3M_fnc_EscortTask",True,False] spawn BIS_fnc_MP; 


EnChance = [1, 0, 0, 0, 0, 0, 0, 1, 0, 0];
EnPres= EnChance select floor random count EnChance;
if (EnPres == 1) then {
_HVTen= [getMarkerPos "PublicDestination", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F"]] call BIS_fnc_spawnGroup;
[_HVTen, getMarkerPos "PublicDestination"] call BIS_fnc_taskDefend; 
}; 

A3M_fnc_DestinationTrigger = {
VIPDest= createTrigger ["EmptyDetector", getMarkerPos PublicDestination]; 
VIPDest setTriggerArea [10, 10, 0, false]; 
VIPDest setTriggerActivation ["ANY", "PRESENT", True]; 
VIPDest setTriggerType "NONE";
VIPDest setTriggerStatements ["VIP1 in thislist", "[] call A3M_fnc_EscortSuccess", "" ]; 
}; 

A3M_fnc_DeathTrigger = {
VIPDead= createTrigger ["EmptyDetector", getMarkerPos PublicDestination]; 
VIPDead setTriggerArea [0, 0, 0, false]; 
VIPDead setTriggerActivation ["ANY", "PRESENT", True]; 
VIPDead setTriggerType "NONE";
VIPDead setTriggerStatements ["!Alive VIP1", "[] call A3M_EscortFailed", ""]; 
}; 

"C_Nikos_aged" createUnit [getPos Player, group player, "VIP1 = this", 0.9, "COLONEL" ];

call A3M_fnc_DestinationTrigger;
call A3M_fnc_DeathTrigger; 

while {EscortActive == 1} do {"VIP1ICO" setmarkerpos getpos VIP1; sleep 0.5;};



}
else 
{ hint "An Escort Mission is currently active. You must wait until the escort mission is completed before you can start another" }; 

};
// Next Mission Set
// *********************#################************************

A3M_msn_TRKEscort = {
if (isNil "ConvoyActive") then {convoyActive = 0}; 

if (convoyActive == 0) then {
MissionStatus = "M2"; 
PublicVariable "MissionStatus"; 

hint "Mission Accepted";
playSound "MissionAccepted"; 

ConveyActive = 1; 
publicVariable "ConvoyActive"; 
DELposarray = ["DELpos1", "DELpos2", "DELpos3", "DELpos4", "DELpos5", "DELpos6", "DELpos7", "DELpos8", "DELpos9"];
DelDestination= DELposarray select floor random count DELposarray;
sleep 1.0; 
PubDelDestination=DelDestination;
publicVariable "PubDelDestination"; 

EnChance = [1, 0, 0, 0, 0, 0, 0, 1, 0, 0];
EnPres= EnChance select floor random count EnChance;
if (EnPres == 1) then {
_HVTen= [getMarkerPos "PubDelDestination", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F"]] call BIS_fnc_spawnGroup;
[_HVTen, getMarkerPos "PubDelDestination"] call BIS_fnc_taskDefend; 
}; 

A3M_fnc_DelDestinationTrigger = {
DelDest= createTrigger ["EmptyDetector", getMarkerPos PubDelDestination]; 
DelDest setTriggerArea [10, 10, 0, false]; 
DelDest setTriggerActivation ["ANY", "PRESENT", True]; 
DelDest setTriggerType "NONE";
DelDest setTriggerStatements ["DEL1 in thislist", "[] call A3M_fnc_ConvoySuccess", ""]; 
}; 

A3M_fnc_DelDeathTrigger = {
DelDead= createTrigger ["EmptyDetector", getMarkerPos PubDelDestination]; 
DelDead setTriggerArea [0, 0, 0, false]; 
DelDead setTriggerActivation ["ANY", "PRESENT", True]; 
DelDead setTriggerType "NONE";
DelDead setTriggerStatements ["!Alive DEL1", "[] call A3M_fnc_ConvoyFailed", ""]; 
}; 

DEL1 = "C_Van_01_box_F" createVehicle (getMarkerPos "deltruck");

call A3M_fnc_DelDestinationTrigger;
call A3M_fnc_DelDeathTrigger; 

["","A3M_fnc_ConvoyTask",True,False] spawn BIS_fnc_MP; 

}
else 
{ hint "A Convoy Mission is currently active. You must wait until the convoy mission is completed before you can start another." }; 

};

// Next Mission Set
// *********************#################***********************
A3M_msn_chkpt = {

if (isServer) then {

if isNil "MissionActive" then { MissionActive = 0; publicVariable "MissionActive"; }; 

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
} else { hint "An Roadblack Shift already underway." }; 
}; 
}; 

// Next Mission Set
// *********************#################***********************
A3M_msn_SandE= {
if (isNil "SEActive") then {SEActive = 0}; 
 
if (SEActive == 0) then {
SEActive = 1; 
PublicVariable "SEActive"; 
MissionStatus = "M4"; 
publicVariable "MissionStatus"; 

SEARRAY= ["SE1", "SE2", "SE3", "SE4", "SE5", "SE6", "SE7", "SE8", "SE9"]; 
SELOC= SEARRAY select floor random count SEARRAY; 
sleep 1; 

publicLoc= SELOC; 
publicVariable publicLoc; 

hint "Mission Accepted"; 
playSound "MissionAccepted"; 
//hint format ["The location picked was %1", publicLoc]; 
A3M_fnc_SEVIPDead = {
SARDead= createTrigger ["EmptyDetector", (getMarkerPos PublicLoc)]; 
SARDead setTriggerArea [0, 0, 0, false]; 
SARDead setTriggerActivation ["ANY", "PRESENT", True]; 
SARDead setTriggerType "NONE";
SARDead setTriggerStatements ["!Alive SAR1", "[] call A3M_fnc_SEFailed;", ""]; 
}; 

A3M_fnc_SEVIPSaved = {
SAResc= createTrigger ["EmptyDetector", (getMarkerPos "BA")]; 
SAResc setTriggerArea [30, 30, 0, false]; 
SAResc setTriggerActivation ["ANY", "PRESENT", True]; 
SAResc setTriggerType "NONE";
SAResc setTriggerStatements ["SAR1 in ThisList", "[] call A3M_fnc_SESucceeded;", ""]; 
}; 

"C_Nikos_aged" createUnit [getMarkerPos PublicLoc, group CO, "SAR1 = this", 0.9, "COLONEL" ];
sleep 1; 
(group SAR1) setBehaviour "CARELESS"; 
sleep 0.5; 
[] call A3M_fnc_SEVIPDead; 
[] call A3M_fnc_SEVIPSaved; 
sleep 1; 

SAR1 addAction ["Come With Me" , {
_subject = _this select 0;
_ply = _this select 1;
_subject setCaptive true;
sleep 0.5;
[_subject] joinSilent player;
[ '','A3M_fnc_ChangeSARDest',True,False] spawn BIS_fnc_MP;

} ];

_HSTF= [getPos SAR1, EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;

[_HSTF, getPos SAR1] call BIS_fnc_taskDefend; 

[ '','A3M_fnc_SARmission',True,False] spawn BIS_fnc_MP;

while {SEActive == 1} do {"SAR1ICO" setmarkerpos getpos SAR1; sleep 0.5;};

// End of main If Statement
} else { hint "A Snatch and Extract Mission is already in progress. You must wait until the current Snatch and Extract operation is completed before you can start"}; 

};

// Next Mission Set
// *********************#################***********************

// Raid Mission  1
A3M_fnc_RaidClear = {
[ '','A3M_fnc_RaidClearMP',True,False] spawn BIS_fnc_MP;
B_defensebudget= (B_defensebudget + 2000000); 
publicVariable "B_defensebudget"; 
MissionStatus = "M0"; 
publicVariable "MissionStatus";
raid1Active = 0; 
publicVariable "raid1Active"; 
deleteVehicle Raid1Win; 
}; 

A3M_msn_Raid1= {

if (isNil "raid1Active") then {raid1Active= 0}; 

if (raid1Active == 0) then { 
hint "Mission Accepted"; 
playSound "MissionAccepted"; 

MissionStatus = "M5"; 
publicVariable "MissionStatus";

raid1Active = 1; 
publicVariable "raid1Active"; 
sleep 2; 

// Create Enemy Presence
_GH1tm= [getMarkerPos "GH1", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH1tm, getMarkerPos "GH1"] call BIS_fnc_taskDefend; 

_GH2tm= [getMarkerPos "GH2", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH2tm, getMarkerPos "GH2"] call BIS_fnc_taskDefend; 

_GH3tm= [getMarkerPos "GH3", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH3tm, getMarkerPos "GH3"] call BIS_fnc_taskDefend; 

_GH4tm= [getMarkerPos "GH4", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH4tm, getMarkerPos "sg1"] call BIS_fnc_taskDefend; 

_GH5tm= [getMarkerPos "GH5", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH5tm, getMarkerPos "GH5"] call BIS_fnc_taskDefend; 

_GH6tm= [getMarkerPos "GH6", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH6tm, getMarkerPos "GH6"] call BIS_fnc_taskDefend; 

[ '','A3M_Raid_1MP',True,False] spawn BIS_fnc_MP;
Raid1Win= createTrigger ["EmptyDetector", (getMarkerPos "sg1")]; 
Raid1Win setTriggerArea [450, 450, 0, false]; 
Raid1Win setTriggerActivation ["WEST SEIZED", "EAST D", false]; 
Raid1Win setTriggerType "NONE";
Raid1Win setTriggerStatements ["this", "[] call A3M_fnc_RaidClear;", ""]; 
} else { hint "A raid is currently underway. Contact your team coordinator for information and possible assignment on this objective."}; 

}; 

// 


// Raid 2 
A3M_msn_Raid2= {

if (isNil "raid2Active") then {raid2Active= 0}; 

if (raid2Active == 0) then { 
hint "Mission Accepted"; 
playSound "MissionAccepted"; 

MissionStatus = "M6"; 
publicVariable "MissionStatus";

raid2Active = 1; 
publicVariable "raid2Active"; 
sleep 2; 

// Create Enemy Presence
_GH1tm= [getMarkerPos "RO1", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH1tm, getMarkerPos "RO1"] call BIS_fnc_taskDefend; 

_GH2tm= [getMarkerPos "RO2", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH2tm, getMarkerPos "RO2"] call BIS_fnc_taskDefend; 

_GH3tm= [getMarkerPos "RO3", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH3tm, getMarkerPos "RO3"] call BIS_fnc_taskDefend; 

_GH4tm= [getMarkerPos "RO4", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH4tm, getMarkerPos "sg2"] call BIS_fnc_taskDefend; 

_GH5tm= [getMarkerPos "RO5", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH5tm, getMarkerPos "RO5"] call BIS_fnc_taskDefend; 

_GH6tm= [getMarkerPos "RO6", EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
[_GH6tm, getMarkerPos "RO6"] call BIS_fnc_taskDefend; 

[ '','A3M_Raid_2MP',True,False] spawn BIS_fnc_MP;

Raid1Win= createTrigger ["EmptyDetector", (getMarkerPos "sg2")]; 
Raid1Win setTriggerArea [450, 450, 0, false]; 
Raid1Win setTriggerActivation ["WEST SEIZED", "EAST D", false]; 
Raid1Win setTriggerType "NONE";
Raid1Win setTriggerStatements ["this", "[] call A3M_fnc_RaidClear;", ""]; 
} else { hint "A raid is currently underway. Contact your team coordinator for information and possible assignment on this objective."}; 

}; 
// Next Mission Set
// *********************#################***********************
A3M_msn_reinforce = {

if (isNil "NSARActive") then {NSARActive= 0}; 

if (NSARActive == 0) then { 
hint "Mission Accepted"; 
playSound "MissionAccepted"; 
MissionStatus = "M7"; 
publicVariable "MissionStatus";
NSARActive = 1; 
publicVariable "NSARActive"; 
sleep 1; 
execVM "scripts\nsar.sqf"; 

} else { hint "A NATO Extraction Support is currently underway. Contact your team coordinator for information and possible assignment on this objective."}; 
}; 
// Next Mission Set
// *********************#################***********************
A3M_msn_T9sec = {
if (isNil "T9Active") then {T9Active= 0}; 

if (T9Active == 0) then { 
hint "Mission Accepted"; 
playSound "MissionAccepted"; 
MissionStatus = "M8"; 
publicVariable "MissionStatus";
T9Active = 1; 
publicVariable "T9Active"; 
sleep 1; 
timearrayCounter = 0; 
execVM "scripts\T9.sqf"; 

} else { hint "A security force is currently working a shift at the T9 facility. Contact your team coordinator for information and possible assignment on this objective."}; 
}; 

// Handle Click On Emails
A3M_fnc_Email = {

TheSelection = _this select 1; 

//hint format ["Email Handle Click Activated. Variable passed was %1", TheSelection]; }; 
hint "Email Selected. Click *Accept Contract* to begin selected mission.";

switch (TheSelection) do {

case 0: {
((findDisplay 1420) displayCtrl 1200) ctrlSetText "images\M1.paa";
}; 

case 1: { 
((findDisplay 1420) displayCtrl 1200) ctrlSetText "images\M2.paa";
}; 

case 2: {
((findDisplay 1420) displayCtrl 1200) ctrlSetText "images\M3.paa";
}; 

case 3: {
((findDisplay 1420) displayCtrl 1200) ctrlSetText "images\M4.paa";
}; 

case 4: {
((findDisplay 1420) displayCtrl 1200) ctrlSetText "images\M5.paa";
};

case 5: {
((findDisplay 1420) displayCtrl 1200) ctrlSetText "images\M6.paa";
};

case 6: {
((findDisplay 1420) displayCtrl 1200) ctrlSetText "images\M7.paa";
}; 

case 7: { 
((findDisplay 1420) displayCtrl 1200) ctrlSetText "images\M8.paa";
}; 

}; 

}; 

A3M_Fnc_AcceptMission = {

switch (TheSelection) do {

case 0: {
[] spawn A3M_msn_VIPEscort; 
}; 

case 1: { 
[] spawn A3M_msn_TRKEscort;
}; 

case 2: {
[] call A3M_msn_chkpt; 
}; 

case 3: {
[] spawn A3M_msn_SandE; 
}; 

case 4: {
[] spawn A3M_msn_Raid1; 
};

case 5: {
[] spawn A3M_msn_Raid2; 
};

case 6: {
[] spawn A3M_msn_reinforce;
}; 

case 7: { 
[] spawn A3M_msn_T9sec; 
}; 

}; 
}; 

// EOF 