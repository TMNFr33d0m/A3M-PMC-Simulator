/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  
                                                                                                             



Email (Mission Selector) GUI V 1.0 by Cody Salazar AKA Fr33d0m 
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

class A3M_VMS
{
    idd = 1420;
	movingEnable = true;
	enableSimulation = true;
	
class Controls
{ 
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Fr33d0m, v1.063, #Popofo)
////////////////////////////////////////////////////////

class M_MissionFrame: RscFrame
{
	Moving = 1; 
	idc = 1901;
	text = "WarMail Encrypted Email Service"; //--- ToDo: Localize;
	x = 0.270799 * safezoneW + safezoneX;
	y = 0.224923 * safezoneH + safezoneY;
	w = 0.45825 * safezoneW;
	h = 0.550154 * safezoneH;
};
class M_EmailWindow: RscListbox
{
	idc = 1905;
	text = "Inbox: "; //--- ToDo: Localize;
	x = 0.276529 * safezoneW + safezoneX;
	y = 0.345957 * safezoneH + safezoneY;
	w = 0.446943 * safezoneW;
	h = 0.363102 * safezoneH;
	onLBDblClick = "_this spawn A3M_fnc_Email";
};
class M_Inbox_Text: RscText
{
	idc = 1935;
	text = "Inbox: "; //--- ToDo: Localize;
	x = 0.276529 * safezoneW + safezoneX;
	y = 0.312948 * safezoneH + safezoneY;
	w = 0.0343688 * safezoneW;
	h = 0.0220062 * safezoneH;
};
class Email_Close_Button: RscButton
{
	idc = 1931;
	text = "Close"; //--- ToDo: Localize;
	x = 0.276603 * safezoneW + safezoneX;
	y = 0.742068 * safezoneH + safezoneY;
	w = 0.045825 * safezoneW;
	h = 0.0220062 * safezoneH;
	action = "closeDialog 0; [] call A3M_fnc_silence";
};

};
};