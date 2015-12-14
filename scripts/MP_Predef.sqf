/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  


Multiplayer / Client Side Predefines by Cody Salazar AKA Fr33d0m 
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
/* Naming Conventions: 

A3M_Svr_AnyName = {This is something the server should do, and is executed so. Anything named like this should probably be moved to ServerSide_Predef.sqf};  
A3M_MP_AnyName = {This is something that should be called on all clients.};
A3M_fnc_AnyName = {This is a function. This is a bit of a blanket term, but should be used sparingly. This is usually called client side, but may be hybrid client / server or serverside but not called by anything but the server itself.}; 
*/
// Force Cleanup
A3M_Fnc_Cleanup = {

_A3MCleanupIsForced = _This Select 0; 
if (_A3MCleanupIsForced == 1) then {["InformationRed", ["Cleanup Initiated"]] call bis_fnc_showNotification;}; 

{ if (!alive _x) then { deletevehicle _x } } foreach (nearestObjects [center, ["Man", "Car", "Tank", "Helicopter"], 7500]);

};

// Multiplayer Functions
A3M_MP_EscVIPCmds = {

Asset = (_this select 0); 

waitUntil {!IsNil "Asset"};
VIPAct1 = Asset addAction ["Get Down!",{							
		[[Player],"A3M_MP_GetDown",True,False] call BIS_fnc_MP;
		Asset disableAI "anim";
		[[Asset, "AmovPercMstpSnonWnonDnon_Scared2"], "switchMoveEverywhere" ] call BIS_fnc_MP;
		sleep 3; 
		Asset EnableAI "anim";
		}];
													
VIPAct2= Asset addAction ["Follow Me!",{
		[[ Asset, "AmovPercMstpSnonWnonDnon"],"switchMoveEverywhere" ] call BIS_fnc_MP;
		Asset EnableAI "anim";
		[[Player],"A3M_MP_KYHD",True,False] call BIS_fnc_MP;																										
		[Asset] join (group player);	}];
		
	waitUntil {!Alive Asset};
	
	Asset removeAction VIPAct1; 
	Asset removeAction VIPAct2; 
};
A3M_MP_EscortTask = {

VIPEscort=player createSimpleTask ["Escort VIP"]; 
VIPEscort SetSimpleTaskDescription ["Escort the Astral Corporation Executive to his Destination. Protect him at all costs.", "Escort VIP", "VIP's Destination"];
VIPEscort SetSimpleTaskDestination (getMarkerPos PublicDestination);
VIPEscort setTaskState "Assigned"; 
player setCurrentTask VIPEscort; 

playMusic "Assigned";

["TaskAssigned", ["Escort the VIP to his destination. See map."]] call bis_fnc_showNotification;

};
A3M_MP_EscortSuccess = {
VIPEscort setTaskState "Succeeded"; 
["TaskDone", ["OPSG has safely escorted the executive to his destination."]] call bis_fnc_showNotification;
playMusic "Success"; 
player addRating 300; 
["ScoreAdded",["Executive Escort Complete!",300]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $50,000.00."]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 
A3M_MP_EscortFailed= {
VIPEscort setTaskState "Failed"; 
playSound "A3M_MissionFailed"; 
playMusic "Failure";
["TaskFailed", ["OPSG has failed to safely escort the Executive."]] call bis_fnc_showNotification;
player setCurrentTask CO1;
};
A3M_MP_ConvoyTask = {
DELEscort=player createSimpleTask ["Deliver Astral Corp Supplies to Destination"]; 
DELEscort SetSimpleTaskDescription ["Escort the Astral Corp Supplies to their Destination. Protect them at all costs.", "Deliver Supplies", "Supply Destination"];
DELEscort SetSimpleTaskDestination (getMarkerPos PubDelDestination);
DELEscort setTaskState "Assigned"; 

player setCurrentTask DELEscort; 
playMusic "Assigned";
["TaskAssigned", ["Drive the supply truck to it's destination. See map."]] call bis_fnc_showNotification;

};
A3M_MP_ConvoySuccess = {
DELEscort setTaskState "Succeeded"; 
["TaskDone", ["OPSG has safely delivered the Supplies to their destination"]] call bis_fnc_showNotification;
playMusic "Success"; 
player addRating 500; 
["ScoreAdded",["Delivery Complete!",500]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $75,000.00"]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 
A3M_MP_ConvoyFailed = {
DELEscort setTaskState "Failed";
playSound "A3M_MissionFailed";  
playMusic "Failure";
["TaskFailed", ["OPSG has failed to safely escort the truck to it's destination."]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 
A3M_MP_SEFailed = {
["TaskFailed", ["The Hostage was Killed."]] call bis_fnc_showNotification;
hint format ["Message: \n \n Our Vital Monitors indicate that the Astral Corp Executive you were commissioned to rescue has been killed. The mission is FUBAR. Return to Base."]; 
SARMission setTaskState "FAILED";
playSound "A3M_MissionFailed";  
PlayMusic "Failure"; 
player setCurrentTask CO1;
}; 
A3M_MP_SESucceeded = {
["TaskDone", ["OPSG has successfully returned the executive to the OPSG compound."]] call bis_fnc_showNotification;
hint "We'll take him from here. He will be debriefed and receive medical treatment. Great job!"; 
SARMission setTaskState "Succeeded"; 
PlayMusic "Success"; 
player addRating 850; 
["ScoreAdded",["Executive Recovered!",850]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $1,500,000.00"]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 
A3M_MP_ChangeSARDest= {
SARMission SetSimpleTaskDescription ["An Astral Corporation executive has been rescued. Return him to the C-12 compound safe and sound. ", "Snatch and Extract", " RTB"];
SARMission SetSimpleTaskDestination (getMarkerPos "BA");
SAR1 removeAction RescueAction; 
["InformationGreen", ["The Package has been secured. Move to HQ immediately!"]] call bis_fnc_showNotification;
}; 
A3M_MP_Raid1 = {

A3MRaid1=player createSimpleTask ["Move to the Enemy Terrorist Compound and eliminate the enemy forces."]; 
A3MRaid1 SetSimpleTaskDescription ["The Altian Government requests assistance in dealing with a foreign terrorist cell that has taken over a compound. The Altian Government cannot risk an international incident by stepping in, but the Altian police forces are unprepared and ill equipped to handle this situation. OPSG is hereby contracted to eliminate all terror cells operating in Altis. ", "Eliminate Terror Cell", "Terrorist Compound"];
A3MRaid1 SetSimpleTaskDestination (getMarkerPos "sg1");
A3MRaid1 setTaskState "Assigned"; 
player setCurrentTask A3MRaid1; 
playMusic "Assigned";
["TaskAssigned", ["Eliminate the rogue military unit. Clear the area. See map."]] call bis_fnc_showNotification;
}; 
A3M_MP_Raid2 = {
A3MRaid2=player createSimpleTask ["Move to the Enemy Terrorist City and eliminate the enemy forces."]; 
A3MRaid2 SetSimpleTaskDescription ["The Altian Government requests assistance in dealing with a foreign terrorist cell that has taken over an entire city. The Altian Government cannot risk an international incident by stepping in, but the Altian police forces are unprepared and ill equipped to handle this situation. OPSG is hereby contracted to eliminate all terror cells operating in Altis. ", "Eliminate Terror Cell", "Terrorist City"];
A3MRaid2 SetSimpleTaskDestination (getMarkerPos "sg2");
A3MRaid2 setTaskState "Assigned"; 
player setCurrentTask A3MRaid2; 
playMusic "Assigned";
["TaskAssigned", ["Eliminate the rogue military unit. Clear the area. See map."]] call bis_fnc_showNotification;
}; 
A3M_MP_RaidClear = {
["TaskDone", ["OPSG has successfully eliminated the Terror Cell."]] call bis_fnc_showNotification;
A3MRaid1 setTaskState "Succeeded";
A3MRaid2 setTaskState "Succeeded"; 
playMusic "Success";
player addRating 2000; 
["ScoreAdded",["Terror Cell Eliminated!",2000]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $2,000,000.00"]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 
A3M_MP_StartTaskNSAR = {
NSARTask=player createSimpleTask ["Assist the stranded NATO forces."]; 
NSARTask SetSimpleTaskDescription ["A distress call from a NATO unit in the mountains was received by an AAF telecommunications center. The message attached indicated that the unit is currently combat ineffective and awaiting an extraction that failed. The United States has contracted OPSG to insert and assist the NATO operatives in their extract.  ", "Assist NATO Operatives", "NATO Operatives"];
NSARTask SetSimpleTaskDestination (getMarkerPos NSARPickedNo);
NSARTask setTaskState "Assigned"; 
player setCurrentTask NSARTask; 
playMusic "Assigned";
["TaskAssigned", ["Extract NATO Team. Time Sensitive. See map."]] call bis_fnc_showNotification;
};
A3M_MP_SARfound = {

NSARTask setTaskState "Succeeded"; 
["TaskDone", ["OPSG has located the NATO team."]] call bis_fnc_showNotification;
["TaskAssigned", ["Escort the NATO team to their extraction point."]] call bis_fnc_showNotification; 
NSARTask=player createSimpleTask ["Escort NATO forces to their Extraction Point."]; 
NSARTask SetSimpleTaskDescription ["OPSG has located the straded NATO forces. Escort them to as they egress to their destination. These are soldiers, and they will fight, but you're being paid to make sure they make it safe! Stay sharp! ", "Assist NATO Operatives", "NATO Extract"];
NSARTask SetSimpleTaskDestination (getMarkerPos NSARDestNo);
NSARTask setTaskState "Assigned"; 
player setCurrentTask NSARTask; 
playMusic "Assigned";
hint "OPSG has located the NATO team. Move with them to their designated extraction point, and keep them alive. Most importantly, keep the officer with the group alive at all costs. He has secret intelligence NATO needs. ";
}; 
A3M_MP_SARSuccess = {
NSARTask setTaskState "Succeeded"; 
["TaskDone", ["OPSG has safely escorted the NATO team."]] call bis_fnc_showNotification;
playMusic "Success"; 
player addRating 900;
BonusRating = (1000*EESurvivors);
player addRating BonusRating; 

["ScoreAdded",["NATO Team Escorted!",900]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $5,000,000.00"]] call bis_fnc_showNotification;
hint format ["You have been awarded %1 additional RP points, 1000 per additional NATO unit escorted safely the officer.",BonusRating];
player setCurrentTask CO1;
}; 
A3M_MP_SARfailed = {
NSARTask setTaskState "Failed"; 
playMusic "Failure"; 
["TaskFailed", ["OPSG has failed to safely escorted the NATO team."]] call bis_fnc_showNotification;
hint "The NATO team has been decimated...the ranking officers killed. OPSG has failed to meet the conditions of your contract. The contract has been cancelled and you are to RTB Immediately"; 
player setCurrentTask CO1;
}; 
A3M_MP_SARmission= {

SARMission=player createSimpleTask ["Locate and Extract kidnapped Astral Corp Executive."]; 
SARMission SetSimpleTaskDescription ["An Astral Corporation executive has been confirmed capture by a high tech anti-pharmaceutical extremist faction. We've been contrated to bring him back to our compound alive. ", "Snatch and Extract", " Last Known Location"];
SARMission SetSimpleTaskDestination (getMarkerPos PublicLoc);
SARMission setTaskState "Assigned"; 
player setCurrentTask SARMission; 
playMusic "Assigned";

["TaskAssigned", ["Rescue the captured Astral Corporation executive. See map."]] call bis_fnc_showNotification;

}; 
A3M_MP_T9EnemyElim= {
["TaskDone", ["OPSG has eliminated a terror cell attacking the T-9 facility."]] call bis_fnc_showNotification;
Player AddRating 500; 
["ScoreAdded",["Attacking Cell Eliminated!",500]] call bis_fnc_showNotification;
}; 
A3M_MP_T9TrkInPos={
["InformationRed", ["A delivery is at the gate."]] call bis_fnc_showNotification;
};
A3M_MP_T9TrkDelIP = {
 ["InformationRed", ["Delivery In Progress."]] call bis_fnc_showNotification;
  ["InformationRed", ["Keep Truck Safe!"]] call bis_fnc_showNotification;
 }; 
A3M_MP_T9TrkDelIP2 = {
DeliveryComplete = 1;
["InformationGreen", ["A delivery has been completed."]] call bis_fnc_showNotification;
Player AddRating 500; 
["ScoreAdded",["Delivery Made Safely!",500]] call bis_fnc_showNotification;
["InformationRed", ["Remember to let the delivery truck out."]] call bis_fnc_showNotification;
}; 
A3M_MP_T9TrkDelCplt= {
["TaskDone", ["A delivery of supplies has safely been delivered."]] call bis_fnc_showNotification;
Player AddRating 500; 
["ScoreAdded",["Delivery Completed Safely!",500]] call bis_fnc_showNotification;
};
A3M_MP_T9ProtestChant= {

ProtestActive = 1; 

_center = createCenter sideLogic;
_group = createGroup _center;
_pos = (GetMarkerPos "T9Stop1");
T9LogicSnd = _group createUnit ["LOGIC",_pos , [], 0, ""];

if ((Alive ProtestLeader) AND (ProtestActive == 1)) then {
T9LogicSnd say3d "A3M_PLChant"; 
} else {DeleteVehicle T9LogicSnd}; 
sleep 30; 
if ((Alive ProtestLeader) AND (ProtestActive == 1)) then {
T9LogicSnd say3d "A3M_PLChant"; 
} else {DeleteVehicle T9LogicSnd};
sleep 30; 
if ((Alive ProtestLeader) AND (ProtestActive == 1)) then {
T9LogicSnd say3d "A3M_PLChant"; 
} else {DeleteVehicle T9LogicSnd};

};
A3M_MP_T9Alarm1= {
T9Spkr say3D "A3M_alarmed"; 
}; 
A3M_MP_StartTaskT9 = {
T9Task=player createSimpleTask ["T9 Premise Security Shift"]; 
T9Task SetSimpleTaskDescription ["The T9 Facility is a highly classified facility operated by Astral Corp by contract of the United States Air Force. You will perform security duties to keep the staff safe and keep operations flowing by keeping trucks safely delivering supplies.", "Perform Security Detail at T9 Facility", "T9 Facility"];
T9Task SetSimpleTaskDestination (getMarkerPos "T9");
T9Task setTaskState "Assigned"; 
player setCurrentTask T9Task; 
playMusic "Assigned";
["TaskAssigned", ["Perform Premise Security Detail at the T-9 Facility. See Map."]] call bis_fnc_showNotification; 
};
A3M_MP_T9Shift = {
["TaskAssigned", ["OPSG has commenced a T-9 security shift."]] call bis_fnc_showNotification;
T9Task SetSimpleTaskDescription ["Man the front gate, patrol the perimeter and keep the facility safe and secure. You need to stay here for the duration of one shift. Keep productivity high by minimizing threats inside the facility.", "Perform Security Detail at T9 Facility", "T9 Facility"];
T9Task SetSimpleTaskDestination (getMarkerPos "T9");
T9Task setTaskState "Assigned"; 
player setCurrentTask T9Task; 
hint "Man the front gate, patrol the perimeter and keep the facility safe and secure. You need to stay here for the duration of one shift. Keep productivity high by minimizing threats inside the facility.";
};
A3M_MP_T9Success = {

T9Task setTaskState "Succeeded"; 
playMusic "Success"; 
["TaskDone", ["OPSG has completed a security shift at the T-9 Facility."]] call bis_fnc_showNotification;
player addRating 1000;
["ScoreAdded",["NATO Team Escorted!",1000]] call bis_fnc_showNotification;
["InformationGreen", ["Budget Increase Secured. OPSG has been allotted $750,000.00"]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 
A3M_MP_T9failed = {
T9Task setTaskState "Failed"; 
playMusic "Failure"; 
["TaskFailed", ["OPSG has allowed chaos at the T-9 facility."]] call bis_fnc_showNotification;
player setCurrentTask CO1;
}; 

// Fast Travel Pre-Defines 
A3M_Fnc_ToMolos = {
player moveInCargo Molos_Taxi;
playSound "A3M_Deuce";   
titleText ["Travelling to Molos Air Facility | Orion Private Security Group Facility", "BLACK FADED",10];
titleFadeOut 5;
player action ["Eject",Molos_Taxi]; 

}; 
A3M_Fnc_ToC12 = {
player moveInCargo C12_Taxi;
playSound "A3M_Deuce";   
titleText ["Travelling to C-12 Research Facility | Astral Corporation / OPSG Facility", "BLACK FADED", 10];
titleFadeOut 5;
player action ["Eject",C12_Taxi]; 
}; 
// OPHQ Pre-Defines 
//GUI  Location ID Function 
DRI_HQmsg = {
[
		
		[
			["Orion Private ","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
			["Security Group","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"],
			["","<br/>"],
			["Operations HQ","align = 'center' shadow = '1' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

}; 
DRI_M4RMsg = {
[
		
		[
			["Altis ","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
			["Rifle Club","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"],
			["","<br/>"],
			["Firing Range","align = 'center' shadow = '1' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

}; 
DRI_ArmoryMsg = {
[
		
		[
			["Orion Private ","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
			["Security Group","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"],
			["","<br/>"],
			["Armory","align = 'center' shadow = '1' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

}; 
DRI_MPHQMsg = {
[
		
		[
			["Orion Private ","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
			["Security Group","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"],
			["","<br/>"],
			["Detention Center","align = 'center' shadow = '1' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

}; 
DRI_HspMsg = {
[
		
		[
			["Orion Private ","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
			["Security Group","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"],
			["","<br/>"],
			["Medical Center","align = 'center' shadow = '1' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

}; 
DRI_TRAMsg = {
[
		
		[
			["Orion Private ","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
			["Security Group","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"],
			["","<br/>"],
			["Tactical Readiness Area","align = 'center' shadow = '1' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

}; 
// Define Slides with MP Compat 
DRI_ABCT2_MPimg1 = {
PresBoard setObjectTexture [0, "images\Deadly_Zones_Slide.paa"];
}; 
// MP Compatible Television(s)
DRI_ABCT2_DHQTV = { 

CMDTVON = 1;

while {CMDTVON == 1} do {

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television1.paa"]; 
sleep 3; } else {CMD_TV setObjectTexture [0, "images\TVNoise.paa"];};

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television2.paa"]; 
sleep 3;  } else {CMD_TV setObjectTexture [0, "images\TVNoise.paa"];};

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television3.paa"]; 
sleep 3;   } else {CMD_TV setObjectTexture [0, "images\TVNoise.paa"]; };

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television4.paa"]; 
sleep 3;  } else { CMD_TV setObjectTexture [0, "images\TVNoise.paa"];  };
}; 

}; 
DRI_ABCT2_DHQTVOFF = {
CMDTVON = 0; 
CMD_TV setObjectTexture [0, "images\TVNoise.paa"];
}; 
DRI_ABCT2_MPTV = { 

MPTVON = 1;


while {MPTVON == 1} do {

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television1.paa"];
sleep 3;} else {MP_TV setObjectTexture [0, "images\TVNoise.paa"]; };

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television2.paa"]; 
sleep 3; } else {MP_TV setObjectTexture [0, "images\TVNoise.paa"]; };

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television3.paa"]; 
sleep 3;} else  {MP_TV setObjectTexture [0, "images\TVNoise.paa"]; };

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television4.paa"]; 
sleep 3;} else {MP_TV setObjectTexture [0, "images\TVNoise.paa"]; };

}; 

}; 
DRI_ABCT2_MPTVOFF = {

MPTVON = 0; 
MP_TV setObjectTexture [0, "images\TVNoise.paa"];
}; 
// Rifle Range Pre-Defines
// 
M4RR_A_ChkScore = {
if (isNil "M4RR_A_Totalhits") then {M4RR_A_Totalhits = 0; }; 
hint format ["Lane A Current Score: \n %1", M4RR_A_Totalhits]; 
}; 
M4RR_A_ResetScore = {
M4RR_A_Totalhits = 0; 
publicVariable "M4RR_A_Totalhits";
}; 
M4RR_A_AllTargetsUp = {

M4RR_A_1 animate["terc",0];
sleep 0.5; 
M4RR_A_2 animate["terc",0];
sleep 0.5; 
M4RR_A_3 animate["terc",0];
sleep 0.5; 
M4RR_A_4 animate["terc",0];
sleep 0.5; 
M4RR_A_5 animate["terc",0];
sleep 0.5; 
M4RR_A_6 animate["terc",0];
sleep 0.5; 
M4RR_A_7 animate["terc",0];

hint format ["Lane A: \n Ready."]; 

}; 
M4RR_A_AllTargetsDown = {

M4RR_A_1 animate["terc",1];
sleep 0.5; 
M4RR_A_2 animate["terc",1];
sleep 0.5; 
M4RR_A_3 animate["terc",1];
sleep 0.5; 
M4RR_A_4 animate["terc",1];
sleep 0.5; 
M4RR_A_5 animate["terc",1];
sleep 0.5; 
M4RR_A_6 animate["terc",1];
sleep 0.5; 
M4RR_A_7 animate["terc",1];

hint format ["Lane A: \n Ready."]; 

}; 
M4RR_A_L50 = {
M4RR_A_1 animate["terc",0];
sleep 5; 
M4RR_A_1 animate["terc",1];
}; 
M4RR_A_R50 = {
M4RR_A_2 animate["terc",0];
sleep 5; 
M4RR_A_2 animate["terc",1];
}; 
M4RR_A_100= {
M4RR_A_3 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
}; 
M4RR_A_150 = {
M4RR_A_4 animate["terc",0];
sleep 5; 
M4RR_A_4 animate["terc",1];
}; 
M4RR_A_200 = {
M4RR_A_5 animate["terc",0];
sleep 5; 
M4RR_A_5 animate["terc",1];
}; 
M4RR_A_250 = {
M4RR_A_6 animate["terc",0];
sleep 5; 
M4RR_A_6 animate["terc",1];
}; 
M4RR_A_300 = {
M4RR_A_7 animate["terc",0];
sleep 5;
M4RR_A_7 animate["terc",1];
}; 
M4RR_A_Pop7 = {

[] spawn M4RR_A_AllTargetsDown; 
[] spawn M4RR_A_ResetScore; 
sleep 2; 
hint "Begin Program Now."; 
M4RR_A_1 animate["terc",0];
sleep 5; 
M4RR_A_1 animate["terc",1];
sleep 3; 
M4RR_A_2 animate["terc",0];
sleep 5; 
M4RR_A_2 animate["terc",1];
sleep 3; 
M4RR_A_3 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
sleep 3; 
M4RR_A_4 animate["terc",0];
sleep 5; 
M4RR_A_4 animate["terc",1];
sleep 3; 
M4RR_A_5 animate["terc",0];
sleep 5; 
M4RR_A_5 animate["terc",1];
sleep 3; 
M4RR_A_6 animate["terc",0];
sleep 5; 
M4RR_A_6 animate["terc",1];
sleep 3; 
M4RR_A_7 animate["terc",0];
sleep 5;
M4RR_A_7 animate["terc",1];

hint Format [" Lane A: \n Pop 7 Complete. Total Hits: %1", M4RR_A_Totalhits]; 

[] spawn M4RR_A_AllTargetsUp; 

}; 
M4RR_A_Pop40 = {

hint "40 Target Scheduled Qualification Test Started.";

[] spawn M4RR_A_AllTargetsDown; 
[] spawn M4RR_A_ResetScore; 
sleep 2; 
hint "Begin Program Now"; 
// T1 - Left 50
M4RR_A_1 animate["terc",0];
sleep 5; 
M4RR_A_1 animate["terc",1];
sleep 3; 
//  T2 - 150
M4RR_A_4 animate["terc",0];
sleep 5; 
M4RR_A_4 animate["terc",1];
sleep 3; 
// T3 - Right 50 
M4RR_A_2 animate["terc",0];
sleep 5; 
M4RR_A_2 animate["terc",1];
sleep 3; 
// T4 - 150 
M4RR_A_4 animate["terc",0];
sleep 5; 
M4RR_A_4 animate["terc",1];
sleep 3; 
//T5 - 100
M4RR_A_3 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
sleep 3; 
//T6 - 250
M4RR_A_6 animate["terc",0];
sleep 5; 
M4RR_A_6 animate["terc",1];
sleep 3; 
//T7 - 200 
M4RR_A_5 animate["terc",0];
sleep 5; 
M4RR_A_5 animate["terc",1];
sleep 3; 
//T8 - 300 
M4RR_A_7 animate["terc",0];
sleep 5;
M4RR_A_7 animate["terc",1];
sleep 3; 
//T9- 100
M4RR_A_3 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
sleep 3; 
//T10  - 150
M4RR_A_4 animate["terc",0];
sleep 5; 
M4RR_A_4 animate["terc",1];
sleep 3; 
//T11 - Left 50
M4RR_A_1 animate["terc",0];
sleep 5; 
M4RR_A_1 animate["terc",1];
sleep 3; 
//T12  - 200 
M4RR_A_5 animate["terc",0];
sleep 5; 
M4RR_A_5 animate["terc",1];
sleep 3; 
//T13  - 100
M4RR_A_3 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
sleep 3; 
//T14 - 300 
M4RR_A_7 animate["terc",0];
sleep 5;
M4RR_A_7 animate["terc",1];
sleep 3; 
//T15 - 250
M4RR_A_6 animate["terc",0];
sleep 5; 
M4RR_A_6 animate["terc",1];
sleep 3; 
//T16 - Right 50 
M4RR_A_2 animate["terc",0];
sleep 5; 
M4RR_A_2 animate["terc",1];
sleep 3; 
//T17 - 200 
M4RR_A_5 animate["terc",0];
sleep 5; 
M4RR_A_5 animate["terc",1];
sleep 3; 
//T18 - Right 50 
M4RR_A_2 animate["terc",0];
sleep 5; 
M4RR_A_2 animate["terc",1];
sleep 3; 
//T19 - 100
M4RR_A_3 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
sleep 3; 
//T20- Left 50 
M4RR_A_1 animate["terc",0];
sleep 5; 
M4RR_A_1 animate["terc",1];
hint format ["Lane A: \n Set 1 complete!  (10 SEC DELAY) \n Total Hits So Far: \n %1 / 20 Targets", M4RR_A_Totalhits];
sleep 10; 
//T21 - 100 // Begin wave 2
M4RR_A_3 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
sleep 3; 
//T22 - 250
M4RR_A_6 animate["terc",0];
sleep 5; 
M4RR_A_6 animate["terc",1];
sleep 3; 
//T23 - 300 
M4RR_A_7 animate["terc",0];
sleep 5;
M4RR_A_7 animate["terc",1];
sleep 3; 
//T24 - 150
M4RR_A_4 animate["terc",0];
sleep 5; 
M4RR_A_4 animate["terc",1];
sleep 3; 
//T25 - Left 50
M4RR_A_1 animate["terc",0];
sleep 5; 
M4RR_A_1 animate["terc",1];
sleep 3; 
//T26 - 200  and T27 - 100
M4RR_A_5 animate["terc",0];
M4RR_A_3 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
M4RR_A_5 animate["terc",1];
sleep 3;  
//T28 - 100
M4RR_A_3 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
sleep 3; 
//T29 - Left 50
M4RR_A_1 animate["terc",0];
sleep 5; 
M4RR_A_1 animate["terc",1];
sleep 3; 
//T30   - Right 50 
M4RR_A_2 animate["terc",0];
sleep 5; 
M4RR_A_2 animate["terc",1];
hint format ["Lane A: \n Set 2 complete!  (10 SEC DELAY) \n Total Hits So Far: \n %1 / 30 Targets" , M4RR_A_Totalhits];
sleep 10; 
//T31- 200
M4RR_A_5 animate["terc",0];
sleep 5; 
M4RR_A_5 animate["terc",1];
sleep 3; 
//T32 - 100
M4RR_A_3 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
sleep 3; 
//T33- 150
M4RR_A_4 animate["terc",0];
sleep 5; 
M4RR_A_4 animate["terc",1];
sleep 3; 
//T34- 100 AND T35 - 150
M4RR_A_3 animate["terc",0];
M4RR_A_4 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
M4RR_A_4 animate["terc",1];
sleep 3;
//T36 - R50 
M4RR_A_2 animate["terc",0];
sleep 5; 
M4RR_A_2 animate["terc",1];
sleep 3; 
//T37-  200
M4RR_A_5 animate["terc",0];
sleep 5; 
M4RR_A_5 animate["terc",1];
sleep 3; 
//T38  - 100 and T39 - 150
M4RR_A_3 animate["terc",0];
M4RR_A_4 animate["terc",0];
sleep 5; 
M4RR_A_3 animate["terc",1];
M4RR_A_4 animate["terc",1];
sleep 3; 
//T40- L50
M4RR_A_1 animate["terc",0];
sleep 5; 
M4RR_A_1 animate["terc",1];

hint Format [" Lane A: \n Pop 40 Complete. \n Total Hits: %1 / 40 Targets \n in 3 sets (20, 10, 10)", M4RR_A_Totalhits]; 

sleep 5; 
[] spawn M4RR_A_AllTargetsUp; 

}; 
// Lane B
M4RR_B_ChkScore = {
if (isNil "M4RR_B_Totalhits") then {M4RR_B_Totalhits = 0}; 
hint format ["Lane B Current Score: \n %1", M4RR_B_Totalhits]; 
}; 
M4RR_B_ResetScore = {
M4RR_B_Totalhits = 0; 
publicVariable "M4RR_B_Totalhits";
}; 
M4RR_B_AllTargetsUp = {

M4RR_B_1 animate["terc",0];
sleep 0.5; 
M4RR_B_2 animate["terc",0];
sleep 0.5; 
M4RR_B_3 animate["terc",0];
sleep 0.5; 
M4RR_B_4 animate["terc",0];
sleep 0.5; 
M4RR_B_5 animate["terc",0];
sleep 0.5; 
M4RR_B_6 animate["terc",0];
sleep 0.5; 
M4RR_B_7 animate["terc",0];

hint format ["Lane B: \n Ready."]; 

}; 
M4RR_B_AllTargetsDown = {

M4RR_B_1 animate["terc",1];
sleep 0.5; 
M4RR_B_2 animate["terc",1];
sleep 0.5; 
M4RR_B_3 animate["terc",1];
sleep 0.5; 
M4RR_B_4 animate["terc",1];
sleep 0.5; 
M4RR_B_5 animate["terc",1];
sleep 0.5; 
M4RR_B_6 animate["terc",1];
sleep 0.5; 
M4RR_B_7 animate["terc",1];

hint format ["Lane B: \n Ready."]; 

}; 
M4RR_B_L50 = {
M4RR_B_1 animate["terc",0];
sleep 5; 
M4RR_B_1 animate["terc",1];
}; 
M4RR_B_R50 = {
M4RR_B_2 animate["terc",0];
sleep 5; 
M4RR_B_2 animate["terc",1];
}; 
M4RR_B_100= {
M4RR_B_3 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
}; 
M4RR_B_150 = {
M4RR_B_4 animate["terc",0];
sleep 5; 
M4RR_B_4 animate["terc",1];
}; 
M4RR_B_200 = {
M4RR_B_5 animate["terc",0];
sleep 5; 
M4RR_B_5 animate["terc",1];
}; 
M4RR_B_250 = {
M4RR_B_6 animate["terc",0];
sleep 5; 
M4RR_B_6 animate["terc",1];
}; 
M4RR_B_300 = {
M4RR_B_7 animate["terc",0];
sleep 5;
M4RR_B_7 animate["terc",1];
}; 
M4RR_B_Pop7 = {

[] spawn M4RR_B_AllTargetsDown; 
[] spawn M4RR_B_ResetScore;
sleep 2; 
M4RR_B_1 animate["terc",0];
sleep 5; 
M4RR_B_1 animate["terc",1];
sleep 3; 
M4RR_B_2 animate["terc",0];
sleep 5; 
M4RR_B_2 animate["terc",1];
sleep 3; 
M4RR_B_3 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
sleep 3; 
M4RR_B_4 animate["terc",0];
sleep 5; 
M4RR_B_4 animate["terc",1];
sleep 3; 
M4RR_B_5 animate["terc",0];
sleep 5; 
M4RR_B_5 animate["terc",1];
sleep 3; 
M4RR_B_6 animate["terc",0];
sleep 5; 
M4RR_B_6 animate["terc",1];
sleep 3; 
M4RR_B_7 animate["terc",0];
sleep 5;
M4RR_B_7 animate["terc",1];

hint Format [" Lane B: \n Pop 7 Complete. Total Hits: %1", M4RR_B_Totalhits]; 

[] spawn M4RR_B_AllTargetsUp; 

}; 
M4RR_B_Pop40 = {

hint "40 Target Scheduled Qualification Test Started.";

[] spawn M4RR_B_AllTargetsDown; 
[] spawn M4RR_B_ResetScore; 
sleep 2; 
hint "Begin Program Now"; 
// T1 - Left 50
M4RR_B_1 animate["terc",0];
sleep 5; 
M4RR_B_1 animate["terc",1];
sleep 3; 
//  T2 - 150
M4RR_B_4 animate["terc",0];
sleep 5; 
M4RR_B_4 animate["terc",1];
sleep 3; 
// T3 - Right 50 
M4RR_B_2 animate["terc",0];
sleep 5; 
M4RR_B_2 animate["terc",1];
sleep 3; 
// T4 - 150 
M4RR_B_4 animate["terc",0];
sleep 5; 
M4RR_B_4 animate["terc",1];
sleep 3; 
//T5 - 100
M4RR_B_3 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
sleep 3; 
//T6 - 250
M4RR_B_6 animate["terc",0];
sleep 5; 
M4RR_B_6 animate["terc",1];
sleep 3; 
//T7 - 200 
M4RR_B_5 animate["terc",0];
sleep 5; 
M4RR_B_5 animate["terc",1];
sleep 3; 
//T8 - 300 
M4RR_B_7 animate["terc",0];
sleep 5;
M4RR_B_7 animate["terc",1];
sleep 3; 
//T9- 100
M4RR_B_3 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
sleep 3; 
//T10  - 150
M4RR_B_4 animate["terc",0];
sleep 5; 
M4RR_B_4 animate["terc",1];
sleep 3; 
//T11 - Left 50
M4RR_B_1 animate["terc",0];
sleep 5; 
M4RR_B_1 animate["terc",1];
sleep 3; 
//T12  - 200 
M4RR_B_5 animate["terc",0];
sleep 5; 
M4RR_B_5 animate["terc",1];
sleep 3; 
//T13  - 100
M4RR_B_3 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
sleep 3; 
//T14 - 300 
M4RR_B_7 animate["terc",0];
sleep 5;
M4RR_B_7 animate["terc",1];
sleep 3; 
//T15 - 250
M4RR_B_6 animate["terc",0];
sleep 5; 
M4RR_B_6 animate["terc",1];
sleep 3; 
//T16 - Right 50 
M4RR_B_2 animate["terc",0];
sleep 5; 
M4RR_B_2 animate["terc",1];
sleep 3; 
//T17 - 200 
M4RR_B_5 animate["terc",0];
sleep 5; 
M4RR_B_5 animate["terc",1];
sleep 3; 
//T18 - Right 50 
M4RR_B_2 animate["terc",0];
sleep 5; 
M4RR_B_2 animate["terc",1];
sleep 3; 
//T19 - 100
M4RR_B_3 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
sleep 3; 
//T20- Left 50 
M4RR_B_1 animate["terc",0];
sleep 5; 
M4RR_B_1 animate["terc",1];
hint format ["Lane B: \n Set 1 complete!  (10 SEC DELAY) \n Total Hits So Far: \n %1 / 20 Targets", M4RR_B_Totalhits];
sleep 10; 
//T21 - 100 // Begin wave 2
M4RR_B_3 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
sleep 3; 
//T22 - 250
M4RR_B_6 animate["terc",0];
sleep 5; 
M4RR_B_6 animate["terc",1];
sleep 3; 
//T23 - 300 
M4RR_B_7 animate["terc",0];
sleep 5;
M4RR_B_7 animate["terc",1];
sleep 3; 
//T24 - 150
M4RR_B_4 animate["terc",0];
sleep 5; 
M4RR_B_4 animate["terc",1];
sleep 3; 
//T25 - Left 50
M4RR_B_1 animate["terc",0];
sleep 5; 
M4RR_B_1 animate["terc",1];
sleep 3; 
//T26 - 200  and T27 - 100
M4RR_B_5 animate["terc",0];
M4RR_B_3 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
M4RR_B_5 animate["terc",1];
sleep 3;  
//T28 - 100
M4RR_B_3 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
sleep 3; 
//T29 - Left 50
M4RR_B_1 animate["terc",0];
sleep 5; 
M4RR_B_1 animate["terc",1];
sleep 3; 
//T30   - Right 50 
M4RR_B_2 animate["terc",0];
sleep 5; 
M4RR_B_2 animate["terc",1];
hint format ["Lane B: \n Set 2 complete!  (10 SEC DELAY) \n Total Hits So Far: \n %1 / 30 Targets" , M4RR_B_Totalhits];
sleep 10; 
//T31- 200
M4RR_B_5 animate["terc",0];
sleep 5; 
M4RR_B_5 animate["terc",1];
sleep 3; 
//T32 - 100
M4RR_B_3 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
sleep 3; 
//T33- 150
M4RR_B_4 animate["terc",0];
sleep 5; 
M4RR_B_4 animate["terc",1];
sleep 3; 
//T34- 100 AND T35 - 150
M4RR_B_3 animate["terc",0];
M4RR_B_4 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
M4RR_B_4 animate["terc",1];
sleep 3;
//T36 - R50 
M4RR_B_2 animate["terc",0];
sleep 5; 
M4RR_B_2 animate["terc",1];
sleep 3; 
//T37-  200
M4RR_B_5 animate["terc",0];
sleep 5; 
M4RR_B_5 animate["terc",1];
sleep 3; 
//T38  - 100 and T39 - 150
M4RR_B_3 animate["terc",0];
M4RR_B_4 animate["terc",0];
sleep 5; 
M4RR_B_3 animate["terc",1];
M4RR_B_4 animate["terc",1];
sleep 3; 
//T40- L50
M4RR_B_1 animate["terc",0];
sleep 5; 
M4RR_B_1 animate["terc",1];

hint Format [" Lane B: \n Pop 40 Complete. \n Total Hits: %1 / 40 Targets \n in 3 sets (20, 10, 10)", M4RR_B_Totalhits]; 

sleep 5; 
[] spawn M4RR_B_AllTargetsUp; 

}; 
// Lane C
M4RR_C_ChkScore = {
if (isNil "M4RR_C_Totalhits") then {M4RR_C_Totalhits = 0}; 
hint format ["LANE C Current Score: \n %1", M4RR_C_Totalhits]; 
}; 
M4RR_C_ResetScore = {
M4RR_C_Totalhits = 0; 
publicVariable "M4RR_C_Totalhits";
}; 
M4RR_C_AllTargetsUp = {

M4RR_C_1 animate["terc",0];
sleep 0.5; 
M4RR_C_2 animate["terc",0];
sleep 0.5; 
M4RR_C_3 animate["terc",0];
sleep 0.5; 
M4RR_C_4 animate["terc",0];
sleep 0.5; 
M4RR_C_5 animate["terc",0];
sleep 0.5; 
M4RR_C_6 animate["terc",0];
sleep 0.5; 
M4RR_C_7 animate["terc",0];

hint format ["LANE C: \n Ready."]; 

}; 
M4RR_C_AllTargetsDown = {

M4RR_C_1 animate["terc",1];
sleep 0.5; 
M4RR_C_2 animate["terc",1];
sleep 0.5; 
M4RR_C_3 animate["terc",1];
sleep 0.5; 
M4RR_C_4 animate["terc",1];
sleep 0.5; 
M4RR_C_5 animate["terc",1];
sleep 0.5; 
M4RR_C_6 animate["terc",1];
sleep 0.5; 
M4RR_C_7 animate["terc",1];

hint format ["LANE C: \n Ready."]; 
}; 
M4RR_C_L50 = {
M4RR_C_1 animate["terc",0];
sleep 5; 
M4RR_C_1 animate["terc",1];
}; 
M4RR_C_R50 = {
M4RR_C_2 animate["terc",0];
sleep 5; 
M4RR_C_2 animate["terc",1];
}; 
M4RR_C_100= {
M4RR_C_3 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
}; 
M4RR_C_150 = {
M4RR_C_4 animate["terc",0];
sleep 5; 
M4RR_C_4 animate["terc",1];
}; 
M4RR_C_200 = {
M4RR_C_5 animate["terc",0];
sleep 5; 
M4RR_C_5 animate["terc",1];
}; 
M4RR_C_250 = {
M4RR_C_6 animate["terc",0];
sleep 5; 
M4RR_C_6 animate["terc",1];
}; 
M4RR_C_300 = {
M4RR_C_7 animate["terc",0];
sleep 5;
M4RR_C_7 animate["terc",1];
}; 
M4RR_C_Pop7 = {

[] spawn M4RR_C_AllTargetsDown; 
[] spawn M4RR_C_ResetScore; 
sleep 2; 
M4RR_C_1 animate["terc",0];
sleep 5; 
M4RR_C_1 animate["terc",1];
sleep 3; 
M4RR_C_2 animate["terc",0];
sleep 5; 
M4RR_C_2 animate["terc",1];
sleep 3; 
M4RR_C_3 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
sleep 3; 
M4RR_C_4 animate["terc",0];
sleep 5; 
M4RR_C_4 animate["terc",1];
sleep 3; 
M4RR_C_5 animate["terc",0];
sleep 5; 
M4RR_C_5 animate["terc",1];
sleep 3; 
M4RR_C_6 animate["terc",0];
sleep 5; 
M4RR_C_6 animate["terc",1];
sleep 3; 
M4RR_C_7 animate["terc",0];
sleep 5;
M4RR_C_7 animate["terc",1];

hint Format [" LANE C: \n Pop 7 Complete. Total Hits: %1", M4RR_C_Totalhits]; 

[] spawn M4RR_C_AllTargetsUp; 

}; 
M4RR_C_Pop40 = {

hint "40 Target Scheduled Qualification Test Started.";

[] spawn M4RR_C_AllTargetsDown; 
[] spawn M4RR_C_ResetScore; 
sleep 2; 
hint "Begin Program Now"; 
// T1 - Left 50
M4RR_C_1 animate["terc",0];
sleep 5; 
M4RR_C_1 animate["terc",1];
sleep 3; 
//  T2 - 150
M4RR_C_4 animate["terc",0];
sleep 5; 
M4RR_C_4 animate["terc",1];
sleep 3; 
// T3 - Right 50 
M4RR_C_2 animate["terc",0];
sleep 5; 
M4RR_C_2 animate["terc",1];
sleep 3; 
// T4 - 150 
M4RR_C_4 animate["terc",0];
sleep 5; 
M4RR_C_4 animate["terc",1];
sleep 3; 
//T5 - 100
M4RR_C_3 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
sleep 3; 
//T6 - 250
M4RR_C_6 animate["terc",0];
sleep 5; 
M4RR_C_6 animate["terc",1];
sleep 3; 
//T7 - 200 
M4RR_C_5 animate["terc",0];
sleep 5; 
M4RR_C_5 animate["terc",1];
sleep 3; 
//T8 - 300 
M4RR_C_7 animate["terc",0];
sleep 5;
M4RR_C_7 animate["terc",1];
sleep 3; 
//T9- 100
M4RR_C_3 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
sleep 3; 
//T10  - 150
M4RR_C_4 animate["terc",0];
sleep 5; 
M4RR_C_4 animate["terc",1];
sleep 3; 
//T11 - Left 50
M4RR_C_1 animate["terc",0];
sleep 5; 
M4RR_C_1 animate["terc",1];
sleep 3; 
//T12  - 200 
M4RR_C_5 animate["terc",0];
sleep 5; 
M4RR_C_5 animate["terc",1];
sleep 3; 
//T13  - 100
M4RR_C_3 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
sleep 3; 
//T14 - 300 
M4RR_C_7 animate["terc",0];
sleep 5;
M4RR_C_7 animate["terc",1];
sleep 3; 
//T15 - 250
M4RR_C_6 animate["terc",0];
sleep 5; 
M4RR_C_6 animate["terc",1];
sleep 3; 
//T16 - Right 50 
M4RR_C_2 animate["terc",0];
sleep 5; 
M4RR_C_2 animate["terc",1];
sleep 3; 
//T17 - 200 
M4RR_C_5 animate["terc",0];
sleep 5; 
M4RR_C_5 animate["terc",1];
sleep 3; 
//T18 - Right 50 
M4RR_C_2 animate["terc",0];
sleep 5; 
M4RR_C_2 animate["terc",1];
sleep 3; 
//T19 - 100
M4RR_C_3 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
sleep 3; 
//T20- Left 50 
M4RR_C_1 animate["terc",0];
sleep 5; 
M4RR_C_1 animate["terc",1];
hint format ["Lane C: \n Set 1 complete!  (10 SEC DELAY) \n Total Hits So Far: \n %1 / 20 Targets", M4RR_C_Totalhits];
sleep 10; 
//T21 - 100 // Begin wave 2
M4RR_C_3 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
sleep 3; 
//T22 - 250
M4RR_C_6 animate["terc",0];
sleep 5; 
M4RR_C_6 animate["terc",1];
sleep 3; 
//T23 - 300 
M4RR_C_7 animate["terc",0];
sleep 5;
M4RR_C_7 animate["terc",1];
sleep 3; 
//T24 - 150
M4RR_C_4 animate["terc",0];
sleep 5; 
M4RR_C_4 animate["terc",1];
sleep 3; 
//T25 - Left 50
M4RR_C_1 animate["terc",0];
sleep 5; 
M4RR_C_1 animate["terc",1];
sleep 3; 
//T26 - 200  and T27 - 100
M4RR_C_5 animate["terc",0];
M4RR_C_3 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
M4RR_C_5 animate["terc",1];
sleep 3;  
//T28 - 100
M4RR_C_3 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
sleep 3; 
//T29 - Left 50
M4RR_C_1 animate["terc",0];
sleep 5; 
M4RR_C_1 animate["terc",1];
sleep 3; 
//T30   - Right 50 
M4RR_C_2 animate["terc",0];
sleep 5; 
M4RR_C_2 animate["terc",1];
hint format ["Lane C: \n Set 2 complete!  (10 SEC DELAY) \n Total Hits So Far: \n %1 / 30 Targets" , M4RR_C_Totalhits];
sleep 10; 
//T31- 200
M4RR_C_5 animate["terc",0];
sleep 5; 
M4RR_C_5 animate["terc",1];
sleep 3; 
//T32 - 100
M4RR_C_3 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
sleep 3; 
//T33- 150
M4RR_C_4 animate["terc",0];
sleep 5; 
M4RR_C_4 animate["terc",1];
sleep 3; 
//T34- 100 AND T35 - 150
M4RR_C_3 animate["terc",0];
M4RR_C_4 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
M4RR_C_4 animate["terc",1];
sleep 3;
//T36 - R50 
M4RR_C_2 animate["terc",0];
sleep 5; 
M4RR_C_2 animate["terc",1];
sleep 3; 
//T37-  200
M4RR_C_5 animate["terc",0];
sleep 5; 
M4RR_C_5 animate["terc",1];
sleep 3; 
//T38  - 100 and T39 - 150
M4RR_C_3 animate["terc",0];
M4RR_C_4 animate["terc",0];
sleep 5; 
M4RR_C_3 animate["terc",1];
M4RR_C_4 animate["terc",1];
sleep 3; 
//T40- L50
M4RR_C_1 animate["terc",0];
sleep 5; 
M4RR_C_1 animate["terc",1];

hint Format [" Lane C: \n Pop 40 Complete. \n Total Hits: %1 / 40 Targets \n in 3 sets (20, 10, 10)", M4RR_C_Totalhits]; 

sleep 5; 
[] spawn M4RR_C_AllTargetsUp; 

}; 

// Bank Account Pre-Defines 
A3M_Fnc_InitBank = {

Wallet= 0; 
getdough= profileNamespace getVariable ["SavedMoney", 0];
Wallet = (Wallet+getdough); 
Debits= 0; 
plyscore= rating player; 
multiplyer= plyscore * 2; 
Payday_TimeSheet= 1;
player addRating -plyscore; 
SignedIn= 0;

}; 
A3M_Fnc_AccessBank = {

A3M_handle_number=
{
private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];
 
_number = [_this,0,0,[0]] call bis_fnc_param;
_mod = [_this,1,3,[0]] call bis_fnc_param;
 
_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;
 
_modBase = _digitsCount % _mod;
_numberText = "";
{
_numberText = _numberText + str _x;
if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + ",";};
} foreach _digits;
_numberText
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Account Balance in GUI

DoBalance = {
//Get the dialog display (a viewport)
_Bdisplay = findDisplay 6969;

if (str (_Bdisplay) != "no display") then 
{
	_ChildControl = _Bdisplay displayCtrl 1160;
        //Change It
		form_Balance= [Wallet] call A3M_handle_number;
	_ChildControl ctrlSetStructuredText parseText format ["$%1", form_Balance];
};
}; 



///////////////////////////////////////////////////////////////////////////////////////////
//Update Debit Balance in GUI

DoDebits = {
//Get the dialog display (a viewport)
_Bdisplay = findDisplay 6969;

if (str (_Bdisplay) != "no display") then 
{
	_ChildControl = _Bdisplay displayCtrl 1161;
        //Change It
		form_Debits= [Debits] call A3M_handle_number;
	_ChildControl ctrlSetStructuredText parseText format ["$%1", form_Debits];
};
}; 



A3M_fnc_TnE = 
{ 
if (signedin == 1) then { 
PM = ParamsArray Select 0; 
disableSerialization;
plyscore = rating player;
multiplyer = plyscore * PM; 
Wallet = (Wallet + Multiplyer); 
profileNamespace setVariable ["SavedMoney", Wallet]; 
hint format ["Payday! You were paid $%1.00 for services rendered. The money has been direct deposited to your account.", multiplyer]; 
["InformationGreen", ["Payday!"]] call bis_fnc_showNotification;
player addRating -plyscore; 
plyscore = rating player;
SaveProfileNamespace;
[] call DoBalance; 
[] call DoDebits; 

} else {Hint "Guest User: You are not signed in! Please sign in to the banking system."}; 
};

A3M_SignIn = {
if (signedin == 0) then {
disableSerialization;
Wallet = 0; 
getdough= profileNamespace getVariable ["SavedMoney", 0];
Wallet = (Wallet+getdough); 
Pname = profileName;
hint format ["Welcome %1, You have signed in to the Pursuit Bank Online Banking Interface.", Pname]; 
signedin= 1; 
[] call DoBalance; 
[] call DoDebits; 
} else {hint format ["Welcome back, %1! You are already signed in!", Pname]}; 

}; 

/////////////////////////////////////////////////////////////////////////////////////////// 
// Open Dialog 
 _handle= CreateDialog "A3M_BankAccount"; 

 
 [] call DoDebits;  
 [] call DoBalance;  

};  
// Administrator Panel Predefines
//
A3M_Fnc_Testmessage = {
   if (name player == TargetPlayer) then { hint format ["Incoming Message from Field Commander: \n \n %1", PvtTextMsg]}; 
};
A3M_Fnc_MoneyToYou = {

if (name player == TargetPlayer) then {
Wallet = (Wallet + GlobalPushAmount);
ProfileNamespace SetVariable ["SavedMoney", Wallet]; 
SaveProfileNamespace;
B_defensebudget = (B_defensebudget - GlobalPushAmount);
publicVariable "B_defensebudget"; 
B_totalcost= (B_totalcost+GlobalPushAmount); 
publicVariable "B_totalcost"; 
["InformationGreen", ["Cash Advance Received!"]] call bis_fnc_showNotification;
Hint Format ["You've been advanced $%1.00 from the Operation Budget by your Team Coordinator.", GlobalPushAmount]; 
}; 

}; 
A3M_Fnc_GrantPower = {
if (name player == TargetPlayer) then {
// Compensate for rating replacement at rank switch
_Prerate = rating player; 
player setRank "MAJOR";
_SubRate = Rating player; 
Player AddRating -_SubRate; 
Player addRating _PreRate; 
// Done Compensating
["InformationGreen", ["You have been promoted!"]] call bis_fnc_showNotification;
hint format ["Congratulations %1, You have been promoted! \n \n You are vested with purchasing power within your company. Purchase wisely and work to make your company the best in the business! \n \n You may now act as a Team Coordinator.", TargetPlayer]; 
}; 
};
A3M_Fnc_MoneyFromYou = {

if (name player == TargetPlayer) then {
Wallet = (Wallet - GlobalPushAmount);
ProfileNamespace SetVariable ["SavedMoney", Wallet]; 
SaveProfileNamespace;
B_defensebudget = (B_defensebudget + GlobalPushAmount);
publicVariable "B_defensebudget"; 
B_totalcost= (B_totalcost-GlobalPushAmount); 
publicVariable "B_totalcost"; 
["InformationRed", ["You have been fined!"]] call bis_fnc_showNotification;
Hint Format ["You've been fined for $%1.00 from your personal account by your Team Coordinator. Contact your team coordinator for details about this fine / deduction.", GlobalPushAmount]; 
}; 

};
A3M_Fnc_GoToJail = {
if (name player == TargetPlayer) then {
Player SetPos (GetMarkerPos "Jail");
["InformationRed", ["You have been Incarcerated!"]] call bis_fnc_showNotification;
}; 
}; 
A3M_fnc_MoneyToAll = {
Wallet = (Wallet + 10000); 
	profileNamespace setVariable ["SavedMoney", Wallet]; 
	SaveProfileNamespace;
	B_defensebudget = (B_defensebudget - 10000);
    publicVariable "B_defensebudget"; 
	B_totalcost= (B_totalcost+10000); 
    publicVariable "B_totalcost"; 
	["InformationGreen", ["Cash Advance Received!"]] call bis_fnc_showNotification;
   	hint "You've been advanced $10,000.00 from the Operation Budget by your Team Coordinator."; 
}; 
A3M_MissionsCanceledMP = {
PlaySound "A3M_RTB"; 
VIPEscort setTaskState "Failed";
DELEscort setTaskState "Failed";
RBduty2 setTaskState "Failed";
SARMission setTaskState "Failed";
A3MRaid1 setTaskState "Failed";
sleep 2; 
["InformationRed", ["Return To Base Immediately!"]] call bis_fnc_showNotification;
Hint "Your mission was cancelled by the Team Coordinator. Return to Base Immediately for further instructions."; 
player setCurrentTask CO1; 
}; 
// Administrator Panel Script 
A3M_Fnc_AdminPanel = {

// Make sure only MAJOR rank can access Admin Panel
B_maxrankAIR = "MAJOR";
_prat2 = rank player; 
 // Gather Some Data...
  
 // Number of Playable Blufor Slots Remaining: 
 A3M_AvailSlots = playableSlotsNumber blufor; 
 
 A3M_HandlePlyrSel= {
PassedVar = _this select 1;
TargetPlayer = lbdata [1595, PassedVar];
hint format ["Operative Selected. You have selected %1", TargetPlayer];
publicVariable "TargetPlayer";

[] call DoCurSelPlyr; 

 }; 
 
 //////////////////////////////////////////////////////////////////////////////////////////////////
//Initial Budget Creator
////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////
//Initial Budget for Side - Change in ParamsArray! 
B_initialbudget= paramsArray select 1;

if (isnil"B_defensebudget") then {
B_defensebudget= B_initialbudget;
publicVariable"B_defensebudget";
};
if (isnil"B_totalcost") then {
B_totalcost= 0;
publicVariable"B_totalcost";
};
///////////////////////////////////////////////////////////////////////////////////////////
//Number Conversion by Corello
A3M_handle_number=
{
private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];
_number = [_this,0,0,[0]] call bis_fnc_param;
_mod = [_this,1,3,[0]] call bis_fnc_param;
_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;
_modBase = _digitsCount % _mod;
_numberText ="";
{
_numberText = _numberText + str _x;
if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText +",";};
} foreach _digits;
_numberText
};

// Push Budget to ALiVE Server 
ALiVEBudgetPush = {
["P_defensebudget", B_defensebudget] call ALiVE_fnc_setData;
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Budget Balance in GUI
DoAdminBudget = {
disableSerialization;
//Get the dialog display (a viewport)
_Bdisplay = findDisplay 9290;
if (str (_Bdisplay) !="no display") then
{
_ChildControl = _Bdisplay displayCtrl 1121;
//Change It
form_B_defensebudget= [B_defensebudget] call A3M_handle_number;
_ChildControl ctrlSetStructuredText parseText format ["$%1", form_B_defensebudget];

// Send Current Budget to ALiVE Server
["", "ALiVEBudgetPush", false, false, false] call bis_fnc_MP; 

};
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Total Balance in GUI
DoAdminTotal = {
disableSerialization;
//Get the dialog display (a viewport)
_BTdisplay = findDisplay 9290;
if (str (_BTdisplay) !="no display") then
{
_ChildControl2 = _BTdisplay displayCtrl 1122;
//Change It
form_B_totalcost= [B_totalcost] call A3M_handle_number;
_ChildControl2 ctrlSetStructuredText parseText format ["$%1", form_B_totalcost];
};
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Currently Selected Player in GUI
DoCurSelPlyr = {
disableSerialization;
//Get the dialog display (a viewport)
_BTdisplay = findDisplay 9290;
if (str (_BTdisplay) !="no display") then
{
_ChildControl3 = _BTdisplay displayCtrl 1124;
//Change It
if (isNil "TargetPlayer") then {_ChildControl3 ctrlSetStructuredText parseText format ["None"];} else {
_ChildControl3 ctrlSetStructuredText parseText format ["%1", TargetPlayer];
}; 
};
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Available Slots in GUI
DoPlyblSltCnt = {
disableSerialization;
//Get the dialog display (a viewport)
_BTdisplay = findDisplay 9290;
if (str (_BTdisplay) !="no display") then
{
_ChildControl3 = _BTdisplay displayCtrl 1123;
//Change It

if (isNil "A3M_AvailSlots") then {A3M_AvailSlots = "SP / ERROR"};

_ChildControl3 ctrlSetStructuredText parseText format ["%1", A3M_AvailSlots];
};
};

// Done With The Predefines and setup........
 //  Evaluate whether you are important enough to access this module...
 if (_prat2 != B_maxrankAIR) then { Hint "You are not the Team Coordinator, and may not access the Admin Panel. Only the team coordinator may access this feature."} else {
 
 // Define how to get a list of players in game: 
 A3M_GetPlayers = {
 lbClear 1595;
 _idx= { lbAdd [1595, name _x] } forEach allPlayers; 
 // Pass the player's actual name along with the index number:
{lbSetData [1595, _forEachIndex, name _X ]} forEach allPlayers; 
 };
 
 // This is to test the locality execution effect:  
 A3MLocalEffectTest = {
 if (isNil "TargetPlayer") then { hint " Please Select an Active Operative First!"} else {
PvtTextMsg = ctrlText 1400;
publicVariable "PvtTextMsg";
['','A3M_Fnc_Testmessage',True,False] call BIS_fnc_MP;
hint Format ["You have messaged %1 with the following message: \n \n %2", TargetPlayer, PvtTextMsg];
}; 
};
 
 // Define what buttons do: 
 
// Advance $10,000 to all Players 
CashAdvance = { 
hint "You have advanced $10,000.00 to each player in the game. This money has been subtracted from the Operational Budget. "; 
sleep 1; 
["InformationGreen", ["Global Cash Advance Issued"]] call bis_fnc_showNotification;
[ '','A3M_fnc_MoneyToAll',True,False] spawn BIS_fnc_MP; 
[] call DoAdminBudget;
[] call DoAdminTotal; 
}; 

// Advance to Individual Player (Custom Amount)
OpAdvance = {

GlobalPushAmount = ctrlText 1401;
GlobalPushAmount = parseNumber GlobalPushAmount;
publicVariable "GlobalPushAmount"; 

if (isNil "TargetPlayer") then { hint "Please Select an Active Operative First"} else {
	if (isNil "GlobalPushAmount") then { Hint "You must first set an amount."} else {
		if (GlobalPushAmount <= 0 ) then { Hint "You Can't Do That."} else {
			if (GlobalPushAmount < 1) then {Hint "You must advance more than that, cheapskate!"} else {
				if (GlobalPushAmount >= 1) then {
				['','A3M_fnc_MoneyToYou',True,False] spawn BIS_fnc_MP; 
				["InformationGreen", ["Cash Advance Issued"]] call bis_fnc_showNotification;
				sleep 1; 
				[] call DoAdminBudget;
				[] call DoAdminTotal;
				}; 
			}; 
		};
	};
};	
};
// Deduct From Individual Player 
OpDeduct = {

GlobalPushAmount = ctrlText 1401;
GlobalPushAmount = parseNumber GlobalPushAmount;
publicVariable "GlobalPushAmount";

if (isNil "TargetPlayer") then { hint " Please Select an Active Operative First"} else {
	if (isNil "GlobalPushAmount") then { Hint "You must first set an amount."} else {
		 if (GlobalPushAmount <= 0 ) then { Hint "You Can't Do That."} else {
			if (GlobalPushAmount < 1) then {Hint "You must deduct more than that, light-hand!"} else {
				if (GlobalPushAmount >= 1) then {
				['','A3M_fnc_MoneyFromYou',True,False] spawn BIS_fnc_MP; 
				["InformationRed", ["Fine Assessed"]] call bis_fnc_showNotification;
				sleep 1; 
				[] call DoAdminBudget;
				[] call DoAdminTotal;
				}; 
			};
		 };
	};
};	
};

// Bestow Purchasing Power / Promote Player

PromotePlayer = {

if (isNil "TargetPlayer") then { hint " Please Select an Active Operative First"} else {
['','A3M_Fnc_GrantPower',True,False] spawn BIS_fnc_MP; 
["InformationGreen", ["Promotion Issued"]] call bis_fnc_showNotification;
hint format ["You have promoted %1", TargetPlayer];
}; 

};


// Force Cancel All Missions
CancelAllMissions = {

SystemChat "You have issued an order to abandon all orders and RTB. Processing..."; 

sleep 2; 

// Reset JIP Tasker
MissionStatus= "M0"; 
PublicVariable "MissionStatus"; 
SystemChat "JIP Tasker Module Reset"; 

sleep 1; 

// Cancel VIP Escort Mission 
EscortActive = 0; 
publicVariable "EscortActive"; 
[VIP1] joinSilent grpnull; 

deleteVehicle VIPDest;
deleteVehicle VIPDead; 
deleteVehicle VIP1;

SystemChat "Escort Mission Cancelled."; 

sleep 1; 

// Cancel Convoy (Truck Delivery) Mission
ConveyActive = 0; 
publicVariable "ConvoyActive"; 
deleteVehicle DelDest;
deleteVehicle DelDead; 
deleteVehicle DEL1;
SystemChat "Convoy Mission Cancelled."; 

sleep 1; 

// Cancel Checkpoint Mission 
CheckpointActive = 0;
publicVariable "CheckpointActive"; 
SystemChat "Checkpoint Shift Ended Early.";

sleep 1; 

// Cancel Snatch and Extract (Hostage Rescue) Mission 
SEActive = 0; 
PublicVariable "SEActive"; 
"SAR1ICO" setmarkerpos (getMarkerpos "offmap");
deleteVehicle SAR1; 
SystemChat "Snatch And Extract Mission Cancelled.";

sleep 1; 

// Cancel Terrorist Raid I Mission 
raid1Active = 0; 
publicVariable "raid1Active"; 
SystemChat "Raid I Mission Cancelled.";

sleep 1; 

// Cancel Terrorist Raid 2 Mission 
raid2Active = 0; 
publicVariable "raid2active"; 
SystemChat "Raid II Mission Cancelled."; 

sleep 1; 

// Cancel NATO Search and Rescue (Friendly escort)
NSARActive = 0; 
publicVariable "NSARActive"; 
SystemChat "NATO Search And Rescue Mission Cancelled.";

sleep 1; 

// Cancel T9 Security Shift
T9Active = 0; 
publicVariable "T9Active"; 
SystemChat "T9 Security Shift Ended Early.";

sleep 1; 

// Cancel Hacker Den Raid 
HRaidActive = 0; 
publicVariable "HRaidActive"; 
SystemChat "Raid on Hacker Den Aborted.";

sleep 1; 

// Cancel Dignitary Speech Protection Mission 
SpeechActive = 0; 
publicVariable "SpeechActive"; 
SystemChat "Dignitary Protection Terminated.";

// Notify all players that their mission has been cancelled. 
SystemChat "Cancelling all missions for players..."; 
[ '','A3M_MissionsCanceledMP',True,False] spawn BIS_fnc_MP;

sleep 1; 

// Confirm mission cancellation was completed. 
["InformationRed", ["All Missions Cancelled!"]] call bis_fnc_showNotification;
SystemChat "All Missions Force Cancelled Successfully."; 

};



// Incarcerate
A3M_fnc_Incarcerate = {
if (isNil "TargetPlayer") then { hint " Please Select an Active Operative First!"} else {
['','A3M_Fnc_GoToJail',True,False] spawn BIS_fnc_MP; 
["InformationRed", ["Player Incarcerated!"]] call bis_fnc_showNotification;
hint format ["You have incarcerated %1 in the C-12 Detention Facility.", TargetPlayer];
};
}; 

// Refresh
A3M_Refresh = {

[] spawn A3M_GetPlayers; 
[] call DoAdminBudget;
[] call DoAdminTotal; 
[] call DoCurSelPlyr; 
[] call DoPlyblSltCnt;

}; 

// Close Dialog

A3M_Fnc_CloseDia = {
CloseDialog 0; 
TargetPlayer= nil; 
publicVariable "TargetPlayer";
GlobalPushAmount = Nil; 
PublicVariable "GlobalPushAmount";
PvtTextMsg = nil; 
PublicVariable "PvtTextMsg";
};
 ///////////////////////////////////////////////////////////////////////////////////////////
// Open Dialog
_handle= CreateDialog "A3M_AdminPanel";
// Create list of connected players 
[] spawn A3M_GetPlayers; 
[] call DoAdminBudget;
[] call DoAdminTotal; 
[] call DoCurSelPlyr; 
[] call DoPlyblSltCnt; 

}; 


}; 
// Reset Identity Pre-Defines
A3M_Fnc_PreReset = {

if (IsNil "ResetIdentActive") then {ResetIdentActive = 0};

if (ResetIdentActive == 0) then {
ResetIdentActive = 1; 
ResetIdentAct= player addAction ["Commit Suicide (Reset Identity)", {[] spawn A3M_Fnc_ResetIdent}]; 
ResetIdentRem= player addAction ["Nevermind, I want to live! (Leave Reset Mode)", {player removeAction ResetIdentAct; player removeAction ResetIdentRem}];  
};

}; 
A3M_Fnc_ResetIdent = {

["InformationRed", ["Identity Reset Initiated!"]] call bis_fnc_showNotification;

wallet = 0;  
deathrating = rating player;
profileNamespace setVariable ["SvdWeaponArray", nil]; 
profileNamespace setVariable ["SvdMagArray", nil]; 
profileNamespace setVariable ["SvdBagArray", nil]; 
profileNamespace setVariable ["SavedMoney", nil];
profileNamespace setVariable ["IsFTP_LCL", nil];  
SaveProfileNamespace;

IsFTP = nil; 

if (deathrating < 0 ) then {
player addRating deathrating;
hint "You had a negative rating before you died. You were a terrible person. Your soul will burn in hell for eternity.";
}else {
player addRating -deathrating;
hint "You pass on to your reward with a positive rating. You were a good person. You will bask in the eternal afterlife of glory."; 
};

sleep 2;  

player setDamage 1; 
hint format ["SACRIFICE! Your player identity has been deleted. Your bank account has been closed. Your rating has been reset to 0. Your stash has been emptied. Your soul has been claimed. Sign in to the bank to start a new persistent identity.", multiplyer]; 

ResetIdentActive = 0; 
player removeAction ResetIdentAct; 
};
// A3M AIR 
A3M_fnc_AIR = {

AllAllowed = ParamsArray select 7; 
if (AllAllowed == 1) then {B_maxrankAIR = rank player} else {B_maxrankAIR = "MAJOR"};
/////////////////////////////////////////////////////////////////////////////////////
//Initial Budget for Side - Change in ParamsArray! 
B_initialbudget= paramsArray select 1;
//////////////////////////////////////////////////////////////////////////////////////////////////
//Initial Budget Creator
////////////////////////////////////////////////////////////////////////////////////////////////
if (isnil"B_defensebudget") then {
B_defensebudget= B_initialbudget;
publicVariable "B_defensebudget";
};
if (isnil"B_totalcost") then {
B_totalcost= 0;
publicVariable "B_totalcost";
};

///////////////////////////////////////////////////////////////////////////////////////////
// Open Dialog
_handle= CreateDialog "A3M_AIR";

// Cost of AI 
Operator0 = 6500; 
Operator1 = 8500; 
Operator2 = 10500; 
Operator3 = 12500; 
Operator4 = 15000; 

_index0 = lbadd [2560, "Operative I ~ $6,500.00"];
_index1 = lbadd [2560, "Operative II ~ $8,500.00"];
_index2 = lbadd [2560, "Operative III ~ $10,500.00"];
_index3 = lbadd [2560, "Operative IV ~ $12,500.00"];
_index4 = lbadd [2560, "Operative V ~ $15,000.00"];

A3M_fnc_AIRhandleClick= {

AIRSelection = _this select 1;
hint format ["You have made a selection. Click *Recruit* button to hire.", AIRSelection];

switch (AIRSelection) do {

Case 0: { 

((findDisplay 2575) displayCtrl 2580) ctrlSetText "images\OperativeI.paa";

}; 

Case 1: {

((findDisplay 2575) displayCtrl 2580) ctrlSetText "images\OperativeII.paa";

};

Case 2: {

((findDisplay 2575) displayCtrl 2580) ctrlSetText "images\OperativeIII.paa";

}; 

Case 3: {

((findDisplay 2575) displayCtrl 2580) ctrlSetText "images\OperativeIV.paa";

}; 

Case 4: {

((findDisplay 2575) displayCtrl 2580) ctrlSetText "images\OperativeV.paa";

}; 

}; 

}; 

A3M_Fnc_HandleRct = {

switch (AIRSelection) do {

case 0: {

_prat2 = Rank Player;
if ((B_defensebudget<Operator0) OR ( _prat2 != B_maxrankAIR)) then { 

hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrankAIR,Operator0]
	}else {

	"B_G_Soldier_F" createUnit [ getMarkerPos "AIR_Spawn", group player, "CurAIRUnit = This;", 0.6];

	removeAllWeapons CurAIRUnit;
	removeAllItems CurAIRUnit;
	removeAllAssignedItems CurAIRUnit;
	removeUniform CurAIRUnit;
	removeVest CurAIRUnit;
	removeBackpack CurAIRUnit;
	removeHeadgear CurAIRUnit;
	removeGoggles CurAIRUnit;

	CurAIRUnit forceAddUniform "U_BG_Guerrilla_6_1";
	for "_i" from 1 to 2 do {CurAIRUnit addItemToUniform "30Rnd_9x21_Mag";};
	CurAIRUnit addVest "V_TacVest_oli";
	CurAIRUnit addItemToVest "NVGoggles_INDEP";
	CurAIRUnit addItemToVest "30Rnd_9x21_Mag";
	CurAIRUnit addHeadgear "H_MilCap_blue";

	CurAIRUnit addWeapon "SMG_02_F";
	CurAIRUnit addPrimaryWeaponItem "acc_pointer_IR";
	CurAIRUnit addPrimaryWeaponItem "optic_ACO_grn";
	CurAIRUnit addWeapon "Binocular";

	CurAIRUnit linkItem "ItemMap";
	CurAIRUnit linkItem "ItemCompass";
	CurAIRUnit linkItem "ACE_Altimeter";
	CurAIRUnit linkItem "tf_anprc152_2";
	CurAIRUnit linkItem "ItemGPS";

	CurAIRUnit setFace "GreekHead_A3_10_sa";
	CurAIRUnit setSpeaker "Male01ENG";
	[CurAIRUnit,"TFAegis"] call bis_fnc_setUnitInsignia;

	B_defensebudget= (B_defensebudget-Operator0);  
	publicVariable "B_defensebudget";
	B_totalcost= (B_totalcost+Operator0); 
	publicVariable "B_totalcost";
	hint "Operative I Hired. Unit will be joining you shortly.";
	}; 

};

case 1: {

_prat2 = Rank Player;

if ((B_defensebudget<Operator1) OR ( _prat2 != B_maxrankAIR)) then { 

hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrankAIR,Operator1]} 
	
	else {

	"B_G_Soldier_F" createUnit [ getMarkerPos "AIR_Spawn", group player, "CurAIRUnit = This;", 0.8];

	removeAllWeapons CurAIRUnit;
	removeAllItems CurAIRUnit;
	removeAllAssignedItems CurAIRUnit;
	removeUniform CurAIRUnit;
	removeVest CurAIRUnit;
	removeBackpack CurAIRUnit;
	removeHeadgear CurAIRUnit;
	removeGoggles CurAIRUnit;


	CurAIRUnit forceAddUniform "U_BG_Guerrilla_6_1";
	for "_i" from 1 to 3 do {CurAIRUnit addItemToUniform "16Rnd_9x21_Mag";};
	CurAIRUnit addVest "V_PlateCarrier1_rgr";
	for "_i" from 1 to 6 do {CurAIRUnit addItemToVest "10Rnd_93x64_DMR_05_Mag";};
	for "_i" from 1 to 3 do {CurAIRUnit addItemToVest "16Rnd_9x21_Mag";};
	for "_i" from 1 to 3 do {CurAIRUnit addItemToVest "HandGrenade";};
	for "_i" from 1 to 3 do {CurAIRUnit addItemToVest "SmokeShell";};
	CurAIRUnit addHeadgear "H_Booniehat_oli";


	CurAIRUnit addWeapon "srifle_DMR_05_blk_F";
	CurAIRUnit addPrimaryWeaponItem "optic_AMS_khk";
	CurAIRUnit addWeapon "hgun_P07_F";
	

	CurAIRUnit linkItem "ItemMap";


	CurAIRUnit setFace "GreekHead_A3_01";
	CurAIRUnit setSpeaker "Male01ENG";

	B_defensebudget= (B_defensebudget-Operator1);  
	publicVariable "B_defensebudget";
	B_totalcost= (B_totalcost+Operator1); 
	publicVariable "B_totalcost";
	hint "Operative II Hired. Unit will be joining you shortly.";
	}; 
};

case 2: {

_prat2 = Rank Player;
if ((B_defensebudget<Operator2) OR ( _prat2 != B_maxrankAIR)) then { 

hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrankAIR,Operator2]} 
	
	else {
	
	"B_G_Soldier_F" createUnit [ getMarkerPos "AIR_Spawn", group player, "CurAIRUnit = This;", 0.8];

	removeAllWeapons CurAIRUnit;
	removeAllItems CurAIRUnit;
	removeAllAssignedItems CurAIRUnit;
	removeUniform CurAIRUnit;
	removeVest CurAIRUnit;
	removeBackpack CurAIRUnit;
	removeHeadgear CurAIRUnit;
	removeGoggles CurAIRUnit;


	CurAIRUnit forceAddUniform "U_BG_Guerrilla_6_1";
	for "_i" from 1 to 3 do {CurAIRUnit addItemToUniform "16Rnd_9x21_Mag";};
	CurAIRUnit addVest "V_PlateCarrier1_rgr";
	for "_i" from 1 to 2 do {CurAIRUnit addItemToVest "HandGrenade";};
	for "_i" from 1 to 2 do {CurAIRUnit addItemToVest "SmokeShell";};
	for "_i" from 1 to 6 do {CurAIRUnit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 3 do {CurAIRUnit addItemToVest "16Rnd_9x21_Mag";};
	CurAIRUnit addHeadgear "rhsusf_ach_bare_wood_ess";

	CurAIRUnit addWeapon "arifle_MX_Black_F";
	CurAIRUnit addPrimaryWeaponItem "acc_pointer_IR";
	CurAIRUnit addPrimaryWeaponItem "optic_MRCO";
	CurAIRUnit addWeapon "hgun_P07_F";
	
	CurAIRUnit linkItem "ItemMap";
	CurAIRUnit linkItem "ItemCompass";
	CurAIRUnit linkItem "ACE_Altimeter";
	CurAIRUnit linkItem "tf_anprc152_3";
	CurAIRUnit linkItem "ItemGPS";
	
	CurAIRUnit setFace "WhiteHead_08";
	CurAIRUnit setSpeaker "Male01ENG";
	
	B_defensebudget= (B_defensebudget-Operator2);  
	publicVariable "B_defensebudget";
	B_totalcost= (B_totalcost+Operator2); 
	publicVariable "B_totalcost";
	
	hint "Operative III Hired. Unit will be joining you shortly.";

	};
}; 
case 3: {

_prat2 = Rank Player;
 if ((B_defensebudget<Operator3) OR ( _prat2 != B_maxrankAIR)) then { 

hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrankAIR,Operator3]} 
	
	else {
	
"B_G_Soldier_F" createUnit [ getMarkerPos "AIR_Spawn", group player, "CurAIRUnit = This;", 0.9];

removeAllWeapons CurAIRUnit;
removeAllItems CurAIRUnit;
removeAllAssignedItems CurAIRUnit;
removeUniform CurAIRUnit;
removeVest CurAIRUnit;
removeBackpack CurAIRUnit;
removeHeadgear CurAIRUnit;
removeGoggles CurAIRUnit;

CurAIRUnit forceAddUniform "U_BG_Guerrilla_6_1";
for "_i" from 1 to 3 do {CurAIRUnit addItemToUniform "16Rnd_9x21_Mag";};
CurAIRUnit addItemToUniform "HandGrenade";
CurAIRUnit addVest "V_PlateCarrier1_rgr";
for "_i" from 1 to 2 do {CurAIRUnit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {CurAIRUnit addItemToVest "SmokeShell";};
for "_i" from 1 to 3 do {CurAIRUnit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 3 do {CurAIRUnit addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 5 do {CurAIRUnit addItemToVest "3Rnd_HE_Grenade_shell";};
CurAIRUnit addHeadgear "rhsusf_ach_bare_wood_ess";

CurAIRUnit addWeapon "arifle_MX_GL_Black_F";
CurAIRUnit addPrimaryWeaponItem "acc_pointer_IR";
CurAIRUnit addPrimaryWeaponItem "optic_MRCO";
CurAIRUnit addWeapon "hgun_P07_F";

CurAIRUnit linkItem "ItemMap";
CurAIRUnit linkItem "ItemCompass";
CurAIRUnit linkItem "ACE_Altimeter";
CurAIRUnit linkItem "tf_anprc152_3";
CurAIRUnit linkItem "ItemGPS";

CurAIRUnit setFace "WhiteHead_08";
CurAIRUnit setSpeaker "Male01ENG";

B_defensebudget= (B_defensebudget-Operator3);  
publicVariable "B_defensebudget";
B_totalcost= (B_totalcost+Operator3); 
publicVariable "B_totalcost";
	
hint "Operative IV Hired. Unit will be joining you shortly.";

}; 
};

case 4: {

_prat2 = Rank Player;
if ((B_defensebudget<Operator4) OR ( _prat2 != B_maxrankAIR)) then { 

hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrankAIR,Operator4]} 
	
	else {
	
"B_G_Soldier_F" createUnit [ getMarkerPos "AIR_Spawn", group player, "CurAIRUnit = This;", 0.99];

removeAllWeapons CurAIRUnit;
removeAllItems CurAIRUnit;
removeAllAssignedItems CurAIRUnit;
removeUniform CurAIRUnit;
removeVest CurAIRUnit;
removeBackpack CurAIRUnit;
removeHeadgear CurAIRUnit;
removeGoggles CurAIRUnit;

CurAIRUnit forceAddUniform "U_BG_Guerrilla_6_1";
for "_i" from 1 to 3 do {CurAIRUnit addItemToUniform "16Rnd_9x21_Mag";};

CurAIRUnit addVest "V_PlateCarrier1_rgr";
for "_i" from 1 to 2 do {CurAIRUnit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 7 do {CurAIRUnit addItemToVest "20Rnd_762x51_Mag";};
CurAIRUnit addHeadgear "rhsusf_ach_bare_wood_ess";

CurAIRUnit addWeapon "srifle_DMR_03_F";
CurAIRUnit addPrimaryWeaponItem "acc_pointer_IR";
CurAIRUnit addPrimaryWeaponItem "optic_Hamr";
CurAIRUnit addWeapon "hgun_P07_F";

CurAIRUnit linkItem "ItemMap";
CurAIRUnit linkItem "ItemCompass";
CurAIRUnit linkItem "ACE_Altimeter";
CurAIRUnit linkItem "tf_anprc152_3";
CurAIRUnit linkItem "ItemGPS";

CurAIRUnit setFace "WhiteHead_08";
CurAIRUnit setSpeaker "Male01ENG";

	B_defensebudget= (B_defensebudget-Operator4);  
	publicVariable "B_defensebudget";
	B_totalcost= (B_totalcost+Operator4); 
	publicVariable "B_totalcost";
	
hint "Operative V Hired. Unit will be joining you shortly.";
}; 
};

};

};

}; 
/* MOD VERSION ONLY 

A3M_fnc_PrgBar = {

params [["_text","Test",[""]],["_actionTime",15,[0]],["_animation","InBaseMoves_assemblingVehicleErc",[""]]];
private ["_startTime","_totalTime","_progressBar","_progressText"];

if (player getVariable ["isBusy",false]) exitWith {}; // IF PLAYER IS BUSY ALREADY, EXIT
player setVariable ["isBusy",true,true]; // SETS THE PLAYER'S STATUS TO BUSY

disableSerialization;
("A3M_progressBar" call BIS_fnc_rscLayer) cutRsc ["A3M_ProgressBar", "PLAIN", 0.001, false]; // display PROGRESS BAR

_progressBar = ((uiNamespace getVariable "A3M_ProgressBar") displayCtrl 22202);
_progressBar progressSetPosition 0;
_progressText = ((uiNamespace getVariable "A3M_ProgressBar") displayCtrl 22201);
_progressText ctrlSetText _text;


_startTime = time; // Start Time
_totalTime = time + _actionTime; // Expected finish time

	if ( vehicle player == player ) then {
		if (animationState player != _Animation) then {
			player switchMove _Animation; // PLAYS ANIMATION IF PLAYER IS NOT PLAYING THE ANIMATION
			player playMoveNow _Animation;
		};
	};
	
waitUntil {

	_progressBar progressSetPosition ((time - _startTime)/_actionTime); // Sets the progress position of the progress bar.
	
	(!alive player) || (time >= _totalTime) // if player is dead or passed end time, exit
};

player setVariable ["isBusy",false,true]; // SETS THE PLAYER'S STATUS TO NOT BUSY

if (!alive player) then {
	_progressText ctrlSetText "Action Aborted"; // ACTION NOT COMPLETED
	hint "Action aborted";
	_progressBar progressSetPosition 0;
} else {
	_progressText ctrlSetText "Action Completed";
	[[ player, "AidlPercMstpSlowWrflDnon_AI" ], "switchMoveEverywhere" ] call BIS_fnc_MP; 
	hint "Action Completed";
};

sleep 0.5;
("A3M_progressBar" call BIS_fnc_rscLayer) cutText ["", "PLAIN"]; // HIDES PROGRESS BAR

};
*/ 

A3M_MP_GetDown = {
_Source= (_this select 0); 
_Source say3D "A3M_GetDown";
};
A3M_MP_KYHD = {
_Source= (_this select 0); 
_Source say3D "A3M_KYHD";
};
///////////////////////////////////////////////////////////////////////////////////////////
//Number Conversion by Corello - thx bro.
A3M_handle_number=
{
private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];
_number = [_this,0,0,[0]] call bis_fnc_param;
_mod = [_this,1,3,[0]] call bis_fnc_param;
_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;
_modBase = _digitsCount % _mod;
_numberText ="";
{
_numberText = _numberText + str _x;
if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText +",";};
} foreach _digits;
_numberText
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