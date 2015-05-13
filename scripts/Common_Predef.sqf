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

Corello, for helping me with forming long numbers in Arma without truncation, and his awesome wife #define, for her work and encouragement. 

Cannabis, Sativa and Indica, (The legal, medical variety) for giving me the patience and focus to complete this project over, and over again. 

And last, but definitely not least, the A3 community, who through over 250+ encouraging messages highly encouraged me to continue this project. I'm glad you like it, 
and I hope you enjoy the things I have in the works! 

################################## LET US BEGIN #################################### */

// MISSION PREDEFINES

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
hint "Budget Increase Secured. OPSG has been allotted $500,000.00";
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
B_defensebudget = (B_defensebudget + 500000); 
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
hint "Rating Earned: 300"; 
sleep 3; 
hint "Budget Increase Secured. OPSG has been allotted $750,000.00";
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
B_defensebudget = (B_defensebudget+ 750000); 
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
player addRating 500; 
hint "You were paid 500 rating points for this operation. Thank you for your hard work. We recognize that Outlaws PSG and it's sub-contractors are always dedicated professionals. \n ~Astral Corp HR"; 
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
hint "Eliminate the rogue military unit, and clear the compound of all hostiles. Check your map and briefing for details.";
}; 

A3M_Raid_2MP = {
A3MRaid2=player createSimpleTask ["Move to the Enemy Terrorist City and eliminate the enemy forces."]; 
A3MRaid2 SetSimpleTaskDescription ["The Altian Government requests assistance in dealing with a foreign terrorist cell that has taken over an entire city. The Altian Government cannot risk an international incident by stepping in, but the Altian police forces are unprepared and ill equipped to handle this situation. OPSG is hereby contracted to eliminate all terror cells operating in Altis. ", "Eliminate Terror Cell", "Terrorist City"];
A3MRaid2 SetSimpleTaskDestination (getMarkerPos "sg2");
A3MRaid2 setTaskState "Assigned"; 
player setCurrentTask A3MRaid2; 
playMusic "Assigned";
hint "Eliminate the rogue military unit, and clear the compound of all hostiles. Check your map and briefing for details.";
}; 

A3M_fnc_RaidClearMP = {
A3MRaid1 setTaskState "Succeeded"; 
hint " You have cleared the terror cell operating here. Well done."; 
player addRating 1000; 
sleep 2; 
hint "You have recieved 1000 rating points for successfully clearing this objective."; 
sleep 3; 
hint "Outlaws PSG has been awarded $2m in operational funds from our client, Astral corp. Great job!"; 
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
player addRating 2500;
hint "You have been paid 2,500 rating points for your services."; 
sleep 2; 
hint "Outlaws PSG has been awarded $5m in operational funds from our client, NATO. Great job!"; 
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
hint "Outlaws PSG has been awarded $3m in operational funds from our client, NATO. Great job!"; 
player setCurrentTask CO1;
}; 

A3M_fnc_T9failedMP = {
T9Task setTaskState "Failed"; 
playMusic "Failure"; 
hint "You have failed to meet the conditions of your contract. The contract has been cancelled and you are to RTB Immediately"; 
player setCurrentTask CO1;
}; 