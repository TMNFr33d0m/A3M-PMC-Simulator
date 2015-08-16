/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  
                                                                                                             


AI Recruiter GUI V 2.0 by Cody Salazar AKA Fr33d0m 
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


class A3M_AIR
{
    idd = 2575;
	movingEnable = true;
	enableSimulation = true;
	
class Controls
{ 

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Salazar, v1.063, #Gyquxe)
////////////////////////////////////////////////////////

class A3M_Dia_PersMngr: RscFrame
{
	Moving = 1; 
	idc = 2570;
	text = "Personnel Management "; //--- ToDo: Localize;
	x = 0.198185 * safezoneW + safezoneX;
	y = 0.185425 * safezoneH + safezoneY;
	w = 0.594655 * safezoneW;
	h = 0.670946 * safezoneH;
};
class A3M_Dia_SolPic: RscPicture
{
	idc = 2580;
	text = "images\AIR_Main.paa";
	x = 0.20274 * safezoneW + safezoneX;
	y = 0.224923 * safezoneH + safezoneY;
	w = 0.336521 * safezoneW;
	h = 0.550154 * safezoneH;
};
class RscListbox_2560: RscListbox
{
	OnLbDblClick = "_this call A3M_fnc_AIRhandleClick";
	idc = 2560;
	x = 0.556096 * safezoneW + safezoneX;
	y = 0.225022 * safezoneH + safezoneY;
	w = 0.229956 * safezoneW;
	h = 0.550154 * safezoneH;
};
class A3M_Btn_Rcrt: RscButton
{
	action = "[] call A3M_Fnc_HandleRct";

	idc = 2561;
	text = "Recruit"; //--- ToDo: Localize;
	x = 0.275602 * safezoneW + safezoneX;
	y = 0.785977 * safezoneH + safezoneY;
	w = 0.0841493 * safezoneW;
	h = 0.0439965 * safezoneH;
};
class A3M_Btn_RcClose: RscButton
{
	action = "closeDialog 0";
	idc = 2562;
	text = "Close"; //--- ToDo: Localize;
	x = 0.640249 * safezoneW + safezoneX;
	y = 0.785977 * safezoneH + safezoneY;
	w = 0.0841493 * safezoneW;
	h = 0.0439965 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};