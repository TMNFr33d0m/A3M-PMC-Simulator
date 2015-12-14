/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/    


Email Based Mission Deployment System (EBDMS) V 1.2 by Cody Salazar AKA Fr33d0m 
www.A3MilSim.com

License:
You can do whatever you were going to do anyway. Just give me the credit i'm due, and don't steal my shit. I'll be pissed. 
If you want to repay me for all my hard work, come and play arma with me! I hang out at a MilSim unit known as A3M (A3 MilSim) 
Come and visit us at ts3.a3milsim.com:1911

www.A3MilSim.com (A3 MilSim)
All Rights Reserved

For Information and Inquiries, EMAIL: salazar@a3milsim.com

Credits & Thanks: 

My wife, for not only supporting my modding ventures, but actually jumping in and helping with mods when she can. What a gal! 

And last, but definitely not least, the A3 community, who through over 250+ encouraging messages highly encouraged me to continue this project. I'm glad you like it, 
and I hope you enjoy the things I have in the works! 

BIS_Fnc_MP: 
// [params, functionName, target, isPersistent, isCall] call BIS_fnc_MP; 
// ["","A3M_fnc_MyTask",True,False] call BIS_fnc_MP; | Call on all machines
// ["", A3M_fnc_MyTask", false, false, false] call bis_fnc_MP; | Spawn Script only on server

################################## LET US BEGIN #################################### */

disableSerialization;
debug = 1; 
///////////////////////////////////////////////////////////////////////////////////////////
// Open Dialog
_handle= CreateDialog "A3M_VMS";

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

// Bells and Whistles to signal mission accepted
hint "Mission Accepted";
playSound "A3M_MissionAccepted"; 

// Create Random VIP Model (Contains Leights Opfor)
RandomVIP= ["C_Nikos_aged","C_scientist_F"];
RandomVIPSel= RandomVIP select floor random count RandomVIP;

// Create Randomly selected VIP
RandomVIPSel createUnit [getMarkerPos "AIR_Spawn", group player, "VIP1 = this", 0.9, "COLONEL" ];

// Call Server Side Scripting
["", "A3M_Svr_VIPEscort",false,false,false] call bis_fnc_MP; 

// Add VIP Control Actions to VIP for all players 
[[VIP1],'A3M_MP_EscVIPCmds',True,False] call BIS_fnc_MP;

	} else { 
		hint "An Escort Mission is currently active. You must wait until the escort mission is completed before you can start another";
		}; 
}; 		
A3M_msn_TRKEscort = {
if (isNil "ConvoyActive") then {convoyActive = 0}; 

if (convoyActive == 0) then {

// Bells and Whistles to signal mission accepted
hint "Mission Accepted";
playSound "A3M_MissionAccepted"; 
 
_cunt = ["", "A3M_svr_TRKEscort",false,false,false] call bis_fnc_MP; 

	}else { 
		hint "A Convoy Mission is currently active. You must wait until the convoy mission is completed before you can start another.";
		}; 
};
// Next Mission Set
// *********************#################***********************
A3M_msn_SandE= {
if (isNil "SEActive") then {SEActive = 0}; 
 
	if (SEActive == 0) then {

	hint "Mission Accepted"; 
	playSound "A3M_MissionAccepted"; 

	["", "A3M_Svr_SandE",false,false,false] call bis_fnc_MP; 

		} else { 
			hint "A Snatch and Extract Mission is already in progress. You must wait until the current Snatch and Extract operation is completed before you can start";
		}; 
};
A3M_msn_Raid1= {

if (isNil "raid1Active") then {raid1Active= 0}; 

	if (raid1Active == 0) then { 

	hint "Mission Accepted"; 
	playSound "A3M_MissionAccepted"; 

	["", "A3M_Svr_Raid1",false,false,false] call bis_fnc_MP; 

		} else { hint "A raid is currently underway. Contact your team coordinator for information and possible assignment on this objective.";
			}; 
}; 
A3M_msn_Raid2= {

if (isNil "raid1Active") then {raid1Active= 0}; 

	if (raid1Active == 0) then { 

	hint "Mission Accepted"; 
	playSound "A3M_MissionAccepted"; 

	["", "A3M_Svr_Raid2",false,false,false] call bis_fnc_MP; 

		} else { 
			hint "A raid is currently underway. You may only conduct one raid at a time. Contact your team coordinator for information and possible assignment on this objective.";
			}; 

}; 
// Next Mission Set
// *********************#################***********************
A3M_msn_reinforce = {

	if (isNil "NSARActive") then {NSARActive= 0}; 

		if (NSARActive == 0) then { 

		hint "Mission Accepted"; 
		playSound "A3M_MissionAccepted"; 

		["", "A3M_Svr_reinforce",false,false,false] call bis_fnc_MP; 

		} else { 
			hint "A NATO Extraction Support is currently underway. Contact your team coordinator for information and possible assignment on this objective.";
		}; 
}; 
// Next Mission Set
// *********************#################***********************
A3M_msn_T9sec = {

if (isNil "T9Active") then {T9Active= 0}; 

if (T9Active == 0) then { 

hint "Mission Accepted"; 
playSound "A3M_MissionAccepted"; 

	["", "A3M_svr_T9sec",false,false,false] call bis_fnc_MP; 
	
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

["","A3M_msn_chkpt",True,False] call BIS_fnc_MP;

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