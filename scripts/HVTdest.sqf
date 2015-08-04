/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/    

HVT Mission Script V 1.0 by Cody Salazar AKA Fr33d0m 
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

A3M_VIP_Escort = {

if (isNil "EscortActive") then { EscortActive = 0; };

if (EscortActive == 0) then {
hint "Mission Accepted";
EscortActive = 1; 
publicVariable "EscortActive"; 
HVTposarray = ["HVTpos1", "HVTpos2", "HVTpos3", "HVTpos4", "HVTpos5", "HVTpos6", "HVTpos7", "HVTpos8", "HVTpos9"];
HVTDestination= HVTposarray select floor random count HVTposarray;
sleep 1.0; 
PublicDestination= HVTDestination;
publicVariable "PublicDestination"; 


A3M_fnc_EscortTask = {
VIPEscort=player createSimpleTask ["Escort VIP"]; 
VIPEscort SetSimpleTaskDescription ["Escort the Valetta Executive to his Destination. Protect him at all costs.", "Escort VIP", "VIP's Destination"];
VIPEscort SetSimpleTaskDestination (getMarkerPos PublicDestination);
VIPEscort setTaskState "Assigned"; 
player setCurrentTask VIPEscort; 
playMusic "Assigned";
hint "Escort the VIP to his destination. Check your map for details.";
};

A3M_fnc_EscortSuccess = {
VIPEscort setTaskState "Succeeded"; 
hint "You have safely escorted the VIP to his destination. He should be safe until the next team comes to escort him back. RTB";
[VIP1] join grpnull; 
VIP1 allowDamage False;
playMusic "Success"; 
deleteVehicle VIPDest;
deleteVehicle VIPDead;
sleep 20.0; 
deleteVehicle VIP1;
escortActive = 0; 
publicVariable "EscortActive"; 
 
}; 

A3M_fnc_EscortFailed = {
VIPEscort setTaskState "Failed"; 
playMusic "Failure";
hint "You have Failed to safely escort the VIP to his destination. This was a costly mistake. RTB immediately.";
[VIP1] join grpnull; 
deleteVehicle VIPDest;
deleteVehicle VIPDead; 
sleep 10.0; 
deleteVehicle VIP1;
escortActive = 0; 
publicVariable "EscortActive"; 


}; 

A3M_fnc_DestinationTrigger = {
VIPDest= createTrigger ["EmptyDetector", getMarkerPos PublicDestination]; 
VIPDest setTriggerArea [10, 10, 0, false]; 
VIPDest setTriggerActivation ["ANY", "PRESENT", True]; 
VIPDest setTriggerType "NONE";
VIPDest setTriggerStatements ["VIP1 in thislist", "[ '','A3M_fnc_EscortSuccess',True,False] spawn BIS_fnc_MP ", ""]; 
}; 

A3M_fnc_DeathTrigger = {
VIPDead= createTrigger ["EmptyDetector", getMarkerPos PublicDestination]; 
VIPDead setTriggerArea [0, 0, 0, false]; 
VIPDead setTriggerActivation ["ANY", "PRESENT", True]; 
VIPDead setTriggerType "NONE";
VIPDead setTriggerStatements ["!Alive VIP1", "[ '','A3M_fnc_EscortFailed',True,False] spawn BIS_fnc_MP ", ""]; 
}; 


["","A3M_fnc_EscortTask",True,False] spawn BIS_fnc_MP; 
"PMC_VIP_F" createUnit [getPos Player, group player, "VIP1 = this", 0.9, "COLONEL" ];
call A3M_fnc_DestinationTrigger;
call A3M_fnc_DeathTrigger; 
}
else 
{ hint "An Escort Mission is currently active. You must wait until the escort mission is completed before you can start another" }; 

};

// EOF 