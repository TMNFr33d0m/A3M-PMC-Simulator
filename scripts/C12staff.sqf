/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/            



C-12 NPC Animation Script V 1.0 by Cody Salazar AKA Fr33d0m 
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

sol1 disableAI "ANIM";
sol2 disableAI "ANIM";
sol3 disableAI "ANIM";
sol4 disableAI "ANIM";
sol5 disableAI "ANIM";
sol6 disableAI "ANIM";
westin disableAI "ANIM";
mayes disableAI "ANIM";
mayes disableAI "MOVE"; 
CivLead disableAI "MOVE"; 
CivLead allowDamage False; 
HR_Rep disableAI "ANIM"; 
//
//
sol1 switchMove "InBaseMoves_patrolling1"; 
sol2 switchMove "InBaseMoves_patrolling2";
sol3 switchMove "InBaseMoves_patrolling1";
sol4 switchMove "InBaseMoves_HandsBehindBack1";
sol5 switchMove "InBaseMoves_patrolling2";
sol6 switchMove "InBaseMoves_HandsBehindBack1";
mayes switchMove "AmovPercMstpSnonWnonDnon_Ease";
westin switchMove "AmovPercMstpSnonWnonDnon_Ease";
CivLead switchMove "InBaseMoves_HandsBehindBack1";

[[ HR_Rep, "HubSittingChairA_idle1" ], "switchMoveEverywhere" ] call BIS_fnc_MP;
HR_Rep attachTo [HRChair,[0,0.05,-0.55]]; 
HR_Rep setDir (getDIr HRChair);
HR_Rep setDir 180; 
sleep 0.1;


removeAllWeapons HR_Rep;
removeAllItems HR_Rep;
removeAllAssignedItems HR_Rep;
removeUniform HR_Rep;
removeVest HR_Rep;
removeBackpack HR_Rep;
removeHeadgear HR_Rep;
removeGoggles HR_Rep;

HR_Rep forceAddUniform "U_Marshal";
HR_Rep addHeadgear "H_Cap_blk_CMMG";
HR_Rep addGoggles "G_Spectacles";

HR_Rep linkItem "ItemCompass";
HR_Rep linkItem "ItemWatch";
HR_Rep linkItem "tf_anprc152_1";

HR_Rep setFace "WhiteHead_03";
HR_Rep setSpeaker "Male01ENG";