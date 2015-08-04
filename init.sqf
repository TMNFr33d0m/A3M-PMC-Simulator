/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/      
                                                                                                                                                                 
                                                                                                             



Item Store V 3.0 by Cody Salazar AKA Fr33d0m 
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


// The line below is very important for  A3M revive, The Sitting Script and the Base Animations. 
switchMoveEverywhere = compileFinal " _this select 0 switchMove (_this select 1);";
//the line below makes base animations happen
[[[],"scripts\C12staff.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
// T9 Facility Staff 
[[[],"scripts\T9staff.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;


//The Line Below calls all the predefines for the mission. Most of the MP Compat stuff is done via predefine 

//The line below plays the intro text at spawn in. 

// Load the Common Predefines (Huge!!) 
execVM "scripts\Common_Predef.sqf";
sleep 2;
execVM "scripts\intro.sqf";
//the line below starts the briefing
execVM "scripts\briefing.sqf"; 
// Initiate Bank Account
[] call A3M_Fnc_InitBank; 
// the line below starts the JIP Tasker. 
execVM "scripts\initask.sqf"; 

waitUntil {player == player}; 
[player] execVM "Scripts\PMCBasic.sqf"; 

//  Detention Center Predefines
// execVM "scripts\Detention.sqf"; 

//   RHS NUKE Function !! Stupid place to save it....
//   [position,yield,radius] call rhs_fnc_ss21_nuke
// EX [getpos player,10000,1000] call rhs_fnc_ss21_nuke





 



