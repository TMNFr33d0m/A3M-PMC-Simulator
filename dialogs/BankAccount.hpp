/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  
                                                                                                             



Bank Account GUI V 1.1 by Cody Salazar AKA Fr33d0m 
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

class A3M_BankAccount
{
    idd = 6969;
	movingEnable = true;
	enableSimulation = true;
	
class Controls
{ 
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Fr33d0m, v1.063, #Bihuki)
////////////////////////////////////////////////////////

class A3M_Bank_Frame: RscFrame
{
	Moving = 1; 
	idc = 1860;
	text = "Pursuit Bank - Member FDICK"; //--- ToDo: Localize;
	x = 0.270875 * safezoneW + safezoneX;
	y = 0.224923 * safezoneH + safezoneY;
	w = 0.45825 * safezoneW;
	h = 0.28608 * safezoneH;
};
class A3M_AcctBalDyn: RscStructuredText
{
	idc = 1160;
	x = 0.585922 * safezoneW + safezoneX;
	y = 0.345957 * safezoneH + safezoneY;
	w = 0.131747 * safezoneW;
	h = 0.0330092 * safezoneH;
};
class AcctBalTitle: RscText
{
	idc = 1060;
	text = "Account Balance: "; //--- ToDo: Localize;
	x = 0.608834 * safezoneW + safezoneX;
	y = 0.323951 * safezoneH + safezoneY;
	w = 0.0801938 * safezoneW;
	h = 0.0220062 * safezoneH;
};
class A3M_SignIn: RscButton
{
	idc = 1660;
	text = "Sign in"; //--- ToDo: Localize;
	x = 0.276603 * safezoneW + safezoneX;
	y = 0.345957 * safezoneH + safezoneY;
	w = 0.0515531 * safezoneW;
	h = 0.0440123 * safezoneH;
	action = "[] spawn A3M_SignIn";
};
class A3M_ExitButton: RscButton
{
	idc = 1661;
	text = "Secure SignOut"; //--- ToDo: Localize;
	x = 0.631747 * safezoneW + safezoneX;
	y = 0.466991 * safezoneH + safezoneY;
	w = 0.09165 * safezoneW;
	h = 0.0330092 * safezoneH;
	action = "closeDialog 0;"; 

};
class A3M_SubmitTime: RscButton
{
	idc = 1662;
	text = "Submit Timesheet"; //--- ToDo: Localize;
	x = 0.345341 * safezoneW + safezoneX;
	y = 0.345957 * safezoneH + safezoneY;
	w = 0.131747 * safezoneW;
	h = 0.0440123 * safezoneH;
	action = "[] spawn A3M_fnc_TnE"; 
};
class A3M_DebitsDyn: RscStructuredText
{
	idc = 1161;
	x = 0.276603 * safezoneW + safezoneX;
	y = 0.466991 * safezoneH + safezoneY;
	w = 0.131747 * safezoneW;
	h = 0.0330092 * safezoneH;
	
};
class A3M_DebitText: RscText
{
	idc = 1061;
	text = "Debits:"; //--- ToDo: Localize;
	x = 0.322428 * safezoneW + safezoneX;
	y = 0.444985 * safezoneH + safezoneY;
	w = 0.0400969 * safezoneW;
	h = 0.0220062 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
}; 
}; 
