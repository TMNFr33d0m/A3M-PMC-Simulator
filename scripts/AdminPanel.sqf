/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/      
 
Admin Panel V 1.0 by Cody Salazar AKA Fr33d0m 
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

B_maxrank = "MAJOR";
_prat = rank player; 

 if (_prat != B_maxrank) then { Hint "You are not the Team Coordinator, and may not access the Admin Panel. Only the team coordinator may access this feature."} else {

 ///////////////////////////////////////////////////////////////////////////////////////////
// Open Dialog
_handle= CreateDialog "A3M_AdminPanel"; 

CashAdvance = { 
hint "You have advanced $10,000.00 to each player in the game. This money has been subtracted from the Operational Budget. "; 
sleep 1; 
[ '','A3M_fnc_MoneyToAll',True,False] spawn BIS_fnc_MP; 
[] call DoBudget;
[] call DoTotal; 
}; 

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
hint "Escort Mission Cancelled"; 
sleep 1; 
ConveyActive = 0; 
publicVariable "ConvoyActive"; 
deleteVehicle DelDest;
deleteVehicle DelDead; 
deleteVehicle DEL1;
hint "Convoy Mission Cancelled"; 
sleep 1; 
CheckpointActive = 0;
publicVariable "CheckpointActive"; 
hint "Checkpoint Mission Cancelled";
sleep 1; 
SEActive = 0; 
PublicVariable "SEActive"; 
"SAR1ICO" setmarkerpos (getMarkerpos "offmap");
deleteVehicle SAR1; 
hint "Snatch And Extract Mission Cancelled";
sleep 1; 
raid1Active = 0; 
publicVariable "raid1Active"; 
hint "Raid I Mission Cancelled";
raid2Active = 1; 
publicVariable "raid2active"; 
hint "Raid II Mission Cancelled"; 
sleep 1; 
hint "Cancelling all missions for players"; 
sleep 1; 
[ '','A3M_MissionsCanceledMP',True,False] spawn BIS_fnc_MP;
sleep 1; 
hint "All Missions Force Cancelled Successfully."; 
};

Coroner = {
{ if (!alive _x) then { deletevehicle _x } } foreach (nearestObjects [center, ["Man", "Car", "Tank", "Helicopter"], 7500]);
};
 
}; 
