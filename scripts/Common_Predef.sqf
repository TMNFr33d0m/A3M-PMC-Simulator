/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  


OPSG Common Predefines by Cody Salazar AKA Fr33d0m 
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

// MISSION PREDEFINES

// Escort Mission Pre-Defines:"
A3M_fnc_EscortTask = {
VIPEscort=player createSimpleTask ["Escort VIP"]; 
VIPEscort SetSimpleTaskDescription ["Escort the Astral Corporation Executive to his Destination. Protect him at all costs.", "Escort VIP", "VIP's Destination"];
VIPEscort SetSimpleTaskDestination (getMarkerPos PublicDestination);
VIPEscort setTaskState "Assigned"; 
player setCurrentTask VIPEscort; 
playMusic "Assigned";
hint "Escort the VIP to his destination. Check your map for details.";
};

A3M_fnc_EscortSuccessMP = {
VIPEscort setTaskState "Succeeded"; 
hint "You have safely escorted the executive to his destination. He should be safe until the next team comes to escort him back. RTB";
playMusic "Success"; 
sleep 3; 
player addRating 300; 
hint "Rating Earned: 300"; 
sleep 3: 
hint "Budget Increase Secured. OPSG has been allotted $50,000.00";
player setCurrentTask CO1;
}; 


A3M_fnc_EscortSuccess = {
['','A3M_fnc_EscortSuccessMP',True,False] call BIS_fnc_MP;
"VIP1ICO" setmarkerpos (getMarkerpos "offmap");
[VIP1] join grpnull; 
VIP1 allowDamage False;
deleteVehicle VIPDest;
deleteVehicle VIPDead;
sleep 5.0; 
deleteVehicle VIP1;
escortActive = 0; 
publicVariable "escortActive";
missionStatus = "M0";
publicVariable "missionStatus"; 
B_defensebudget = (B_defensebudget + 50000); 
publicVariable "B_defensebudget"; 
}; 

A3M_EscortFailedMP= {
VIPEscort setTaskState "Failed"; 
playSound "MissionFailed"; 
playMusic "Failure";
hint "You have Failed to safely escort the VIP to his destination. This was a costly mistake. RTB immediately.";
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
hint "Drive the supply truck to it's destination. Check your map for details.";
};

A3M_fnc_ConvoySuccessMP = {
DELEscort setTaskState "Succeeded"; 
hint "You have safely delivered the Supplies to their destination. Astral Corporation will take control of the truck from here. RTB";
playMusic "Success"; 
sleep 3; 
player addRating 300; 
hint "Rating Earned: 500"; 
sleep 3; 
hint "Budget Increase Secured. OPSG has been allotted $75,000.00";
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
hint "You have Failed to safely escort the truck to it's destination. This was a costly mistake. RTB immediately.";
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
hint "Our Vital Monitors indicate that the Astral Corp Executive you were commissioned to rescue has been killed. The mission is FUBAR. Return to Base."; 
SARMission setTaskState "FAILED";
playSound "MissionFailed";  
PlayMusic "Failure"; 
sleep 5; 
player addRating 250; 
hint "You were paid 250 rating points for operation time. \nYou were docked 250 rating points for poor performance in the field. \n ~ Astral Corp HR";
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
hint "You have successfully returned the executive to the OPSG compound. He will be debriefed and receive medical treatment. Great job!"; 
SARMission setTaskState "Succeeded"; 
PlayMusic "Success"; 
sleep 5; 
player addRating 850; 
hint "You were paid 850 rating points for this operation. Thank you for your hard work. We recognize that Orion Private Security Group and it's sub-contractors are always dedicated professionals. \n ~Astral Corp HR"; 
sleep 3; 
hint "Budget Increase Secured. OPSG has been allotted $1,500,000.00";
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
hint "Rescue the captured Astral Corporation executive. Check your map briefing for details.";
}; 

A3M_fnc_ChangeSARDest= {
SARMission SetSimpleTaskDescription ["An Astral Corporation executive has been rescued. Return him to the C-12 compund safe and sound. ", "Snatch and Extract", " RTB"];
SARMission SetSimpleTaskDestination (getMarkerPos "BA");
hint "The Package has been secured. Move to HQ immediately! Out."; 
}; 


// Raid Mission
A3M_Raid_1MP = {
A3MRaid1=player createSimpleTask ["Move to the Enemy Terrorist Compound and eliminate the enemy forces."]; 
A3MRaid1 SetSimpleTaskDescription ["The Altian Government requests assistance in dealing with a foreign terrorist cell that has taken over a compound. The Altian Government cannot risk an international incident by stepping in, but the Altian police forces are unprepared and ill equipped to handle this situation. OPSG is hereby contracted to eliminate all terror cells operating in Altis. ", "Eliminate Terror Cell", "Terrorist Compound"];
A3MRaid1 SetSimpleTaskDestination (getMarkerPos "sg1");
A3MRaid1 setTaskState "Assigned"; 
player setCurrentTask A3MRaid1; 
playMusic "Assigned";
hint "Eliminate the rogue military unit, and clear the compound of all hostile forces. Check your map and briefing for details.";
}; 

A3M_Raid_2MP = {
A3MRaid2=player createSimpleTask ["Move to the Enemy Terrorist City and eliminate the enemy forces."]; 
A3MRaid2 SetSimpleTaskDescription ["The Altian Government requests assistance in dealing with a foreign terrorist cell that has taken over an entire city. The Altian Government cannot risk an international incident by stepping in, but the Altian police forces are unprepared and ill equipped to handle this situation. OPSG is hereby contracted to eliminate all terror cells operating in Altis. ", "Eliminate Terror Cell", "Terrorist City"];
A3MRaid2 SetSimpleTaskDestination (getMarkerPos "sg2");
A3MRaid2 setTaskState "Assigned"; 
player setCurrentTask A3MRaid2; 
playMusic "Assigned";
hint "Eliminate the rogue military unit, and clear the compound of all hostile forces. Check your map and briefing for details.";
}; 

A3M_fnc_RaidClearMP = {
A3MRaid1 setTaskState "Succeeded"; 
hint " You have cleared the terror cell operating here. Well done."; 
player addRating 2000; 
sleep 2; 
hint "You have received 2000 rating points for successfully clearing this objective."; 
sleep 3; 
hint "OPSG has been awarded $2m in operational funds from our client, Astral corp. Great job!"; 
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
hint "Assist in an urgent NATO extraction. Time is of the essence, get to the AO immediately!! Check your map and briefing for details.";
};

A3M_fnc_SARfoundMP = {
NSARTask setTaskState "Succeded"; 
hint "You have located the NATO team, and they are beginning to move to extraction now. Assist them to their extraction point.";  
NSARTask=player createSimpleTask ["Escort NATO forces to their Extraction Point."]; 
NSARTask SetSimpleTaskDescription ["You have located the straded NATO forces. Escort them to as they egress to their destination. These are soldiers, and they will fight, but you're being paid to make sure they make it safe! Stay sharp! ", "Assist NATO Operatives", "NATO Extract"];
NSARTask SetSimpleTaskDestination (getMarkerPos NSARDestNo);
NSARTask setTaskState "Assigned"; 
player setCurrentTask NSARTask; 
playMusic "Assigned";
hint "You have located the NATO team. Move with them to their designated extraction point, and keep them alive. Most importantly, keep the officer with the group alive at all costs. He has intelligence secret NATO needs. ";
}; 

A3M_fnc_SARSuccessMP = {
NSARTask setTaskState "Succeded"; 
playMusic "Success"; 
hint "The NATO team has reached their extraction point. Great job! Return to Base!";
sleep 5; 
player addRating 900;
hint "You have been paid 900 rating points for your services."; 
sleep 2; 
hint "Orion Private Security Group has been awarded $5m in operational funds from our client, NATO. Great job!"; 
player setCurrentTask CO1;
}; 


A3M_fnc_SARfailedMP = {
NSARTask setTaskState "Failed"; 
playMusic "Failure"; 
hint "The NATO team has been decimated...the ranking officers killed. You have failed to meet the conditions of your contract. The contract has been cancelled and you are to RTB Immediately"; 
player setCurrentTask CO1;
}; 


// T9 Security Shift

A3M_fnc_T9_Enemy_Elim= {
hint "You have eliminated a terror cell attacking the T-9 facility. Great work."; 
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
hint "Perform Premise Security Detail at the Astral Corp. T-9 Facility. Check your map and briefing for details.";
};

A3M_fnc_T9ShiftMP = {
T9Task SetSimpleTaskDescription ["Man the front gate, patrol the perimeter and keep the facility safe and secure. You need to stay here for the duration of one shift. Keep productivity high by minimizing threats inside the facility.", "Perform Security Detail at T9 Facility", "T9 Facility"];
T9Task SetSimpleTaskDestination (getMarkerPos "T9");
T9Task setTaskState "Assigned"; 
player setCurrentTask T9Task; 
hint "Man the front gate, patrol the perimeter and keep the facility safe and secure. You need to stay here for the duration of one shift. Keep productivity high by minimizing threats inside the facility.";
};

A3M_fnc_T9SuccessMP = {
T9Task setTaskState "Succeded"; 
playMusic "Success"; 
hint "OPSG has completed a security shift at the T-9 Facility. Great job! Return to Base!";
sleep 5; 
player addRating 1000;
hint "You have been paid 1,000 rating points for your services."; 
sleep 2; 
hint "OPSG has been awarded $750,000.00 in operational funds from our client, Astral Corp. Great job!"; 
player setCurrentTask CO1;
}; 

A3M_fnc_T9failedMP = {
T9Task setTaskState "Failed"; 
playMusic "Failure"; 
hint "You have failed to meet the conditions of your contract. The contract has been cancelled and you are to RTB Immediately"; 
player setCurrentTask CO1;
}; 

// Roadblock MP Pre-Defines
// 
A3M_fnc_Roadblock = {

RBduty=player createSimpleTask ["Move To Checkpoint Duty"]; 
RBduty SetSimpleTaskDescription ["Stand at the checkpoint and perform stop and search checkpoint duties with the authority of the United Nations.", "Move To Checkpoint Duty", " Checkpoint C-12N"];
RBduty SetSimpleTaskDestination (getMarkerPos "RBC");
RBduty setTaskState "Assigned"; 
player setCurrentTask RBduty; 
hint "Move to checkpoint C-12 North and perform stop and search checkpoint duties. \n Check your map for details.";

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
if (isServer) then {
deleteVehicle RBtrg; 
}; 

RBduty2=player createSimpleTask ["Perform Checkpoint Duty"]; 
RBduty2 SetSimpleTaskDescription ["Wait for cars to stop at the checkpoint and perform stop and search checkpoint duties with the authority of the Altian Government.", "Perform Checkpoint Duty", " Checkpoint C-12N"];
RBduty2 SetSimpleTaskDestination (getMarkerPos "RBC");
RBduty2 setTaskState "Assigned"; 
hint "Welcome to the C-12 South Checkpoint. Perform stop and search duties on Altian Nationals. Be suspicious of terroristic threats.";

if (isServer) then {

execVM 'Scripts\A3MCheckpoint.sqf';

sleep 5; 

while { (CheckPointActive == 1) } do {

sleep 2; 

if !(alive RBVehD) then {
[ '','RemAllAct',True,False] call BIS_fnc_MP;
[] call A3M_fnc_handleSol;
sleep 10;
}; 

};

} else { hint "A Checkpoint Mission is currently active. You must wait until the current checkpoint shift is completed before you can start another." }; 

};

MP_Roadblock_Attitude = {

switch (RAPickedNumber) do { 
//Innocent 1
Case "M0": {
mantype= "M2"; 
removeAllActions RBVeh; 
greet= RBVeh addAction ["Greeting", {Hint "How are you today sir. Im a Altian Citizen." }];
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
RBveh addAction ["Greeting", {Hint "Howdy dooo, fucker! I'm an Altian fuckin' Citizen. Fuck outha my vay." }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Vehicle Appears normal"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The vehicle appears clean and in good repair.  \n Smells: \n The vehicle smells of alcohol \n Driver Attitude: \n Driver appears Impaired and Uncooperative"} ];
RBveh addAction ["Search", {RBVehD LeaveVehicle RBVeh; hint "Go fuck yourself, piggie wiggie."; sleep 2; hint "Searching Car....."; sleep 5; hint "Found open bottle of Russian vodka"; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; RBVehD addAction ["Arrest for DWI", { mantype= 4; publicVariable "mantype"; Hint "Abreast? Arrest meee? Fuck YOU! "; sleep 2; hint "Escort the Suspect to Altian jail. Alternately, use the Fast Transport option in the action menu to fast travel the suspect to Altian Jail."; sleep 2; [] call A3M_fnc_jailtrigger;}];}];
RBveh addAction ["Allow to Proceed", {hint "Thank ya kindly, muthafucka! I'm out."; [] Call DoExitStopSouth;}]; 
RBveh addAction ["Order To Turn Around", {hint "Bitch, Fuck you then muthafucka! I'm outta here. "; [] Call DoExitStopNorth;}]; 
}; 

// Drug Runner
Case "M2": {
mantype= "M1";
removeAllActions RBVeh; 
RBveh addAction ["Greeting", {Hint "I'm an Altian Citizen. May I please pass? " }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Anomaly Detected"}]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The Vehicle appears clean and in good repair. \n Smells:\n A faint smell of Anise is radiating from the vehicle.  \n Driver Attitude: \n The driver appears to be quite nervous."} ];
RBveh addAction ["Search", {RBVehD LeaveVehicle RBVeh; hint "I better call my lawyer. I'm not saying anything until my attorney arrives. Oh my God."; sleep 2.0; hint "Searching Car....."; sleep 6; hint "WOAH!! Found a load Cocaine!! "; sleep 2; hint "Driver: Step out of the vehicle! \n \n If the driver refuses to exit, shoot the vehicle's tires and disable it!";
		RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; 
		RBVehD addAction ["Sir, You are under arrest...", { mantype= "M4"; publicVariable "mantype"; Hint "Oh God...Oh My God....Ohhhh Shit. Fuck...FUCK ME! "; sleep 3.0; hint "Transport the Criminal to Altian Jail. Alternately, use the Fast Transport option in the action menu to fast travel the suspect to Altian Jail."; [] call A3M_fnc_jailtrigger; }];}];	
RBveh addAction ["Allow to Proceed", {hint "Okay...thanks!"; [] Call DoExitStopSouth;  }]; 
RBveh addAction ["Order To Turn Around", {hint "Okay...No problem officer."; [] Call DoExitStopNorth;} ];  
};

// Illegal Alien
Case "M3": {
mantype= "M1"; 
removeAllActions RBVeh; 
RBveh addAction ["Greeting", {Hint "Hell-Oh, Me am Altian Citizen. Surree Am!  " }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Vehicle appears normal"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The Vehicle appears dirty and aged. \n Smells:\n The vehicle smells like chewing tobacco. \n Driver Attitude: \n  The driver appears disoriented, but cooperative."} ];
RBveh addAction ["Search", { RBVehD LeaveVehicle RBVeh; hint "I cant beeleeeeeve dis es happening to meee."; sleep 2.0; hint "Searching Car....."; sleep 5; hint "Found Multiple Identifications. Upon further review, the Altian Citizen Number on the Altian ID doesn't check out..."; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh}]; RBVehD addAction ["Arrest for Illegal Immigration", { mantype= "M4"; publicVariable "mantype"; Hint "Fock you mane. You cops are always trying to keepa de mano down!  "; sleep 3.0; hint "Escort the Illegal Alien to Altian Jail. Alternately, use the Fast Transport option in the action menu to fast travel the suspect to Altian Jail."; [] call A3M_fnc_jailtrigger; } ]; } ];
RBveh addAction ["Allow to Proceed", {hint "Peace on you sire"; [] Call DoExitStopSouth;} ]; 
RBveh addAction ["Order To Turn Around", {hint "Eat a deek, bottmonch."; [] Call DoExitStopNorth;} ];
}; 

// Terrorist Attack on checkpoint - carbomb
Case "M4": {
mantype= "M3";
removeAllActions RBVeh; 
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Anomaly Detected!"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Bad1= createGroup East; [RBVeh] joinSilent Bad1; Hint "Visual Inspection: \n The vehicle appears clean, but in disrepair. Wires appear to be protruding from the drivers side door frame. \n Smells:\n The smell of Jet Fuel permeates the air. \n Driver Attitude: \n The driver appears calm."; } ];
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
RBveh addAction ["Search", { RBVehD LeaveVehicle RBVeh; hint "Officer, This is insane. Is this really needed? I know my rights!"; sleep 2.0; hint "Searching Car....."; sleep 10; hint "You found a double sided dildo. Nothing illegal in this vehicle. "; rightsviols= (rightsviols + 1); publicVariable "rightsviols"; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; } ]; 
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
RBveh addAction ["Greeting", {Hint "Hello! I'm an Altian Citizen. May I pass? " }];
RBveh addAction ["Search", {Bad1= createGroup East; [RBVeh] joinSilent Bad1; hint "You stupid fuck. I'll kill you."; [ '','RemAllAct',True,False] call BIS_fnc_MP; sleep 2.0; if (alive RBVehD) then { mantype = "M5"; publicVariable "mantype"; bomb = 'Bo_GBU12_LGB' createVehicle getPos RBVeh; hint "TERRORIST ATTACK"; }; } ]; 
RBveh addAction ["Allow to Proceed", {[] call DoExitStopSouth; hint "You live to fight another day!"; } ]; 
RBveh addAction ["Order To Turn Around", {[] call DoExitStopNorth; hint "Fuck you then!";} ]; 
}; 

// Heroin Runner
Case "M11": {
mantype= "M1"; 
removeAllActions RBVeh; 
greet= RBVeh addAction ["Greeting", {Hint "How are you today sir. Im an Altian Citizen." }];
backscatter= RBVeh addAction ["Backscatter Scanner", {Hint "Anomaly Detected"} ]; 
inspect= RBVeh addAction ["Inspect Vehicle", {Hint "Visual Inspection: \n The vehicle appears clean and in good repair. \n Smells:\n The vehicle doesn't smell of anything at all.  \n Driver Attitude: \n Driver appears calm and cooperative"} ];
search= RBVeh addAction ["Search", {RBVehD LeaveVehicle RBVeh; hint "Officer, is this really needed? This is just stupid. I know my rights! Call my lawyer! "; hint "Searching Car....."; sleep 6; hint "WOAH!! Found a load Heroin!! "; sleep 2; hint "Driver: Step out of the vehicle! \n \n If the driver refuses to exit, shoot the vehicle's tires and disable it!"; RBVehD addAction ["Return to Vehicle", {RBVehD moveInDriver RBVeh} ]; RBVehD addAction ["Sir, You are under arrest...", { mantype= "M4"; publicVariable "mantype"; Hint "Oh Mother of God. I've really done it now."; sleep 3.0; hint "Transport the Criminal to Altian Jail.  Alternately, use the Fast Transport option in the action menu to fast travel the suspect to Altian Jail.";[] call A3M_fnc_jailtrigger;}];}]; 
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
hint "Escort the Law Breaker to his destination. ";
RBVehD addAction ["Fast Transport", {[] call A3M_fnc_booked} ]; 
}; 


//PRIS MP 
A3M_FNC_PRISMP= { 
hint "The prisoner has been killed";
ALTEscort setTaskState "Failed"; 
mantype = "M0";
}; 

// CIV MP
A3M_FNC_CIVMP= {
removeAllActions RBVeh; 
hint "The Driver has been killed. This is a major civil rights violation. Expect backlash! "; 
mantype = "M0";
}; 

// TERR MP
A3M_fnc_TerrMP= {
hint "The terrorist has been neutralized. Great Job. The shooting was in policy, and the terrorist was killed before he could detonate a very lethal bomb.";
mantype = "M0";
};

//CRIM MP
A3M_FNC_CRIMMP= {
hint "The suspect has been neutralized. The shooting will come under investigation by command staff, but for your moral sake, we hope it was an in policy shooting. You know the truth in your heart."; 
mantype = "M0";
};


// This triggers when the missionCompleted Variable reaches the limit. 
A3M_fnc_rbmissionend = { 

if (CheckpointActive == 1) then {

player addRating 1500;  

hint format ["Checkpoint Duty Complete! Great job! You had %1 Rights Violation Complaints. \n Completion Bonus: \n 500 rating points  \n ~ Altis Government HR", rightsviols];

RBduty2 setTaskState "Succeeded";
MissionActive = 0; 
publicVariable "MissionActive"; 

[] call coroner;
sleep 2; 

if (isServer) then {
B_DefenseBudget = (B_DefenseBudget + 150000);
publicVariable B_DefenseBudget; 
}; 

hint "Budget Increase Secured. OPSG has been allotted $150,000.00";

player setCurrentTask CO1;
};
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
Hint Format ["You've been fined for $%1.00 from your personal account by your Team Coordinator. Contact your team coordinator for details about this fine / deduction.", GlobalPushAmount]; 
}; 

};

A3M_Fnc_GoToJail = {
if (name player == TargetPlayer) then {
Player SetPos (GetMarkerPos "Jail");
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
   	hint "You've been advanced $10,000.00 from the Operation Budget by your Team Coordinator."; 
}; 

A3M_MissionsCanceledMP = {
playSound "RTB"; 
VIPEscort setTaskState "Failed";
DELEscort setTaskState "Failed";
RBduty2 setTaskState "Failed";
SARMission setTaskState "Failed";
A3MRaid1 setTaskState "Failed";
sleep 2; 
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

///////////////////////////////////////////////////////////////////////////////////////////
//Update Budget Balance in GUI
DoBudget = {
disableSerialization;
//Get the dialog display (a viewport)
_Bdisplay = findDisplay 9290;
if (str (_Bdisplay) !="no display") then
{
_ChildControl = _Bdisplay displayCtrl 1121;
//Change It
form_B_defensebudget= [B_defensebudget] call A3M_handle_number;
_ChildControl ctrlSetStructuredText parseText format ["$%1", form_B_defensebudget];
};
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Total Balance in GUI
DoTotal = {
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
[ '','A3M_fnc_MoneyToAll',True,False] spawn BIS_fnc_MP; 
[] call DoBudget;
[] call DoTotal; 
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
				sleep 1; 
				[] call DoBudget;
				[] call DoTotal;
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
				sleep 1; 
				[] call DoBudget;
				[] call DoTotal;
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
hint format ["You have promoted %1", TargetPlayer];
}; 

};


// Force Cancel All Missions
CancelAllMissions = {

hint "You have issued an order to abandon all orders and RTB. Processing..."; 

sleep 2; 

MissionStatus= "M0"; 
PublicVariable "MissionStatus"; 
hint "JIP Tasker Module Reset"; 

sleep 1; 

EscortActive = 0; 
publicVariable "EscortActive"; 
[VIP1] joinSilent grpnull; 

deleteVehicle VIPDest;
deleteVehicle VIPDead; 
deleteVehicle VIP1;

hint "Escort Mission Cancelled."; 

sleep 1; 

ConveyActive = 0; 
publicVariable "ConvoyActive"; 
deleteVehicle DelDest;
deleteVehicle DelDead; 
deleteVehicle DEL1;
hint "Convoy Mission Cancelled."; 

sleep 1; 

CheckpointActive = 0;
publicVariable "CheckpointActive"; 
hint "Checkpoint Shift Ended Early.";

sleep 1; 

SEActive = 0; 
PublicVariable "SEActive"; 
"SAR1ICO" setmarkerpos (getMarkerpos "offmap");
deleteVehicle SAR1; 
hint "Snatch And Extract Mission Cancelled.";

sleep 1; 

raid1Active = 0; 
publicVariable "raid1Active"; 
hint "Raid I Mission Cancelled.";

sleep 1; 

raid2Active = 0; 
publicVariable "raid2active"; 
hint "Raid II Mission Cancelled."; 

sleep 1; 

NSARActive = 1; 
publicVariable "NSARActive"; 
hint "NATO Search And Rescue Mission Cancelled.";

sleep 1; 

T9Active = 1; 
publicVariable "T9Active"; 
hint "T9 Security Shift Ended Early.";

hint "Cancelling all missions for players"; 

sleep 1; 

[ '','A3M_MissionsCanceledMP',True,False] spawn BIS_fnc_MP;

sleep 1; 

hint "All Missions Force Cancelled Successfully."; 

};

// Force Cleanup
A3M_Fnc_Cleanup = {
hint "Cleanup Initiated...Removing Waste...";
{ if (!alive _x) then { deletevehicle _x } } foreach (nearestObjects [center, ["Man", "Car", "Tank", "Helicopter"], 7500]);

};

// Incarcerate
A3M_fnc_Incarcerate = {
if (isNil "TargetPlayer") then { hint " Please Select an Active Operative First!"} else {
['','A3M_Fnc_GoToJail',True,False] spawn BIS_fnc_MP; 
hint format ["You have incarcerated %1 in the C-12 Detention Facility.", TargetPlayer];
};
}; 

// Refresh
A3M_Refresh = {

[] spawn A3M_GetPlayers; 
[] call DoBudget;
[] call DoTotal; 
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
[] call DoBudget;
[] call DoTotal; 
[] call DoCurSelPlyr; 
[] call DoPlyblSltCnt; 

}; 


}; 


// Fast Travel Pre-Defines 

A3M_Fnc_ToMolos = {
player moveInCargo Molos_Taxi;
playSound "Deuce";   
titleText ["Travelling to Molos Air Facility | Orion Private Security Group Facility", "BLACK FADED",10];
titleFadeOut 5;
player action ["Eject",Molos_Taxi]; 

}; 

A3M_Fnc_ToC12 = {
player moveInCargo C12_Taxi;
playSound "Deuce";   
titleText ["Travelling to C-12 Research Facility | Astral Corporation / OPSG Facility", "BLACK FADED", 10];
titleFadeOut 5;
player action ["Eject",C12_Taxi]; 
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

// HQ Radio (Plays music) 
DRI_ABCT2_HQRadio = {
HQ_MusicSource say3D "Showdown"; 
HQ_MusicSource removeAction TurnOn; 
HQ_MusicSource addAction ["Turn Off", { HQ_MusicSource say3D ""; HQ_MusicSource removeAction TurnOff; TurnOn = HQ_MusicSource addAction ["Turn on radio", {[] spawn DRI_ABCT2_HQRadio} ] } ]; };  

// Define Slides with MP Compat 
DRI_ABCT2_MPimg1 = {
PresBoard setObjectTexture [0, "images\Deadly_Zones_Slide.paa"];
}; 

// MP Compatible Television(s)
DRI_ABCT2_DHQTV = { 

CMDTVON = 1;

while {CMDTVON == 1} do {

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television1.jpg"]; 
sleep 3; } else {CMD_TV setObjectTexture [0, "images\TVNoise.jpg"];};

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television2.jpg"]; 
sleep 3;  } else {CMD_TV setObjectTexture [0, "images\TVNoise.jpg"];};

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television3.jpg"]; 
sleep 3;   } else {CMD_TV setObjectTexture [0, "images\TVNoise.jpg"]; };

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television4.jpg"]; 
sleep 3;  } else { CMD_TV setObjectTexture [0, "images\TVNoise.jpg"];  };
}; 

}; 

DRI_ABCT2_DHQTVOFF = {
CMDTVON = 0; 
CMD_TV setObjectTexture [0, "images\TVNoise.jpg"];
}; 

DRI_ABCT2_MPTV = { 

MPTVON = 1;


while {MPTVON == 1} do {

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television1.jpg"];
sleep 3;} else {MP_TV setObjectTexture [0, "images\TVNoise.jpg"]; };

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television2.jpg"]; 
sleep 3; } else {MP_TV setObjectTexture [0, "images\TVNoise.jpg"]; };

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television3.jpg"]; 
sleep 3;} else  {MP_TV setObjectTexture [0, "images\TVNoise.jpg"]; };

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television4.jpg"]; 
sleep 3;} else {MP_TV setObjectTexture [0, "images\TVNoise.jpg"]; };

}; 

}; 

DRI_ABCT2_MPTVOFF = {

MPTVON = 0; 
MP_TV setObjectTexture [0, "images\TVNoise.jpg"];
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

// Shit - Taking Pre-Defines
A3M_Fnc_DumpAss = {

_Shitter = _this select 0;

player attachTo [_Shitter,[0,0.7,-0.4]]; 
player setDir 90;
[[ player, "HubSittingChairA_idle1" ], "switchMoveEverywhere" ] call BIS_fnc_MP;
sleep 0.2;
detach player;

AllDone= player addAction ["Done Shitting", {
detach player;
player removeAction AllDone; 
[[ player, "AidlPercMstpSlowWrflDnon_AI" ], "switchMoveEverywhere" ] call BIS_fnc_MP; 
 }
 ]; 
 
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
hint format ["SACRIFICE! Your player identity has been deleted. Your bank account has been closed. Your rating has been reset to 0. Your soul has been claimed. Sign in to the bank to start a new persistent identity.", multiplyer]; 

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
publicVariable"B_defensebudget";
};
if (isnil"B_totalcost") then {
B_totalcost= 0;
publicVariable"B_totalcost";
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

_index0 = lbadd [2560, "Operator I ~ $6,500.00"];
_index1 = lbadd [2560, "Operator II ~ $8,500.00"];
_index2 = lbadd [2560, "Operator III ~ $10,500.00"];
_index3 = lbadd [2560, "Operator IV ~ $12,500.00"];
_index4 = lbadd [2560, "Operator V ~ $15,000.00"];

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

hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrankAIR,Operator0]} 
	
	else {

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
