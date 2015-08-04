/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/    

Weapon Locker Script V 0.01 by Cody Salazar AKA Fr33d0m 
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

class A3M_WpnLkr
{
    idd = 9550;
	movingEnable = true;
	enableSimulation = true;
	
class Controls
{ 

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Salazar, v1.063, #Davijy)
////////////////////////////////////////////////////////

class A3M_Dia_Stashframe: RscFrame
{
	Moving = 1; 
	idc = 1800;
	x = 0.211596 * safezoneW + safezoneX;
	y = 0.147901 * safezoneH + safezoneY;
	w = 0.583539 * safezoneW;
	h = 0.682191 * safezoneH;
};
class A3M_Dia_CurInv: RscListbox
{
	OnLbDblClick = "_this spawn HandleCurInv";
	idc = 1525;
	text = "On Person"; //--- ToDo: Localize;
	x = 0.225063 * safezoneW + safezoneX;
	y = 0.224923 * safezoneH + safezoneY;
	w = 0.162718 * safezoneW;
	h = 0.594166 * safezoneH;
};
class A3M_Dia_Stashbox: RscListbox
{
	OnLbDblClick = "_this spawn HandleCurStash";
	idc = 1526;
	text = "In Stash"; //--- ToDo: Localize;
	x = 0.606608 * safezoneW + safezoneX;
	y = 0.224923 * safezoneH + safezoneY;
	w = 0.17394 * safezoneW;
	h = 0.594166 * safezoneH;
};
class A3M_Btn_AddToStash: RscButton
{
	Action = "[] spawn MoveToStash";
	idc = 1600;
	text = "Add To Stash"; //--- ToDo: Localize;
	x = 0.43828 * safezoneW + safezoneX;
	y = 0.246929 * safezoneH + safezoneY;
	w = 0.11783 * safezoneW;
	h = 0.0440123 * safezoneH;
};
class A3M_Btn_TakeFromStash: RscButton
{
	Action = "[] spawn GetFromStash";
	idc = 1601;
	text = "Take From Stash"; //--- ToDo: Localize;
	x = 0.43828 * safezoneW + safezoneX;
	y = 0.301945 * safezoneH + safezoneY;
	w = 0.11783 * safezoneW;
	h = 0.0440123 * safezoneH;
};
class A3M_Btn_Discard: RscButton
{
	Action = "[] spawn DiscardItem";
	idc = 1602;
	text = "Discard Item From Stash"; //--- ToDo: Localize;
	x = 0.423692 * safezoneW + safezoneX;
	y = 0.35696 * safezoneH + safezoneY;
	w = 0.145885 * safezoneW;
	h = 0.0440123 * safezoneH;
};
class A3M_Btn_ExitStash: RscButton
{
	action = "CloseDialog 0";
	idc = 1603;
	text = "Exit"; //--- ToDo: Localize;
	x = 0.460723 * safezoneW + safezoneX;
	y = 0.755272 * safezoneH + safezoneY;
	w = 0.0729424 * safezoneW;
	h = 0.0550154 * safezoneH;
};
class A3M_Dia_LkrImg: RscPicture
{
	idc = 1200;
	text = "images\WeaponLocker.paa";
	x = 0.399003 * safezoneW + safezoneX;
	y = 0.411975 * safezoneH + safezoneY;
	w = 0.196383 * safezoneW;
	h = 0.330092 * safezoneH;
};
class A3M_DiaTxt_PersTtl: RscText
{
	idc = 1000;
	text = "Personal Stash"; //--- ToDo: Localize;
	x = 0.456235 * safezoneW + safezoneX;
	y = 0.130297 * safezoneH + safezoneY;
	w = 0.151496 * safezoneW;
	h = 0.0550154 * safezoneH;
};
class A3M_DiaTxt_Inv: RscText
{
	idc = 1001;
	text = "Inventory"; //--- ToDo: Localize;
	x = 0.275562 * safezoneW + safezoneX;
	y = 0.169908 * safezoneH + safezoneY;
	w = 0.0448876 * safezoneW;
	h = 0.0550154 * safezoneH;
};
class A3M_DiaTxt_St: RscText
{
	idc = 1002;
	text = "Stash"; //--- ToDo: Localize;
	x = 0.67394 * safezoneW + safezoneX;
	y = 0.169908 * safezoneH + safezoneY;
	w = 0.0448876 * safezoneW;
	h = 0.0550154 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////



}; 
}; 