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
// GUI EDITOR OUTPUT START (by Salazar, v1.063, #Naxuqo)
////////////////////////////////////////////////////////

class M_MissionFrame: RscFrame
{
	Moving = 1; 
	idc = 1901;
	text = "WarMail Encrypted Email Service"; //--- ToDo: Localize;
	x = 0.152262 * safezoneW + safezoneX;
	y = 0.114892 * safezoneH + safezoneY;
	w = 0.605738 * safezoneW;
	h = 0.869243 * safezoneH;
};
class M_EmailWindow: RscListbox
{
	onLBDblClick = "_this spawn A3M_fnc_Email";
	idc = 1905;
	text = "Inbox: "; //--- ToDo: Localize;
	x = 0.275653 * safezoneW + safezoneX;
	y = 0.180911 * safezoneH + safezoneY;
	w = 0.448695 * safezoneW;
	h = 0.209058 * safezoneH;
};
class M_Inbox_Text: RscText
{
	idc = 1000;
	text = "Inbox: "; //--- ToDo: Localize;
	x = 0.236392 * safezoneW + safezoneX;
	y = 0.180911 * safezoneH + safezoneY;
	w = 0.0343688 * safezoneW;
	h = 0.0220062 * safezoneH;
};
class Email_Close_Button: RscButton
{
	action="closeDialog 0";
	idc = 1600;
	text = "Close"; //--- ToDo: Localize;
	x = 0.197131 * safezoneW + safezoneX;
	y = 0.918117 * safezoneH + safezoneY;
	w = 0.0729129 * safezoneW;
	h = 0.0440123 * safezoneH;
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "images\inboxBlank.paa";
	x = 0.275653 * safezoneW + safezoneX;
	y = 0.389969 * safezoneH + safezoneY;
	w = 0.448695 * safezoneW;
	h = 0.583163 * safezoneH;
};
class A3M_Btn_AcceptMission: RscButton
{
	
	action = "_this spawn A3M_Fnc_AcceptMission"; 
	idc = 1601;
	text = "Accept Contract"; //--- ToDo: Localize;
	x = 0.169088 * safezoneW + safezoneX;
	y = 0.852098 * safezoneH + safezoneY;
	w = 0.100956 * safezoneW;
	h = 0.0440123 * safezoneH;
};
class A3m_Dia_MMsgTxt: RscText
{
	idc = 1001;
	text = "Message: "; //--- ToDo: Localize;
	x = 0.225175 * safezoneW + safezoneX;
	y = 0.378966 * safezoneH + safezoneY;
	w = 0.0448695 * safezoneW;
	h = 0.0550154 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
};