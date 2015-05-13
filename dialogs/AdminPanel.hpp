/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  
                                                                                                             



Administrator Panel GUI V 1.0 by Cody Salazar AKA Fr33d0m 
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
class A3M_AdminPanel
{
    idd = 9290;
	movingEnable = true;
	enableSimulation = true;
	
class Controls
{ 

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Fr33d0m, v1.063, #Mevevi)
////////////////////////////////////////////////////////

class A3M_AdminFrame: RscFrame
{
	idc = 1845;
	text = "Orion Private Security Group - Administrative Options"; //--- ToDo: Localize;
	x = 0.270799 * safezoneW + safezoneX;
	y = 0.224923 * safezoneH + safezoneY;
	w = 0.458403 * safezoneW;
	h = 0.550154 * safezoneH;
	tooltip = "By Cody Salazar AKA Fr33d0m - www.A3MilSim.com"; //--- ToDo: Localize;
};
class A3M_ExitButton: RscButton
{
	idc = 1640;
	text = "Exit"; //--- ToDo: Localize;
	x = 0.671901 * safezoneW + safezoneX;
	y = 0.720062 * safezoneH + safezoneY;
	w = 0.0458403 * safezoneW;
	h = 0.0330092 * safezoneH;
	action = "closeDialog 0;"
};
class A3M_10k2All: RscButton
{
	idc = 1641;
	text = "Advance $10,000 To All Players"; //--- ToDo: Localize;
	x = 0.282259 * safezoneW + safezoneX;
	y = 0.268935 * safezoneH + safezoneY;
	w = 0.160441 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Advance $10,000 to each player from the operational budget."; //--- ToDo: Localize;
	action = "[] spawn CashAdvance"
};
class A3M_CancelAllMissions: RscButton
{
	idc = 1642;
	text = "Force Cancel All Missions"; //--- ToDo: Localize;
	x = 0.45416 * safezoneW + safezoneX;
	y = 0.268935 * safezoneH + safezoneY;
	w = 0.131791 * safezoneW;
	h = 0.0330092 * safezoneH;
	action = "[] spawn CancelAllMissions"
	
	
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
}; 
}; 

