/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  
                                                                                                             



Roadblock Multiplayer Predefines V 1.0 by Cody Salazar AKA Fr33d0m 
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

Cannabis, Sativa and Indica, (The legal, medical variety) for giving me the patience and focus to complete this project over, and over again. 

And last, but definitely not least, the A3 community, who through over 250+ encouraging messages highly encouraged me to continue this project. I'm glad you like it, 
and I hope you enjoy the things I have in the works! 

################################## LET US BEGIN #################################### */

// MP Task: Move to Checkpoint C-12
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

player addRating 500;  

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

