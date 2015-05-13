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

Cannabis, Sativa and Indica, (The legal, medical variety) for giving me the patience and focus to complete this project over, and over again. 

And last, but definitely not least, the A3 community, who through over 250+ encouraging messages highly encouraged me to continue this project. I'm glad you like it, 
and I hope you enjoy the things I have in the works! 

################################## LET US BEGIN #################################### */


class A3M_store
{
    idd = 420;
	movingEnable = true;
	enableSimulation = true;
	
class Controls
{ 

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by CPL Salazar, v1.063, #Gofody)
////////////////////////////////////////////////////////

class A3M_StoreFrame: RscFrame
{
	idc = 1800;
	text = "Internet Voyager V 1.69.420"; //--- ToDo: Localize;
	x = 0.0988381 * safezoneW + safezoneX;
	y = 0.0818968 * safezoneH + safezoneY;
	w = 0.7794 * safezoneW;
	h = 0.825204 * safezoneH;
};

class A3M_Comm_Video: RscPicture
{
	autoplay = 1; 
	loops = 100; 

	idc = 1200;
	text = "images\FleetMgmtImg.jpg";
	x = 0.108008 * safezoneW + safezoneX;
	y = 0.119305 * safezoneH + safezoneY;
	w = 0.481394 * safezoneW;
	h = 0.275068 * safezoneH;
};
class A3M_Exitbutton: RscButton
{
	action = "closeDialog 0; [] call A3M_fnc_silence;"

	idc = 1600;
	text = "Exit"; //--- ToDo: Localize;
	x = 0.831245 * safezoneW + safezoneX;
	y = 0.86309 * safezoneH + safezoneY;
	w = 0.0401102 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Exit the Internet"; //--- ToDo: Localize;
};
class A3M_BalanceTitle: RscText
{
	idc = 1000;
	text = "Operation Budget Balance:"; //--- ToDo: Localize;
	x = 0.603156 * safezoneW + safezoneX;
	y = 0.0973005 * safezoneH + safezoneY;
	w = 0.131787 * safezoneW;
	h = 0.0330092 * safezoneH;
};
class A3M_BudgetBalance: RscStructuredText
{
	idc = 1100;
	x = 0.763621 * safezoneW + safezoneX;
	y = 0.101701 * safezoneH + safezoneY;
	w = 0.108871 * safezoneW;
	h = 0.0330092 * safezoneH;
	colorBackground[] = {0,0,0.25,0.001};
};
class A3M_TotalTitle: RscText
{
	idc = 1001;
	text = "Total Operation Cost:"; //--- ToDo: Localize;
	x = 0.622641 * safezoneW + safezoneX;
	y = 0.147913 * safezoneH + safezoneY;
	w = 0.108871 * safezoneW;
	h = 0.0220062 * safezoneH;
};
class A3M_TotalBalance: RscStructuredText
{
	idc = 1101;
	x = 0.75789 * safezoneW + safezoneX;
	y = 0.143511 * safezoneH + safezoneY;
	w = 0.114601 * safezoneW;
	h = 0.0330092 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class A3M_RankDisplay: RscText
{
	idc = 1002;
	text = "Your Rank Info:"; //--- ToDo: Localize;
	x = 0.649003 * safezoneW + safezoneX;
	y = 0.191924 * safezoneH + safezoneY;
	w = 0.080218 * safezoneW;
	h = 0.0220062 * safezoneH;
};
class A3M_CurrentRank: RscStructuredText
{
	idc = 1102;
	x = 0.734966 * safezoneW + safezoneX;
	y = 0.194125 * safezoneH + safezoneY;
	w = 0.137521 * safezoneW;
	h = 0.0770215 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class A3M_SelectWheeled: RscButton
{
	action = "[] call DoAddWheel"; 

	idc = 1604;
	text = "Auto Dealership"; //--- ToDo: Localize;
	x = 0.236379 * safezoneW + safezoneX;
	y = 0.411978 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Jump into the Motor Fleet UI to purchase wheeled vehicles"; //--- ToDo: Localize;
};
class A3M_SelectArmor: RscButton
{
	action = "[] call DoAddArmored";

	idc = 1605;
	text = "Armor Depot"; //--- ToDo: Localize;
	x = 0.1103 * safezoneW + safezoneX;
	y = 0.411978 * safezoneH + safezoneY;
	w = 0.103156 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Browse our Armored Vehicle Fleet"; //--- ToDo: Localize;
};
class A3M_RotaryVeh: RscButton
{
	action = "[] call DoAddRotary";

	idc = 1606;
	text = "Helicopters"; //--- ToDo: Localize;
	x = 0.522924 * safezoneW + safezoneX;
	y = 0.411978 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Browse our Rotary Aircraft Fleet"; //--- ToDo: Localize;
};
class A3M_SelectPlanes: RscButton
{
	action = "[] call DoAddFixedWing";

	idc = 1607;
	text = "Aircraft"; //--- ToDo: Localize;
	x = 0.379651 * safezoneW + safezoneX;
	y = 0.411978 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Browse Fixed-Wing Assets"; //--- ToDo: Localize;
};
class A3M_SelectionWindow: RscListbox
{
	onLBDblClick = "_this spawn A3M_fnc_handleClick";

	idc = 1500;
	x = 0.1103 * safezoneW + safezoneX;
	y = 0.455989 * safezoneH + safezoneY;
	w = 0.756477 * safezoneW;
	h = 0.374092 * safezoneH;
};
class A3M_VehMod: RscCombo
{
	idc = 2100;
	text = "Supported Vehicle Mods"; //--- ToDo: Localize;
	x = 0.654709 * safezoneW + safezoneX;
	y = 0.411978 * safezoneH + safezoneY;
	w = 0.206312 * safezoneW;
	h = 0.0330081 * safezoneH;
	onLBSelChanged = "_this spawn A3M_fnc_handleModClick";
};

class A3M_ModTxt: RscText
{
	idc = 1003;
	text = "Supported Modifications: "; //--- ToDo: Localize;
	x = 0.654734 * safezoneW + safezoneX;
	y = 0.37897 * safezoneH + safezoneY;
	w = 0.149003 * safezoneW;
	h = 0.0330081 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
//EOF bitches
};
