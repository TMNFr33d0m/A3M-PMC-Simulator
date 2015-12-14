/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  


T9 Base Defense Mission V 0.5 by Cody Salazar AKA Fr33d0m 
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

[ '','A3M_MP_StartTaskT9',True,False] call BIS_fnc_MP;

T9trg= createTrigger ["EmptyDetector", getMarkerPos "T9"]; 
T9trg setTriggerArea [10, 10, 0, false]; 
T9trg setTriggerActivation ["WEST", "PRESENT", false]; 
T9trg setTriggerType "NONE";
T9trg setTriggerStatements ["player in ThisList"," ['','A3M_MP_T9Shift',True,False] call BIS_fnc_MP; nul2 = [] call A3M_fnc_SelectIncident;",""]; 

// Protestors Incident
A3M_fnc_Protest = {
T9Pros= [getMarkerPos "Prostart", civilian, ["C_man_1", "C_man_1", "C_man_1", "C_man_1", "C_man_1", "C_man_1"]] call BIS_fnc_spawnGroup;
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
T9ProsTrg setTriggerStatements ["ProtestLeader in ThisList", "[ '','A3M_MP_T9ProtestChant',True,False] call BIS_fnc_MP; ", ""]; 
}; 

// End Protestors Incident

// Hostile Attack
A3M_fnc_AttackT9 = {
T9HostArray= ["T9_HostL1", "T9_HostL2", "T9_HostL3", "T9_HostL4"]; 
T9EnSource= T9HostArray select floor random count T9HostArray; 

_T9EF= [getMarkerPos T9EnSource, EAST, ["B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F","B_G_Soldier_A_F", "B_G_Soldier_AR_F", "B_G_Soldier_A_F", "B_G_Soldier_AR_F"]] call BIS_fnc_spawnGroup;
_wpE1 = _T9EF addWaypoint [getMarkerPos "T9", 0]; 
_wpE1 setWaypointType "SAD"; 
_wpE1 setWaypointFormation "DIAMOND";

T9wpE1= createTrigger ["EmptyDetector", getMarkerPos "Protest"]; 
T9wpE1 setTriggerArea [30, 30, 0, false]; 
T9wpE1 setTriggerActivation ["CIV", "PRESENT", True]; 
T9wpE1 setTriggerType "NONE";
T9wpE1 setTriggerStatements ["({alive _x} count units _T9EF) < 1", "[ '','A3M_MP_T9EnemyElim',True,False] call BIS_fnc_MP; ", ""]; 
}; 
//  End Hostile Attack

// Double Hostile Attack
A3M_fnc_dblAttackT9 = {
T9HostArray= ["T9_HostL1", "T9_HostL2", "T9_HostL3", "T9_HostL4"]; 
T9EnSource= T9HostArray select floor random count T9HostArray; 

_T9EF2= [getMarkerPos T9EnSource, EAST, ["B_G_Soldier_A_F", "B_G_engineer_F", "B_G_Soldier_A_F", "B_G_medic_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F","B_G_Soldier_A_F", "B_G_Soldier_GL_F", "B_G_Soldier_A_F", "B_G_Soldier_LAT_F"]] call BIS_fnc_spawnGroup;
_wpE2 = _T9EF2 addWaypoint [getMarkerPos "T9", 0]; 
_wpE2 setWaypointType "SAD"; 
_wpE2 setWaypointFormation "DIAMOND";

T9wpE2= createTrigger ["EmptyDetector", getMarkerPos "Protest"]; 
T9wpE2 setTriggerArea [30, 30, 0, false]; 
T9wpE2 setTriggerActivation ["ANY", "PRESENT", True]; 
T9wpE2 setTriggerType "NONE";
T9wpE2 setTriggerStatements ["({alive _x} count units _T9EF2) < 1", "[ '','A3M_MP_T9EnemyElim',True,False] call BIS_fnc_MP; ", ""]; 

T9HostArray= ["T9_HostL1", "T9_HostL2", "T9_HostL3", "T9_HostL4"]; 
T9EnSource= T9HostArray select floor random count T9HostArray; 

_T9EF3= [getMarkerPos T9EnSource, EAST, ["B_G_Soldier_A_F", "B_G_engineer_F", "B_G_Soldier_A_F", "B_G_medic_F", "B_G_Soldier_AR_F", "B_G_Soldier_AR_F","B_G_Soldier_A_F", "B_G_Soldier_GL_F", "B_G_Soldier_A_F", "B_G_Soldier_LAT_F"]] call BIS_fnc_spawnGroup;
_wpE3 = _T9EF3 addWaypoint [getMarkerPos "T9", 0]; 
_wpE3 setWaypointType "SAD"; 
_wpE3 setWaypointFormation "DIAMOND";

T9wpE3= createTrigger ["EmptyDetector", getMarkerPos "Protest"]; 
T9wpE3 setTriggerArea [30, 30, 0, false]; 
T9wpE3 setTriggerActivation ["ANY", "PRESENT", True]; 
T9wpE3 setTriggerType "NONE";
T9wpE3 setTriggerStatements ["({alive _x} count units _T9EF3) < 1", "[ '','A3M_MP_T9EnemyElim',True,False] call BIS_fnc_MP; ", ""]; 
}; 

// Incident Randomizer
A3M_fnc_SelectIncident= { 

T9IncidentArray= ["I1","I2","I3"]; 
T9Incident= T9IncidentArray select floor random count T9IncidentArray;

switch (T9Incident) do {

case "I1": {
[] call A3M_fnc_Protest; 
[] Spawn A3M_fnc_Incident_Causer;
};

case "I2": {
[] call A3M_fnc_AttackT9; 
[] Spawn A3M_fnc_Incident_Causer;
}; 

case "I3": {
[] call A3M_fnc_dblAttackT9; 
[] Spawn A3M_fnc_Incident_Causer;
};
 
}; 
}; 
// End Incident Randomizer
A3M_fnc_Incident_Causer = {

TimeArray = [30, 45, 60, 75, 90, 120, 130, 150, 180]; 
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
}; 

}; 



