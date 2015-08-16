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
// GUI EDITOR OUTPUT START (by Salazar, v1.063, #Zusaky)
////////////////////////////////////////////////////////

class A3M_AdminFrame: RscFrame
{
	Moving = 1; 

	idc = 1800;
	text = "A3M PMC Sandbox | Administrator Panel"; //--- ToDo: Localize;
	x = 0.0567346 * safezoneW + safezoneX;
	y = 0.134697 * safezoneH + safezoneY;
	w = 0.875309 * safezoneW;
	h = 0.770215 * safezoneH;
	tooltip = "By Cody S. AkA A3M Fr33d0m - www.A3MilSim.com"; //--- ToDo: Localize;
};
class A3M_ExitButton: RscButton
{
	action= "[] call A3M_Fnc_CloseDia;";

	idc = 1600;
	text = "Exit"; //--- ToDo: Localize;
	x = 0.875934 * safezoneW + safezoneX;
	y = 0.863102 * safezoneH + safezoneY;
	w = 0.0458403 * safezoneW;
	h = 0.0330092 * safezoneH;
};
class A3M_10k2All: RscButton
{
	action = "[] spawn CashAdvance";

	idc = 1601;
	text = "Advance $10,000 To All Players"; //--- ToDo: Localize;
	x = 0.281173 * safezoneW + safezoneX;
	y = 0.290941 * safezoneH + safezoneY;
	w = 0.160441 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Advance $10,000 to each connected player from the operational budget."; //--- ToDo: Localize;
};
class A3M_CancelAllMissions: RscButton
{
	action="[] spawn CancelAllMissions";

	idc = 1602;
	text = "Force Cancel All Missions"; //--- ToDo: Localize;
	x = 0.281173 * safezoneW + safezoneX;
	y = 0.455988 * safezoneH + safezoneY;
	w = 0.131791 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Cancel all active missions and order all players to RTB."; //--- ToDo: Localize;
};
class A3M_Dia_Oprtvs: RscListbox
{
	OnLbDblClick= "_this call A3M_HandlePlyrSel";

	idc = 1595;
	text = "Active Operatives: "; //--- ToDo: Localize;
	x = 0.0679565 * safezoneW + safezoneX;
	y = 0.224923 * safezoneH + safezoneY;
	w = 0.201994 * safezoneW;
	h = 0.671188 * safezoneH;
	tooltip = "Double Click to Activate an Operative Selection"; //--- ToDo: Localize;
};
class A3M_ctl_PlyrTxt: RscText
{
	idc = 1000;
	text = "Active Operatives: "; //--- ToDo: Localize;
	x = 0.0702008 * safezoneW + safezoneX;
	y = 0.18751 * safezoneH + safezoneY;
	w = 0.168329 * safezoneW;
	h = 0.0330092 * safezoneH;
};
class A3M_Btn_MessageClient: RscButton
{
	action="[] call A3MLocalEffectTest";

	idc = 1603;
	text = "Send Message"; //--- ToDo: Localize;
	x = 0.724438 * safezoneW + safezoneX;
	y = 0.863102 * safezoneH + safezoneY;
	w = 0.134663 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Select an operator from the list, type a message, and hit this button to send it, "; //--- ToDo: Localize;
};
class RscText_1001: RscText
{
	idc = 1001;
	x = 0.208593 * safezoneW + safezoneX;
	y = 0.976675 * safezoneH + safezoneY;
	w = 0.0448876 * safezoneW;
	h = 0.0550154 * safezoneH;
};
class A3M_Dia_MessageBox: RscEdit
{
	idc = 1400;
	x = 0.275562 * safezoneW + safezoneX;
	y = 0.852099 * safezoneH + safezoneY;
	w = 0.437654 * safezoneW;
	h = 0.0440123 * safezoneH;
	tooltip = "Type a message here."; //--- ToDo: Localize;
};
class A3M_Dia_Number: RscEdit
{
	idc = 1401;
	x = 0.281173 * safezoneW + safezoneX;
	y = 0.246929 * safezoneH + safezoneY;
	w = 0.185161 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Enter a dollar amount here"; //--- ToDo: Localize;
};
class A3M_Dia_TxtBanking: RscText
{
	idc = 1002;
	text = "Financial Control: "; //--- ToDo: Localize;
	x = 0.275562 * safezoneW + safezoneX;
	y = 0.180911 * safezoneH + safezoneY;
	w = 0.100997 * safezoneW;
	h = 0.0440123 * safezoneH;
};
class A3M_Dia_GCont: RscText
{
	idc = 1003;
	text = "Gameplay Control:"; //--- ToDo: Localize;
	x = 0.275562 * safezoneW + safezoneX;
	y = 0.405372 * safezoneH + safezoneY;
	w = 0.0953862 * safezoneW;
	h = 0.0440123 * safezoneH;
};
class A3M_Btn_AdvPlyr: RscButton
{
	action="[] Spawn OpAdvance;";

	idc = 1604;
	text = "Advance"; //--- ToDo: Localize;
	x = 0.477556 * safezoneW + safezoneX;
	y = 0.246929 * safezoneH + safezoneY;
	w = 0.0561095 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Advance the amount in the box to the player currently selected."; //--- ToDo: Localize;
};
class A3M_Btn_FinePlyr: RscButton
{
	action="[] Spawn OpDeduct;";

	idc = 1605;
	text = "Deduct"; //--- ToDo: Localize;
	x = 0.544888 * safezoneW + safezoneX;
	y = 0.246929 * safezoneH + safezoneY;
	w = 0.0504986 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Fine the selected player for the amount shown in the box. "; //--- ToDo: Localize;
};
class A3M_Btn_MovePlyrToJail: RscButton
{
	action="[] call A3M_fnc_Incarcerate;";

	idc = 1606;
	text = "Incarcerate"; //--- ToDo: Localize;
	x = 0.281173 * safezoneW + safezoneX;
	y = 0.544012 * safezoneH + safezoneY;
	w = 0.0673314 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Move this player to a C-12 detention facility cell. "; //--- ToDo: Localize;
};
class A3M_Btn_Cleanup: RscButton
{
	action="[] call A3M_Fnc_Cleanup;";

	idc = 1607;
	text = "Force Cleanup"; //--- ToDo: Localize;
	x = 0.281173 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0841643 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Force Cleanup of bodies and junk. "; //--- ToDo: Localize;
};
class A3M_Dia_RefActvOprtvs: RscButton
{
	action="[] spawn A3M_Refresh;";

	idc = 1608;
	text = "Refresh"; //--- ToDo: Localize;
	x = 0.219453 * safezoneW + safezoneX;
	y = 0.191912 * safezoneH + safezoneY;
	w = 0.0504986 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Refresh list of Active Operatives"; //--- ToDo: Localize;
};
class A3M_Dia_AmoutnTxt: RscText
{
	idc = 1004;
	text = "Amount: "; //--- ToDo: Localize;
	x = 0.275562 * safezoneW + safezoneX;
	y = 0.202917 * safezoneH + safezoneY;
	w = 0.0448876 * safezoneW;
	h = 0.0550154 * safezoneH;
};
class A3M_Dia_MsgText: RscText
{
	idc = 1005;
	text = "Message:"; //--- ToDo: Localize;
	x = 0.272196 * safezoneW + safezoneX;
	y = 0.814689 * safezoneH + safezoneY;
	w = 0.0448876 * safezoneW;
	h = 0.0550154 * safezoneH;
};
class A3M_Dia_BalncTxt: RscText
{
	idc = 1006;
	text = "Company Account Balance: "; //--- ToDo: Localize;
	x = 0.647007 * safezoneW + safezoneX;
	y = 0.235926 * safezoneH + safezoneY;
	w = 0.140274 * safezoneW;
	h = 0.0440123 * safezoneH;
};
class A3M_Dia_ActBal: RscStructuredText
{
	idc = 1121;
	x = 0.780548 * safezoneW + safezoneX;
	y = 0.246929 * safezoneH + safezoneY;
	w = 0.145885 * safezoneW;
	h = 0.0330092 * safezoneH;
};
class A3M_Dia_TotalSpent: RscStructuredText
{
	idc = 1122;
	x = 0.780548 * safezoneW + safezoneX;
	y = 0.301945 * safezoneH + safezoneY;
	w = 0.145885 * safezoneW;
	h = 0.0330092 * safezoneH;
};
class A3M_Dia_TxtTotal: RscText
{
	idc = 1007;
	text = "Total Spent: "; //--- ToDo: Localize;
	x = 0.716582 * safezoneW + safezoneX;
	y = 0.290941 * safezoneH + safezoneY;
	w = 0.0673314 * safezoneW;
	h = 0.0440123 * safezoneH;
};
class A3M_Dia_Plyblslts: RscStructuredText
{
	idc = 1123;
	x = 0.780548 * safezoneW + safezoneX;
	y = 0.35696 * safezoneH + safezoneY;
	w = 0.0841643 * safezoneW;
	h = 0.0330092 * safezoneH;
};
class A3M_Dia_TxtSlots: RscText
{
	idc = 1008;
	text = "Playable Slots Remaining: "; //--- ToDo: Localize;
	x = 0.655985 * safezoneW + safezoneX;
	y = 0.35696 * safezoneH + safezoneY;
	w = 0.145885 * safezoneW;
	h = 0.0220062 * safezoneH;
};
class A3M_Dia_CurPlyrSel: RscStructuredText
{
	idc = 1124;
	x = 0.780548 * safezoneW + safezoneX;
	y = 0.158905 * safezoneH + safezoneY;
	w = 0.145885 * safezoneW;
	h = 0.0330092 * safezoneH;
};
class A3M_Dia_CurSelTxt: RscText
{
	idc = 1009;
	text = "Currently Selected Player: "; //--- ToDo: Localize;
	x = 0.651496 * safezoneW + safezoneX;
	y = 0.147901 * safezoneH + safezoneY;
	w = 0.123441 * safezoneW;
	h = 0.0440123 * safezoneH;
};

class A3M_Btn_Promote: RscButton
{
	Action = "[] call PromotePlayer"; 

	idc = 1609;
	text = "Promote Player"; //--- ToDo: Localize;
	x = 0.438304 * safezoneW + safezoneX;
	y = 0.455988 * safezoneH + safezoneY;
	w = 0.0953476 * safezoneW;
	h = 0.0330092 * safezoneH;
	tooltip = "Give this player purchasing power, and the ability to act as a field coordinator. Player will have access to company budget, admin panel, fleet mgmt, etc. "; //--- ToDo: Localize;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////







}; 
}; 

