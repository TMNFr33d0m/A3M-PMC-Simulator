// MISSION PREDEFINES

// Cleanup Script
coroner = {
{ if (!alive _x) then { deletevehicle _x } } foreach (nearestObjects [center, ["Man", "Car", "Tank", "Helicopter"], 2600]);
}; 
// Server Side Scripting (Things Only The Server Should Be Doing)

A3M_Svr_VIPEscort = {

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
["","A3M_fnc_EscortTask",True,False] spawn BIS_fnc_MP; 

// Random chance of enemy presence at Destination

EnChance = [1, 0, 0, 0, 0, 0, 0, 1, 0, 0];
EnPres= EnChance select floor random count EnChance;

// Create Cadre on Random Chance (Contains Leights Opfor)
if (EnPres == 1) then {
_HVTen= [getMarkerPos "PublicDestination", EAST, ["OP_ChDKZ_Infantry_Rifleman", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_GL", "LOP_ChDKZ_Infantry_Corpsman"]] call BIS_fnc_spawnGroup;
[_HVTen, getMarkerPos "PublicDestination"] call BIS_fnc_taskDefend; 
}; 

// Create Trigger For Mission Completion (Deliver VIP To Trigger)
A3M_fnc_DestinationTrigger = {

VIPDest= createTrigger ["EmptyDetector", getMarkerPos PublicDestination]; 
VIPDest setTriggerArea [12, 12, 0, false]; 
VIPDest setTriggerActivation ["ANY", "PRESENT", True]; 
VIPDest setTriggerType "NONE";
VIPDest setTriggerStatements ["VIP1 in thislist", "[] spawn A3M_fnc_EscortSuccess", "" ]; 

}; 

// Create trigger to handle VIP Death
A3M_fnc_DeathTrigger = {

VIPDead= createTrigger ["EmptyDetector", getMarkerPos PublicDestination]; 
VIPDead setTriggerArea [0, 0, 0, false]; 
VIPDead setTriggerActivation ["ANY", "PRESENT", True]; 
VIPDead setTriggerType "NONE";
VIPDead setTriggerStatements ["!Alive VIP1", "[] call A3M_EscortFailed", ""]; 

}; 

[] call A3M_fnc_DestinationTrigger;
[] call A3M_fnc_DeathTrigger; 

while {EscortActive == 1} do {"VIP1ICO" setmarkerpos getpos VIP1; sleep 0.5;};

};

A3M_Svr_TRKEscort = {

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
_HVTen= [getMarkerPos "PubDelDestination", EAST, ["OP_ChDKZ_Infantry_Rifleman", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_GL", "LOP_ChDKZ_Infantry_Corpsman"]] call BIS_fnc_spawnGroup;
[_HVTen, getMarkerPos "PubDelDestination"] call BIS_fnc_taskDefend; 
}; 

// Create Trigger to Handle Mission Success
A3M_fnc_DelDestinationTrigger = {
DelDest= createTrigger ["EmptyDetector", getMarkerPos PubDelDestination]; 
DelDest setTriggerArea [10, 10, 0, false]; 
DelDest setTriggerActivation ["ANY", "PRESENT", True]; 
DelDest setTriggerType "NONE";
DelDest setTriggerStatements ["DEL1 in thislist", "[] spawn A3M_fnc_ConvoySuccess", ""]; 
}; 

// Create Trigger to handle mission failure
A3M_fnc_DelDeathTrigger = {
DelDead= createTrigger ["EmptyDetector", getMarkerPos PubDelDestination]; 
DelDead setTriggerArea [0, 0, 0, false]; 
DelDead setTriggerActivation ["ANY", "PRESENT", True]; 
DelDead setTriggerType "NONE";
DelDead setTriggerStatements ["!Alive DEL1", "[] call A3M_fnc_ConvoyFailed", ""]; 
}; 

// Create Box Truck for Delivery
DEL1 = "C_Van_01_box_F" createVehicle (getMarkerPos "deltruck");

// Call creation of triggers
call A3M_fnc_DelDestinationTrigger;
call A3M_fnc_DelDeathTrigger; 

// Create Task for all players
["","A3M_fnc_ConvoyTask",True,False] spawn BIS_fnc_MP; 


};

A3M_Svr_SandE= {

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
SARDead setTriggerStatements ["!Alive SAR1", "[] call A3M_fnc_SEFailed;", ""]; 
}; 

A3M_fnc_SEVIPSaved = {
SAResc= createTrigger ["EmptyDetector", (getMarkerPos "BA")]; 
SAResc setTriggerArea [30, 30, 0, false]; 
SAResc setTriggerActivation ["ANY", "PRESENT", True]; 
SAResc setTriggerType "NONE";
SAResc setTriggerStatements ["SAR1 in ThisList", "[] call A3M_fnc_SESucceeded;", ""]; 
}; 

// Random Select Hostage 
RandomVIP2= ["C_Nikos_aged","LOP_CHR_Civ_Functionary_01","LOP_CHR_Civ_Doctor_01","LOP_CHR_Civ_Profiteer_01","C_scientist_F" ];
RandomVIPSel2= RandomVIP2 select floor random count RandomVIP2;

RandomVIPSel2 createUnit [getMarkerPos PublicLoc, group CO, "SAR1 = this", 0.9, "COLONEL" ];
sleep 1; 
(group SAR1) setBehaviour "CARELESS"; 
sleep 0.5; 

SAR1 addAction ["Come With Me" , {
		_subject = _this select 0;
		_ply = _this select 1;
		_subject setCaptive true;
		sleep 0.5;
		[_subject] joinSilent player;
		[ '','A3M_fnc_ChangeSARDest',True,False] spawn BIS_fnc_MP;
	}];  

[] call A3M_fnc_SEVIPDead; 
[] call A3M_fnc_SEVIPSaved; 

sleep 1; 

// Create Hostage Takers / Captors (Contains Leights Opfor)
_HSTF= [getPos SAR1, EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_HSTF, getPos SAR1] call BIS_fnc_taskDefend; 

[ '','A3M_fnc_SARmission',True,False] spawn BIS_fnc_MP;

while {SEActive == 1} do {"SAR1ICO" setmarkerpos getpos SAR1; sleep 0.5;};

};

A3M_Svr_Raid1={

MissionStatus = "M5"; 
publicVariable "MissionStatus";

raid1Active = 1; 
publicVariable "raid1Active"; 

// Create Enemy Presence (Contains Leights Opfor)
_GH1tm= [getMarkerPos "GH1", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH1tm, getMarkerPos "GH1"] call BIS_fnc_taskDefend; 

_GH2tm= [getMarkerPos "GH2", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH2tm, getMarkerPos "GH2"] call BIS_fnc_taskDefend; 

_GH3tm= [getMarkerPos "GH3", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH3tm, getMarkerPos "GH3"] call BIS_fnc_taskDefend; 

_GH4tm= [getMarkerPos "GH4", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH4tm, getMarkerPos "sg1"] call BIS_fnc_taskDefend; 

_GH5tm= [getMarkerPos "GH5", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH5tm, getMarkerPos "GH5", 200] call BIS_fnc_taskPatrol; 

_GH6tm= [getMarkerPos "GH6", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH6tm, getMarkerPos "GH6", 200] call BIS_fnc_taskPatrol; 

[ '','A3M_Raid_1MP',True,False] spawn BIS_fnc_MP;

Raid1Win= createTrigger ["EmptyDetector", (getMarkerPos "sg1")]; 
Raid1Win setTriggerArea [250, 250, 0, false]; 
Raid1Win setTriggerActivation ["WEST SEIZED", "EAST D", false]; 
Raid1Win setTriggerType "NONE";
Raid1Win setTriggerStatements ["this", "[] call A3M_fnc_RaidClear;", ""]; 

};

A3M_Svr_Raid2 = {

MissionStatus = "M6"; 
publicVariable "MissionStatus";

raid2Active = 1; 
publicVariable "raid2Active"; 

// Create Enemy Presence (Contains Leights Opfor)
_GH1tm= [getMarkerPos "RO1", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH1tm, getMarkerPos "RO1"] call BIS_fnc_taskDefend; 

_GH2tm= [getMarkerPos "RO2", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH2tm, getMarkerPos "RO2"] call BIS_fnc_taskDefend; 

_GH3tm= [getMarkerPos "RO3", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH3tm, getMarkerPos "RO3"] call BIS_fnc_taskDefend; 

_GH4tm= [getMarkerPos "RO4", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH4tm, getMarkerPos "sg2"] call BIS_fnc_taskDefend; 

_GH5tm= [getMarkerPos "RO5", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH5tm, getMarkerPos "RO5"] call BIS_fnc_taskDefend; 

_GH6tm= [getMarkerPos "RO6", EAST, ["LOP_ChDKZ_Infantry_TL", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_Engineer", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Marksman", "LOP_ChDKZ_Infantry_GL"]] call BIS_fnc_spawnGroup;
[_GH6tm, getMarkerPos "RO6"] call BIS_fnc_taskDefend; 

[ '','A3M_Raid_2MP',True,False] spawn BIS_fnc_MP;

Raid2Win= createTrigger ["EmptyDetector", (getMarkerPos "sg2")]; 
Raid2Win setTriggerArea [450, 450, 0, false]; 
Raid2Win setTriggerActivation ["WEST SEIZED", "EAST D", false]; 
Raid2Win setTriggerType "NONE";
Raid2Win setTriggerStatements ["this", "[] call A3M_fnc_RaidClear;", ""]; 

};

A3M_Svr_reinforce= {

MissionStatus = "M7"; 
publicVariable "MissionStatus";

NSARActive = 1; 
publicVariable "NSARActive"; 

sleep 1; 
execVM "scripts\nsar.sqf"; 

};

A3M_Svr_T9sec={

MissionStatus = "M8"; 
publicVariable "MissionStatus";

T9Active = 1; 
publicVariable "T9Active"; 

sleep 1; 
timearrayCounter = 0; 

// May need to move this to server side only, might be executing wrong 
execVM "scripts\T9.sqf"; 

};

// Escort Mission Pre-Defines:"

A3M_fnc_EscortTask = {

VIPEscort=player createSimpleTask ["Escort VIP"]; 
VIPEscort SetSimpleTaskDescription ["Escort the Astral Corporation Executive to his Destination. Protect him at all costs.", "Escort VIP", "VIP's Destination"];
VIPEscort SetSimpleTaskDestination (getMarkerPos PublicDestination);
VIPEscort setTaskState "Assigned"; 
player setCurrentTask VIPEscort; 

playMusic "Assigned";

["TaskAssigned", ["Escort the VIP to his destination. See map."]] call bis_fnc_showNotification;

};

A3M_fnc_EscortSuccessMP = {

VIPEscort setTaskState "Succeeded"; 
["TaskDone", ["OPSG has safely escorted the executive to his destination."]] call bis_fnc_showNotification;
playMusic "Success"; 
player addRating 300; 
["ScoreAdded",["Executive Escort Complete!",300]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $50,000.00."]] call bis_fnc_showNotification;
player setCurrentTask CO1;

}; 

A3M_fnc_EscortSuccess = {

['','A3M_fnc_EscortSuccessMP',True,False] call BIS_fnc_MP;

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

A3M_EscortFailedMP= {
VIPEscort setTaskState "Failed"; 
playSound "MissionFailed"; 
playMusic "Failure";
["TaskFailed", ["OPSG has failed to safely escort the Executive."]] call bis_fnc_showNotification;
player setCurrentTask CO1;
};

A3M_EscortFailed= {

['','A3M_EscortFailedMP',True,False] call BIS_fnc_MP;

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
 
// Delivery Truck Mission: 
A3M_fnc_ConvoyTask = {
DELEscort=player createSimpleTask ["Deliver Astral Corp Supplies to Destination"]; 
DELEscort SetSimpleTaskDescription ["Escort the Astral Corp Supplies to their Destination. Protect them at all costs.", "Deliver Supplies", "Supply Destination"];
DELEscort SetSimpleTaskDestination (getMarkerPos PubDelDestination);
DELEscort setTaskState "Assigned"; 

player setCurrentTask DELEscort; 
playMusic "Assigned";
["TaskAssigned", ["Drive the supply truck to it's destination. See map."]] call bis_fnc_showNotification;

};

A3M_fnc_ConvoySuccessMP = {
DELEscort setTaskState "Succeeded"; 
["TaskDone", ["OPSG has safely delivered the Supplies to their destination"]] call bis_fnc_showNotification;
playMusic "Success"; 
player addRating 500; 
["ScoreAdded",["Delivery Complete!",500]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $75,000.00"]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 


A3M_fnc_ConvoySuccess = {
['','A3M_fnc_ConvoySuccessMP',True,False] call BIS_fnc_MP;
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


A3M_fnc_ConvoyFailedMP = {
DELEscort setTaskState "Failed";
playSound "MissionFailed";  
playMusic "Failure";
["TaskFailed", ["OPSG has failed to safely escort the truck to it's destination."]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 

A3M_fnc_ConvoyFailed = {
['','A3M_fnc_ConvoyFailedMP',True,False] call BIS_fnc_MP;
deleteVehicle DelDest;
deleteVehicle DelDead; 
sleep 10.0; 
deleteVehicle DEL1;
convoyActive = 0; 
publicVariable "convoyActive"; 
missionStatus = "M0";
publicVariable "missionStatus";  
}; 

// S&E Mission
A3M_fnc_SEFailedMP = {
["TaskFailed", ["The Hostage was Killed."]] call bis_fnc_showNotification;
hint format ["Message: \n \n Our Vital Monitors indicate that the Astral Corp Executive you were commissioned to rescue has been killed. The mission is FUBAR. Return to Base."]; 
SARMission setTaskState "FAILED";
playSound "MissionFailed";  
PlayMusic "Failure"; 
player setCurrentTask CO1;
}; 


A3M_fnc_SEFailed = {
['','A3M_fnc_SEFailedMP',True,False] call BIS_fnc_MP;
SEActive = 0; 
PublicVariable "SEActive"; 
"SAR1ICO" setmarkerpos (getMarkerpos "offmap");
deleteVehicle SAR1; 
MissionStatus = "M0";
publicVariable "MissionStatus"; 
}; 

A3M_fnc_SESucceededMP = {
["TaskDone", ["OPSG has successfully returned the executive to the OPSG compound."]] call bis_fnc_showNotification;
hint "We'll take him from here. He will be debriefed and receive medical treatment. Great job!"; 
SARMission setTaskState "Succeeded"; 
PlayMusic "Success"; 
player addRating 850; 
["ScoreAdded",["Executive Recovered!",850]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $1,500,000.00"]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 


A3M_fnc_SESucceeded= {
['','A3M_fnc_SESucceededMP',True,False] call BIS_fnc_MP;
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


A3M_fnc_SARmission= {

SARMission=player createSimpleTask ["Locate and Extract kidnapped Astral Corp Executive."]; 
SARMission SetSimpleTaskDescription ["An Astral Corporation executive has been confirmed capture by a high tech anti-pharmaceutical extremist faction. We've been contrated to bring him back to our compound alive. ", "Snatch and Extract", " Last Known Location"];
SARMission SetSimpleTaskDestination (getMarkerPos PublicLoc);
SARMission setTaskState "Assigned"; 
player setCurrentTask SARMission; 
playMusic "Assigned";

["TaskAssigned", ["Rescue the captured Astral Corporation executive. See map."]] call bis_fnc_showNotification;

}; 

A3M_fnc_ChangeSARDest= {
SARMission SetSimpleTaskDescription ["An Astral Corporation executive has been rescued. Return him to the C-12 compound safe and sound. ", "Snatch and Extract", " RTB"];
SARMission SetSimpleTaskDestination (getMarkerPos "BA");
["InformationGreen", ["The Package has been secured. Move to HQ immediately!"]] call bis_fnc_showNotification;
}; 

// Raid Mission
A3M_Raid_1MP = {

A3MRaid1=player createSimpleTask ["Move to the Enemy Terrorist Compound and eliminate the enemy forces."]; 
A3MRaid1 SetSimpleTaskDescription ["The Altian Government requests assistance in dealing with a foreign terrorist cell that has taken over a compound. The Altian Government cannot risk an international incident by stepping in, but the Altian police forces are unprepared and ill equipped to handle this situation. OPSG is hereby contracted to eliminate all terror cells operating in Altis. ", "Eliminate Terror Cell", "Terrorist Compound"];
A3MRaid1 SetSimpleTaskDestination (getMarkerPos "sg1");
A3MRaid1 setTaskState "Assigned"; 
player setCurrentTask A3MRaid1; 
playMusic "Assigned";
["TaskAssigned", ["Eliminate the rogue military unit. Clear the area. See map."]] call bis_fnc_showNotification;
}; 

A3M_Raid_2MP = {
A3MRaid2=player createSimpleTask ["Move to the Enemy Terrorist City and eliminate the enemy forces."]; 
A3MRaid2 SetSimpleTaskDescription ["The Altian Government requests assistance in dealing with a foreign terrorist cell that has taken over an entire city. The Altian Government cannot risk an international incident by stepping in, but the Altian police forces are unprepared and ill equipped to handle this situation. OPSG is hereby contracted to eliminate all terror cells operating in Altis. ", "Eliminate Terror Cell", "Terrorist City"];
A3MRaid2 SetSimpleTaskDestination (getMarkerPos "sg2");
A3MRaid2 setTaskState "Assigned"; 
player setCurrentTask A3MRaid2; 
playMusic "Assigned";
["TaskAssigned", ["Eliminate the rogue military unit. Clear the area. See map."]] call bis_fnc_showNotification;
}; 

A3M_fnc_RaidClearMP = {
["TaskDone", ["OPSG has successfully eliminated the Terror Cell."]] call bis_fnc_showNotification;
A3MRaid1 setTaskState "Succeeded"; 
playMusic "Success";
player addRating 2000; 
["ScoreAdded",["Terror Cell Eliminated!",2000]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $2,000,000.00"]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 
// End Raid Missions

// NATO Reinforcement

A3M_fnc_StartTaskNSARMP = {
NSARTask=player createSimpleTask ["Assist the stranded NATO forces."]; 
NSARTask SetSimpleTaskDescription ["A distress call from a NATO unit in the mountains was received by an AAF telecommunications center. The message attached indicated that the unit is currently combat ineffective and awaiting an extraction that failed. The United States has contracted OPSG to insert and assist the NATO operatives in their extract.  ", "Assist NATO Operatives", "NATO Operatives"];
NSARTask SetSimpleTaskDestination (getMarkerPos NSARPickedNo);
NSARTask setTaskState "Assigned"; 
player setCurrentTask NSARTask; 
playMusic "Assigned";
["TaskAssigned", ["Extract NATO Team. Time Sensitive. See map."]] call bis_fnc_showNotification;
};

A3M_fnc_SARfoundMP = {

NSARTask setTaskState "Succeded"; 
["TaskDone", ["OPSG has located the NATO team."]] call bis_fnc_showNotification;
["TaskAssigned", ["Escort the NATO team to their extraction point."]] call bis_fnc_showNotification; 
NSARTask=player createSimpleTask ["Escort NATO forces to their Extraction Point."]; 
NSARTask SetSimpleTaskDescription ["OPSG has located the straded NATO forces. Escort them to as they egress to their destination. These are soldiers, and they will fight, but you're being paid to make sure they make it safe! Stay sharp! ", "Assist NATO Operatives", "NATO Extract"];
NSARTask SetSimpleTaskDestination (getMarkerPos NSARDestNo);
NSARTask setTaskState "Assigned"; 
player setCurrentTask NSARTask; 
playMusic "Assigned";
hint "OPSG has located the NATO team. Move with them to their designated extraction point, and keep them alive. Most importantly, keep the officer with the group alive at all costs. He has intelligence secret NATO needs. ";
}; 

A3M_fnc_SARSuccessMP = {
NSARTask setTaskState "Succeded"; 
["TaskDone", ["OPSG has safely escorted the NATO team."]] call bis_fnc_showNotification;
playMusic "Success"; 
player addRating 900;
["ScoreAdded",["NATO Team Escorted!",900]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $5,000,000.00"]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 

A3M_fnc_SARfailedMP = {
NSARTask setTaskState "Failed"; 
playMusic "Failure"; 
["TaskFailed", ["OPSG has failed to safely escorted the NATO team."]] call bis_fnc_showNotification;
hint "The NATO team has been decimated...the ranking officers killed. OPSG has failed to meet the conditions of your contract. The contract has been cancelled and you are to RTB Immediately"; 
player setCurrentTask CO1;
}; 

// T9 Security Shift

A3M_fnc_T9_Enemy_Elim= {
["TaskDone", ["OPSG has eliminated a terror cell attacking the T-9 facility."]] call bis_fnc_showNotification;
}; 

T9_Protest_ChantMP= {
ProtestLead say3d "PLChant"; 
sleep 30; 
ProtestLead say3d "PLChant"; 
sleep 30; 
ProtestLead say3d "PLChant"; 
sleep 30; 
ProtestLead say3d "PLChant"; 
};

T9_Alarm1_MP= {
T9Spkr say3D "alarmed"; 
}; 

T9_CinematicMP= {
Jeff say3D "T9Cinematic1";
Jeff switchMove "Acts_PointingLeftUnarmed";
Calvin switchMove "LHD_krajPaluby";
Floyd switchMove "HubStandingUC_idle1";  
};

A3M_fnc_StartTaskT9MP = {
T9Task=player createSimpleTask ["T9 Premise Security Shift"]; 
T9Task SetSimpleTaskDescription ["The T9 Facility is a highly classified facility operated by Astral Corp by contract of the United States Air Force.  ", "Perform Security Detail at T9 Facility", "T9 Facility"];
T9Task SetSimpleTaskDestination (getMarkerPos "T9");
T9Task setTaskState "Assigned"; 
player setCurrentTask T9Task; 
playMusic "Assigned";
["TaskAssigned", ["Perform Premise Security Detail at the T-9 Facility. See Map."]] call bis_fnc_showNotification; 
};

A3M_fnc_T9ShiftMP = {
["TaskAssigned", ["OPSG has commenced a T-9 security shift."]] call bis_fnc_showNotification;
T9Task SetSimpleTaskDescription ["Man the front gate, patrol the perimeter and keep the facility safe and secure. You need to stay here for the duration of one shift. Keep productivity high by minimizing threats inside the facility.", "Perform Security Detail at T9 Facility", "T9 Facility"];
T9Task SetSimpleTaskDestination (getMarkerPos "T9");
T9Task setTaskState "Assigned"; 
player setCurrentTask T9Task; 
hint "Man the front gate, patrol the perimeter and keep the facility safe and secure. You need to stay here for the duration of one shift. Keep productivity high by minimizing threats inside the facility.";
};

A3M_fnc_T9SuccessMP = {

T9Task setTaskState "Succeded"; 
playMusic "Success"; 
["TaskDone", ["OPSG has completed a security shift at the T-9 Facility."]] call bis_fnc_showNotification;
player addRating 1000;
["ScoreAdded",["NATO Team Escorted!",1000]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $750,000.00"]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 

A3M_fnc_T9failedMP = {
T9Task setTaskState "Failed"; 
playMusic "Failure"; 
["TaskDone", ["OPSG has allowed chaos at the T-9 facility."]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 

// Roadblock MP Pre-Defines
// 
A3M_fnc_Roadblock = {

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

//MP Task: Stand at checkpoint (Active mission task at site) 
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

//This function removes all actions from the vehicle
RemAllAct = {
removeAllActions RBVeh;
removeAllActions RBVehD; 
}; 


//This function handles letting the car go South 
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

//This function handles letting the car go North
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

// Arrest / Move to Jail Triggers / Launch JailTask MP
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

//Prisoner Booked MP Msgs
A3M_Booked_MP = {
hint "Prisoner has been booked into Altian Police Custody. Thank you!";
ALTEscort setTaskState "Succeeded";  
playMusic "Success";
mantype = "M0";
}; 

// A3M FNC BOOKED
A3M_fnc_booked= {
RBVehD setPos (GetMarkerPos "AAF_Jail"); 
deleteVehicle MoveToJail; 
mantype= "M5";
publicVariable "mantype"; 
deleteVehicle RBVehD; 
['','A3M_Booked_MP',True,False] call BIS_fnc_MP;

};

// ESCORT TO JAIL MP TASK
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

//PRIS MP 
A3M_FNC_PRISMP= { 
["TaskFailed", ["The prisoner has been killed in custody."]] call bis_fnc_showNotification; 
ALTEscort setTaskState "Failed"; 
mantype = "M0";
}; 

// CIV MP
A3M_FNC_CIVMP= {
removeAllActions RBVeh; 
["TaskFailed", ["The Driver has been killed."]] call bis_fnc_showNotification; 
hint "This is a major civil rights violation. Expect backlash! "; 
mantype = "M0";
}; 

// TERR MP
A3M_fnc_TerrMP= {
["TaskDone", ["The Terrorist has been killed."]] call bis_fnc_showNotification;
hint "The terrorist has been neutralized. Great Job. The shooting was in policy, and the terrorist was killed before he could detonate a very lethal bomb.";
mantype = "M0";
};

//CRIM MP
A3M_FNC_CRIMMP= {
["InformationRed", ["The suspect has been neutralized."]] call bis_fnc_showNotification;
hint "The shooting will come under investigation by command staff, but for your moral sake, we hope it was an in policy shooting. You know the truth in your heart."; 
mantype = "M0";
};

// This triggers when the missionCompleted Variable reaches the limit. 
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
publicVariable "MissionActive"; 

[] call coroner;
sleep 2; 

if (isServer) then {
B_DefenseBudget = (B_DefenseBudget + 150000);
publicVariable "B_DefenseBudget"; 
}; 

player setCurrentTask CO1;

};

// Execution 
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
			
	} else {systemChat "A Mission is already active, and cannot be duplicated."}; 
	
  } else {systemChat "A Checkpoint Mission has been activated. "};
}; 

