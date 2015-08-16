/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  
                                                                                                             



Fleet Management GUI V 2.0 by Cody Salazar AKA Fr33d0m 
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


class A3M_HomePage
{
    idd = 460;
	movingEnable = true;
	enableSimulation = true;
	
class Controls
{ 


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Salazar, v1.063, #Xiryry)
////////////////////////////////////////////////////////

class RscPicture_1950: RscPicture
{
	Moving = 1; 
	idc = 1950;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.0679565 * safezoneW + safezoneX;
	y = 0.0378707 * safezoneH + safezoneY;
	w = 0.858476 * safezoneW;
	h = 0.924259 * safezoneH;
};
class RscPicture_2000: RscPicture
{
	idc = 2000;
	text = "images\OPSG_Home.paa";
	x = 0.0679565 * safezoneW + safezoneX;
	y = 0.0378712 * safezoneH + safezoneY;
	w = 0.858476 * safezoneW;
	h = 0.924259 * safezoneH;
};
class A3M_Btn_PBank: RscClrButton
{
	action="[] call A3M_Fnc_AccessBank";
	idc = 2150;
	x = 0.567331 * safezoneW + safezoneX;
	y = 0.114892 * safezoneH + safezoneY;
	w = 0.35349 * safezoneW;
	h = 0.0880246 * safezoneH;
	tooltip = "Access Pursuit Bank"; //--- ToDo: Localize;
};
class A3M_Btn_Fleet: RscClrButton
{
	action="execVM 'scripts\FleetMgmt.sqf'";
	idc = 2200;
	x = 0.0735675 * safezoneW + safezoneX;
	y = 0.455988 * safezoneH + safezoneY;
	w = 0.403989 * safezoneW;
	h = 0.187052 * safezoneH;
	tooltip = "Lazarus Fleet Management"; //--- ToDo: Localize;
};
class A3M_Btn_Arms: RscClrButton
{
	action="execVM 'scripts\ItemStore.sqf'";
	idc = 2250;
	x = 0.567331 * safezoneW + safezoneX;
	y = 0.21392 * safezoneH + safezoneY;
	w = 0.347879 * safezoneW;
	h = 0.110031 * safezoneH;
	tooltip = "Lazarus Security Supply"; //--- ToDo: Localize;
};
class A3M_Btn_Admin: RscClrButton
{
	action="[] spawn A3M_Fnc_AdminPanel";
	idc = 2300;
	x = 0.399003 * safezoneW + safezoneX;
	y = 0.874104 * safezoneH + safezoneY;
	w = 0.145885 * safezoneW;
	h = 0.0770215 * safezoneH;
	tooltip = "Administrator Login"; //--- ToDo: Localize;
};
class A3M_Btn_Mail: RscClrButton
{
	action="execVM 'scripts\handleTasks.sqf'";
	idc = 2350;
	x = 0.236285 * safezoneW + safezoneX;
	y = 0.753071 * safezoneH + safezoneY;
	w = 0.151496 * safezoneW;
	h = 0.132037 * safezoneH;
	tooltip = "Access Email"; //--- ToDo: Localize;
};
class A3M_Btn_Exit: RscClrButton
{
	Action = "CloseDialog 0; SwitchScreen setObjectTexture [0, 'images\LoginScreen.paa']; [] call A3M_fnc_silence;";
	idc = 2400;
	x = 0.892767 * safezoneW + safezoneX;
	y = 0.0378707 * safezoneH + safezoneY;
	w = 0.0336657 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Exit Browser"; //--- ToDo: Localize;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
//EOF bitches
};
