/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  


PMC Basic Loadout Applicator V 1.0 by Cody Salazar AKA Fr33d0m 
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

PMCRegular = _This Select 0; 

_Debug = 0; 

IsFTP = profileNamespace getVariable "IsFTP_LCL";

sleep 1;

if (_Debug == 1) then {Hint Format ["IsFTP S1? %1", IsFTP]; sleep 2;};

if (IsNil "IsFTP") then {IsFTP = 1};

if (_Debug == 1) then {Hint Format ["IsFTP s2 ? %1", IsFTP]; sleep 2;};

removeAllWeapons PMCRegular;
removeAllItems PMCRegular;
removeAllAssignedItems PMCRegular;
removeUniform PMCRegular;
removeVest PMCRegular;
removeBackpack PMCRegular;
removeHeadgear PMCRegular;
removeGoggles PMCRegular;

PMCRegular forceAddUniform "U_BG_Guerrilla_6_1";
PMCRegular addHeadgear "H_Cap_usblack";
PMCRegular addWeapon "ItemMap";

if (_Debug == 1) then {Hint Format ["IsFTP s3 ? %1", IsFTP]; sleep 2;};

if (IsFTP == 1) then {

titleText ["Welcome To Your First Day on the Job. You have been issued a Pistol, 6 x 9mm Ammo, A Pistol Belt, A Map, and a small time credit (Submit time in banking app to get money)from OPSG. These are the only free things you will get for this identity, so save them, and use them wisely. You are responsible for all purchases going forward. Use your personal stash to store extra gear, and save your current gear with ALiVE Persistence! ALiVE Autosaves your current gear every 5 minutes.","PLAIN DOWN"]; 

PMCRegular addWeapon "hgun_Rook40_F";
PMCRegular addVest "V_Rangemaster_belt";

for "_i" from 1 to 6 do {PMCRegular addItemToVest "16Rnd_9x21_Mag";};

player addRating 500; 

profileNamespace setVariable ["IsFTP_LCL", 0]; 
saveProfileNamespace; 

} else {

if (_Debug == 1) then {Hint Format ["IsFTP s4 ? %1", IsFTP]; sleep 2;};

titleText ["Welcome back operative! We hope you were responsible enough to store your gear before clocking out last shift? PROTIP: Use ALiVE to restore your gear from last session...autosave every 5 minutes!","PLAIN DOWN"]; 

}; 

sleep 10; 

removeBackpack player; 