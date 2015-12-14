/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  
                                                                                                             


NATO "Lost & Scared" Mission 1.0 by Cody Salazar AKA Fr33d0m 
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

A3M_fnc_SARSuccess = {
['','A3M_fnc_SARSuccessMP',True,False] call BIS_fnc_MP;
B_defensebudget = (B_defensebudget + 1500000); 

MissionStatus = "M0"; 
publicVariable "MissionStatus";

NSARActive = 0; 
publicVariable "NSARActive"; 
}; 

A3M_fncNSARFailed = {
['','A3M_fnc_SARfailedMP',True,False] call BIS_fnc_MP;

MissionStatus = "M0"; 
publicVariable "MissionStatus";

NSARActive = 0; 
publicVariable "NSARActive"; 
}; 
A3M_fnc_SARfound = {

['','A3M_fnc_SARfoundMP',True,False] call BIS_fnc_MP;

NSARpt2 = 1; 
publicVariable "NSARpt2"; 

NSAR move Getmarkerpos NSARDestNo; 

EnChance = [1, 0, 0, 0, 0, 0, 0, 1, 0, 0];
EnPres= EnChance select floor random count EnChance;
		if (EnPres == 1) then {
		_SARWen= [getMarkerPos NSARDestNo, EAST, ["O_G_Soldier_F", "O_G_Soldier_F", "O_G_Soldier_A_F", "O_G_Soldier_A_F","O_G_Soldier_F","O_G_Soldier_F","O_G_Soldier_F","O_G_Soldier_F"]] call BIS_fnc_spawnGroup;
		[_SARWen, getPos player] call BIS_fnc_taskAttack;
		}; 

NSARdest2= createTrigger ["EmptyDetector", getMarkerPos NSARDestNo]; 
NSARdest2 setTriggerArea [20, 20, 0, false]; 
NSARdest2 setTriggerActivation ["ANY", "PRESENT", True]; 
NSARdest2 setTriggerType "NONE";
NSARdest2 setTriggerStatements ["NSARlead in thislist", "[] call A3M_fnc_SARSuccess", ""]; 

}; 


NSARpt2 = 0; 
publicVariable "NSARpt2";
 
NSARrandNo= ["NSAR1","NSAR2","NSAR3","NSAR4","NSAR5","NSAR6","NSAR7","NSAR8","NSAR9","NSAR10"]; 
NSARPickedNo= NSARrandNo select floor random count NSARrandNo; 
publicVariable "NSARPickedNo";

NSARDestNo1= ["NSARD1","NSARD2","NSARD3","NSARD4","NSARD5"]; 
NSARDestNo= NSARDestNo1 select floor random count NSARDestNo1; 
publicVariable "NSARDestNo";

NSARdest= createTrigger ["EmptyDetector", getMarkerPos NSARPickedNo]; 
NSARdest setTriggerArea [20, 20, 0, false]; 
NSARdest setTriggerActivation ["ANY", "PRESENT", True]; 
NSARdest setTriggerType "NONE";
NSARdest setTriggerStatements ["player in thislist", "[] call A3M_fnc_SARfound", ""]; 

['','A3M_fnc_StartTaskNSARMP',True,False] call BIS_fnc_MP;

NSAR= [getMarkerPos NSARPickedNo, west, ["B_Soldier_F", "B_Soldier_F", "B_Soldier_F", "B_Soldier_A_F"]] call BIS_fnc_spawnGroup;
sleep 1; 

NSARlead = NSAR createUnit ["B_officer_F", getMarkerPos NSARPickedNo, [], 0, "FORM"];
sleep 1; 

NSARen= [getMarkerPos "oreo", EAST, ["O_G_Soldier_F", "O_G_Soldier_F", "O_G_Soldier_A_F", "O_G_Soldier_A_F", "O_G_Soldier_F", "O_G_Soldier_F", "O_G_Soldier_A_F", "O_G_Soldier_A_F"]] call BIS_fnc_spawnGroup;
[NSARen, getMarkerPos NSARPickedNo] call BIS_fnc_taskAttack;

while {(NSARActive == 1)} do {
if (!Alive NSARlead) then {[] call A3M_fncNSARFailed}; 
}; 