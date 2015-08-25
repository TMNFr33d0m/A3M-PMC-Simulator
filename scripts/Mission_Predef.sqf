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
publicVariable "B_DefenseBudget"; 
}; 

hint "Budget Increase Secured. OPSG has been allotted $150,000.00";

player setCurrentTask CO1;
};
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
			
	} else {player sideChat "A Mission is already active, and cannot be duplicated."}; 
	
  } else {player sideChat "A Checkpoint Mission has been activated. "};
}; 