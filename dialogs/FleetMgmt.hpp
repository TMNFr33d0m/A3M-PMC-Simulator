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


class A3M_store
{
    idd = 420;
	movingEnable = true;
	enableSimulation = true;
	
class Controls
{ 


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Salazar, v1.063, #Zynuso)
////////////////////////////////////////////////////////

class A3M_StoreFrame: RscFrame
{
	Moving = 1; 

	idc = 1800;
	text = "Internet Voyager V 1.69.420"; //--- ToDo: Localize;
	x = 0.0988381 * safezoneW + safezoneX;
	y = 0.0818968 * safezoneH + safezoneY;
	w = 0.7794 * safezoneW;
	h = 0.825204 * safezoneH;
	sizeEx = 1 * GUI_GRID_H;
};
class A3M_Exitbutton: RscButton
{
	action = "closeDialog 0;"

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
	idc = 1170;
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
	idc = 1171;
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
	idc = 1172;
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
	x = 0.219563 * safezoneW + safezoneX;
	y = 0.411975 * safezoneH + safezoneY;
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
	x = 0.451116 * safezoneW + safezoneX;
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
	x = 0.334771 * safezoneW + safezoneX;
	y = 0.411978 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Browse Fixed-Wing Assets"; //--- ToDo: Localize;
};
class A3M_SelectionWindow: RscListbox
{
	onLBDblClick = "_this spawn A3M_fnc_VhandleClick";

	idc = 1575;
	x = 0.1103 * safezoneW + safezoneX;
	y = 0.464793 * safezoneH + safezoneY;
	w = 0.756477 * safezoneW;
	h = 0.374092 * safezoneH;
};
class A3M_VehMod: RscCombo
{
	onLBSelChanged = "_this spawn A3M_fnc_handleModClick";
	
	idc = 2175;
	text = "Supported Vehicle Mods"; //--- ToDo: Localize;
	x = 0.654709 * safezoneW + safezoneX;
	y = 0.411978 * safezoneH + safezoneY;
	w = 0.206312 * safezoneW;
	h = 0.0330081 * safezoneH;
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
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "images\FleetMgmtImg.jpg";
	x = 0.111879 * safezoneW + safezoneX;
	y = 0.130292 * safezoneH + safezoneY;
	w = 0.482347 * safezoneW;
	h = 0.242068 * safezoneH;
};
class A3M_Btn_Prch: RscButton
{
	action="[] call A3M_Fnc_VBuyButton";
	idc = 1601;
	text = "Purchase"; //--- ToDo: Localize;
	x = 0.575156 * safezoneW + safezoneX;
	y = 0.411975 * safezoneH + safezoneY;
	w = 0.0673042 * safezoneW;
	h = 0.0330092 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
//EOF bitches
};
