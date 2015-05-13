/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/    

Rifle Range Main Script V 1.0 by Cody Salazar AKA Fr33d0m 
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
