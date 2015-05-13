/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/    

Operations HQ Predefines A V1.0 by Cody Salazar AKA Fr33d0m 
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

saved for later
this addAction ["Move to Observation Room", {Player setPos (getMarkerPos "obs")} ]; this addAction ["Security Mode On", {[] spawn Add_MPPowers} ]; this addAction ["Security Mode Off", {[] spawn Remove_MPPowers } ]; 

################################## LET US BEGIN #################################### */


//GUI  Location ID Function 
DRI_HQmsg = {
[
		
		[
			["Orion Private ","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
			["Security Group","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"],
			["","<br/>"],
			["Operations HQ","align = 'center' shadow = '1' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

}; 


DRI_ArmoryMsg = {
[
		
		[
			["Orion Private ","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
			["Security Group","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"],
			["","<br/>"],
			["Armory","align = 'center' shadow = '1' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

}; 
DRI_MPHQMsg = {
[
		
		[
			["Orion Private ","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
			["Security Group","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"],
			["","<br/>"],
			["Detention Center","align = 'center' shadow = '1' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

}; 


// HQ Radio (Plays music) 
DRI_ABCT2_HQRadio = {
HQ_MusicSource say3D "Showdown"; 
HQ_MusicSource removeAction TurnOn; 
HQ_MusicSource addAction ["Turn Off", { HQ_MusicSource say3D ""; HQ_MusicSource removeAction TurnOff; TurnOn = HQ_MusicSource addAction ["Turn on radio", {[] spawn DRI_ABCT2_HQRadio} ] } ]; };  


// Define Slides with MP Compat 

DRI_ABCT2_MPimg1 = {
PresBoard setObjectTexture [0, "images\Deadly_Zones_Slide.paa"];
}; 


// MP Compatible Television(s)

DRI_ABCT2_DHQTV = { 

CMDTVON = 1;

while {CMDTVON == 1} do {

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television1.jpg"]; 
sleep 3; } else {CMD_TV setObjectTexture [0, "images\TVNoise.jpg"];};

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television2.jpg"]; 
sleep 3;  } else {CMD_TV setObjectTexture [0, "images\TVNoise.jpg"];};

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television3.jpg"]; 
sleep 3;   } else {CMD_TV setObjectTexture [0, "images\TVNoise.jpg"]; };

if (CMDTVON == 1) then {
CMD_TV setObjectTexture [0, "images\Television4.jpg"]; 
sleep 3;  } else { CMD_TV setObjectTexture [0, "images\TVNoise.jpg"];  };
}; 

}; 

DRI_ABCT2_DHQTVOFF = {
CMDTVON = 0; 
CMD_TV setObjectTexture [0, "images\TVNoise.jpg"];
}; 


DRI_ABCT2_MPTV = { 

MPTVON = 1;


while {MPTVON == 1} do {

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television1.jpg"];
sleep 3;} else {MP_TV setObjectTexture [0, "images\TVNoise.jpg"]; };

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television2.jpg"]; 
sleep 3; } else {MP_TV setObjectTexture [0, "images\TVNoise.jpg"]; };

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television3.jpg"]; 
sleep 3;} else  {MP_TV setObjectTexture [0, "images\TVNoise.jpg"]; };

if (MPTVON == 1) then {
MP_TV setObjectTexture [0, "images\Television4.jpg"]; 
sleep 3;} else {MP_TV setObjectTexture [0, "images\TVNoise.jpg"]; };

}; 

}; 


DRI_ABCT2_MPTVOFF = {

MPTVON = 0; 
MP_TV setObjectTexture [0, "images\TVNoise.jpg"];
}; 

//  ["","DRI_ABCT2_MPimg1",True,False] spawn BIS_fnc_MP;
