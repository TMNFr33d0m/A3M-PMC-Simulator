/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  
                                                                                                             



Pneumatic Range Control GUI V 1.0 by Cody Salazar AKA Fr33d0m 
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
class DRI_2ABCT_M4R
{
    idd = 520;
	movingEnable = True;
	enableSimulation = True;
	
class Controls
{ 

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by CPL Salazar, v1.063, #Cahyja)
////////////////////////////////////////////////////////

class m4R_Frame: RscFrame
{
	Moving = 1; 
	idc = 1800;
	text = "Pneumatic Range Control"; //--- ToDo: Localize;
	x = 0.150573 * safezoneW + safezoneX;
	y = 0.148127 * safezoneH + safezoneY;
	w = 0.675942 * safezoneW;
	h = 0.637769 * safezoneH;
	tooltip = "Created by C. Salazar (AKA Fr33d0m) "; //--- ToDo: Localize;
};
class M4r_LaneATxT: RscText
{
	idc = 1000;
	text = "Lane A"; //--- ToDo: Localize;
	x = 0.207856 * safezoneW + safezoneX;
	y = 0.181115 * safezoneH + safezoneY;
	w = 0.0572832 * safezoneW;
	h = 0.0329881 * safezoneH;
};
class M4r_LaneBTxT: RscText
{
	idc = 1001;
	text = "Lane B"; //--- ToDo: Localize;
	x = 0.46563 * safezoneW + safezoneX;
	y = 0.170119 * safezoneH + safezoneY;
	w = 0.0458265 * safezoneW;
	h = 0.0549801 * safezoneH;
};
class M4r_LaneCTxT: RscText
{
	idc = 1002;
	text = "Lane C"; //--- ToDo: Localize;
	x = 0.706219 * safezoneW + safezoneX;
	y = 0.170119 * safezoneH + safezoneY;
	w = 0.0458265 * safezoneW;
	h = 0.0549801 * safezoneH;
};
class M4R_LaneA_Button1: RscButton
{
	idc = 1600;
	text = "All Targets Up"; //--- ToDo: Localize;
	x = 0.184943 * safezoneW + safezoneX;
	y = 0.214103 * safezoneH + safezoneY;
	w = 0.0916531 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_A_AllTargetsUp"; 
};
class M4R_LaneA_Button2: RscButton
{
	idc = 1601;
	text = "All Targets Down"; //--- ToDo: Localize;
	x = 0.184943 * safezoneW + safezoneX;
	y = 0.258087 * safezoneH + safezoneY;
	w = 0.0916531 * safezoneW;
	h = 0.0329881 * safezoneH;
	action= "[] spawn M4RR_A_AllTargetsDown";
};
class M4R_LaneA_L50: RscButton
{
	idc = 1602;
	text = "L 50"; //--- ToDo: Localize;
	x = 0.196399 * safezoneW + safezoneX;
	y = 0.576972 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_A_L50"; 
};
class M4R_LaneA_R50: RscButton
{
	idc = 1603;
	text = "R 50"; //--- ToDo: Localize;
	x = 0.247954 * safezoneW + safezoneX;
	y = 0.576972 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_A_R50"; 
};
class M4R_LaneA_100: RscButton
{
	idc = 1604;
	text = "100"; //--- ToDo: Localize;
	x = 0.247954 * safezoneW + safezoneX;
	y = 0.532988 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_A_100"; 
};
class M4R_LaneA_150: RscButton
{
	idc = 1605;
	text = "150"; //--- ToDo: Localize;
	x = 0.196399 * safezoneW + safezoneX;
	y = 0.489004 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = " [] spawn M4RR_A_150 "; 
};
class M4R_LaneA_200: RscButton
{
	idc = 1606;
	text = "200"; //--- ToDo: Localize;
	x = 0.247954 * safezoneW + safezoneX;
	y = 0.489004 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = " [] spawn M4RR_A_200 "; 
};
class M4R_LaneA_250: RscButton
{
	idc = 1607;
	text = "250"; //--- ToDo: Localize;
	x = 0.196399 * safezoneW + safezoneX;
	y = 0.44502 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = " [] spawn M4RR_A_250 "; 
};
class M4R_LaneA_300: RscButton
{
	idc = 1608;
	text = "300"; //--- ToDo: Localize;
	x = 0.247954 * safezoneW + safezoneX;
	y = 0.44502 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = " [] spawn M4RR_A_300 "; 
};
class M4R_LaneA_POP7: RscButton
{
	idc = 1609;
	text = "Pop 7"; //--- ToDo: Localize;
	x = 0.236497 * safezoneW + safezoneX;
	y = 0.324064 * safezoneH + safezoneY;
	w = 0.0400982 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = " [] spawn M4RR_A_Pop7 "; 
};
class M4R_LaneA_POP40: RscButton
{
	idc = 1610;
	text = "Pop 40"; //--- ToDo: Localize;
	x = 0.184943 * safezoneW + safezoneX;
	y = 0.324064 * safezoneH + safezoneY;
	w = 0.0400982 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = " [] spawn M4RR_A_Pop40 "; 
};
class M4R_NoPopOn: RscButton
{
	idc = 1611;
	text = "Automatic Reset Off"; //--- ToDo: Localize;
	x = 0.557283 * safezoneW + safezoneX;
	y = 0.741912 * safezoneH + safezoneY;
	w = 0.108838 * safezoneW;
	h = 0.021992 * safezoneH;
	action = "nopop = true"; 
};
class M4R_NoPopOff: RscButton
{
	idc = 1612;
	text = "Automatic Reset On"; //--- ToDo: Localize;
	x = 0.299509 * safezoneW + safezoneX;
	y = 0.741912 * safezoneH + safezoneY;
	w = 0.10311 * safezoneW;
	h = 0.021992 * safezoneH;
	action = "nopop = false"; 
};
class M4R_LaneA_ProgramText: RscText
{
	idc = 1003;
	text = "Programs"; //--- ToDo: Localize;
	x = 0.207856 * safezoneW + safezoneX;
	y = 0.28008 * safezoneH + safezoneY;
	w = 0.0458265 * safezoneW;
	h = 0.0549801 * safezoneH;
};
class M4R_LaneA_Random40: RscButton
{
	idc = 1613;
	text = "Random 40"; //--- ToDo: Localize;
	x = 0.202127 * safezoneW + safezoneX;
	y = 0.368048 * safezoneH + safezoneY;
	w = 0.0572832 * safezoneW;
	h = 0.021992 * safezoneH;
	action = "hint 'this feature does not yet work'"; 
};
class M4R_LaneA_IndivText: RscText
{
	idc = 1004;
	text = "Manual Control"; //--- ToDo: Localize;
	x = 0.196399 * safezoneW + safezoneX;
	y = 0.412032 * safezoneH + safezoneY;
	w = 0.0687398 * safezoneW;
	h = 0.021992 * safezoneH;
};
class M4R_LaneB_ProgramText: RscText
{
	idc = 1005;
	text = "Programs"; //--- ToDo: Localize;
	x = 0.46563 * safezoneW + safezoneX;
	y = 0.28008 * safezoneH + safezoneY;
	w = 0.0458265 * safezoneW;
	h = 0.0549801 * safezoneH;
};
class M4R_LaneB_ManualText: RscText
{
	idc = 1006;
	text = "Manual Control"; //--- ToDo: Localize;
	x = 0.448445 * safezoneW + safezoneX;
	y = 0.412032 * safezoneH + safezoneY;
	w = 0.0687398 * safezoneW;
	h = 0.021992 * safezoneH;
};
class M4R_LaneB_Button1: RscButton
{
	idc = 1614;
	text = "All Targets Up"; //--- ToDo: Localize;
	x = 0.436989 * safezoneW + safezoneX;
	y = 0.214103 * safezoneH + safezoneY;
	w = 0.0916531 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_B_AllTargetsUp";
};
class M4R_LaneB_Button2: RscButton
{
	idc = 1615;
	text = "All Targets Down"; //--- ToDo: Localize;
	x = 0.436989 * safezoneW + safezoneX;
	y = 0.258087 * safezoneH + safezoneY;
	w = 0.0916531 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_B_AllTargetsDown"; 
};
class M4R_LaneB_POP40: RscButton
{
	idc = 1616;
	text = "Pop 40"; //--- ToDo: Localize;
	x = 0.436989 * safezoneW + safezoneX;
	y = 0.324064 * safezoneH + safezoneY;
	w = 0.0400982 * safezoneW;
	h = 0.0329881 * safezoneH;
	Action="[] spawn M4RR_B_Pop40"; 
};
class M4R_LaneB_POP7: RscButton
{
	idc = 1617;
	text = "Pop 7"; //--- ToDo: Localize;
	x = 0.494272 * safezoneW + safezoneX;
	y = 0.324064 * safezoneH + safezoneY;
	w = 0.0343699 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_B_Pop7"; 
};
class M4R_LaneB_R40: RscButton
{
	idc = 1618;
	text = "Random 40 "; //--- ToDo: Localize;
	x = 0.454174 * safezoneW + safezoneX;
	y = 0.368048 * safezoneH + safezoneY;
	w = 0.0572832 * safezoneW;
	h = 0.021992 * safezoneH;
	action = "hint 'this feature does not yet work'"; 
};
class M4R_LaneB_300: RscButton
{
	idc = 1619;
	text = "300"; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.44502 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action= "[] spawn M4RR_B_300"; 
};
class M4R_LaneB_250: RscButton
{
	idc = 1620;
	text = "250"; //--- ToDo: Localize;
	x = 0.442717 * safezoneW + safezoneX;
	y = 0.44502 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_B_250"; 
};
class M4R_LaneB_200: RscButton
{
	idc = 1621;
	text = "200"; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.489004 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action="[] spawn M4RR_B_200"; 
};
class M4R_LaneB_150: RscButton
{
	idc = 1622;
	text = "150"; //--- ToDo: Localize;
	x = 0.442717 * safezoneW + safezoneX;
	y = 0.489004 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action="[] spawn M4RR_B_150"; 
};
class M4R_LaneB_100: RscButton
{
	idc = 1623;
	text = "100"; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.532988 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action="[] spawn M4RR_B_100"; 
};
class M4R_LaneB_L50: RscButton
{
	idc = 1624;
	text = "L 50"; //--- ToDo: Localize;
	x = 0.442717 * safezoneW + safezoneX;
	y = 0.576972 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action="[] spawn M4RR_B_L50"; 
};
class M4R_LaneB_R50: RscButton
{
	idc = 1625;
	text = "R 50"; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.576972 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action="[] spawn M4RR_B_R50"; 
};
class M4R_LaneC_Button1 : RscButton
{
	idc = 1626;
	text = "All Targets Up"; //--- ToDo: Localize;
	x = 0.677578 * safezoneW + safezoneX;
	y = 0.214103 * safezoneH + safezoneY;
	w = 0.0916531 * safezoneW;
	h = 0.0329881 * safezoneH;
	action="[] spawn M4RR_C_AllTargetsUp"; 
};
class M4R_LaneC_Button2: RscButton
{
	idc = 1627;
	text = "All Targets Down "; //--- ToDo: Localize;
	x = 0.677578 * safezoneW + safezoneX;
	y = 0.258087 * safezoneH + safezoneY;
	w = 0.0916531 * safezoneW;
	h = 0.0329881 * safezoneH;
	action="[] spawn M4RR_C_AllTargetsDown"; 
};
class M4R_LaneC_ProgramText: RscText
{
	idc = 1007;
	text = "Programs"; //--- ToDo: Localize;
	x = 0.700491 * safezoneW + safezoneX;
	y = 0.28008 * safezoneH + safezoneY;
	w = 0.0458265 * safezoneW;
	h = 0.0549801 * safezoneH;
};
class M4R_LaneC_40: RscButton
{
	idc = 1628;
	text = "Pop 40"; //--- ToDo: Localize;
	x = 0.677578 * safezoneW + safezoneX;
	y = 0.324064 * safezoneH + safezoneY;
	w = 0.0400982 * safezoneW;
	h = 0.0329881 * safezoneH;
	action="[] spawn M4RR_C_Pop40"; 
};
class M4R_LaneC_POP7: RscButton
{
	idc = 1629;
	text = "Pop 7"; //--- ToDo: Localize;
	x = 0.734861 * safezoneW + safezoneX;
	y = 0.324064 * safezoneH + safezoneY;
	w = 0.0343699 * safezoneW;
	h = 0.0329881 * safezoneH;
	action= "M4RR_C_Pop7"; 
};
class M4R_LaneC_R40: RscButton
{
	idc = 1630;
	text = "Random 40"; //--- ToDo: Localize;
	x = 0.694763 * safezoneW + safezoneX;
	y = 0.368048 * safezoneH + safezoneY;
	w = 0.0630115 * safezoneW;
	h = 0.021992 * safezoneH;
	action="hint ' this feature is not yet available'"; 
};
class M4R_LaneC_300: RscButton
{
	idc = 1631;
	text = "300"; //--- ToDo: Localize;
	x = 0.734861 * safezoneW + safezoneX;
	y = 0.44502 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	actio = "[] spawn M4RR_C_300"; 
};
class M4R_LaneC_200: RscButton
{
	idc = 1632;
	text = "200"; //--- ToDo: Localize;
	x = 0.734861 * safezoneW + safezoneX;
	y = 0.489004 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_C_200"; 
};
class M4R_LaneC_100: RscButton
{
	idc = 1633;
	text = "100"; //--- ToDo: Localize;
	x = 0.734861 * safezoneW + safezoneX;
	y = 0.532988 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_C_100"; 
};
class M4R_LaneC_R50: RscButton
{
	idc = 1634;
	text = "R 50"; //--- ToDo: Localize;
	x = 0.734861 * safezoneW + safezoneX;
	y = 0.576972 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_C_R50"; 
};
class M4R_LaneC_250: RscButton
{
	idc = 1635;
	text = "250"; //--- ToDo: Localize;
	x = 0.683306 * safezoneW + safezoneX;
	y = 0.44502 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_C_250"; 
};
class M4R_LaneC_150: RscButton
{
	idc = 1636;
	text = "150"; //--- ToDo: Localize;
	x = 0.683306 * safezoneW + safezoneX;
	y = 0.489004 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_C_150"; 
};
class M4R_LaneC_L50: RscButton
{
	idc = 1637;
	text = "L 50"; //--- ToDo: Localize;
	x = 0.683306 * safezoneW + safezoneX;
	y = 0.576972 * safezoneH + safezoneY;
	w = 0.0229133 * safezoneW;
	h = 0.0329881 * safezoneH;
	action = "[] spawn M4RR_C_L50"; 
};
class M4R_LaneC_ManualText: RscText
{
	idc = 1008;
	text = "Manual Control"; //--- ToDo: Localize;
	x = 0.689035 * safezoneW + safezoneX;
	y = 0.412032 * safezoneH + safezoneY;
	w = 0.0687398 * safezoneW;
	h = 0.021992 * safezoneH;
};
class M4R_Close: RscButton
{
	idc = 1638;
	text = "Close"; //--- ToDo: Localize;
	x = 0.46563 * safezoneW + safezoneX;
	y = 0.741912 * safezoneH + safezoneY;
	w = 0.0400982 * safezoneW;
	h = 0.0329881 * safezoneH;
	action= "closeDialog 0"; 
};
class M4R_LaneA_GetScore: RscButton
{
	idc = 1639;
	text = "Check Score"; //--- ToDo: Localize;
	x = 0.202127 * safezoneW + safezoneX;
	y = 0.620956 * safezoneH + safezoneY;
	w = 0.0630115 * safezoneW;
	h = 0.021992 * safezoneH;
	action = "[] spawn M4RR_A_ChkScore;"; 
};
class M4R_LaneA_ClearScore: RscButton
{
	idc = 1640;
	text = "Reset Score"; //--- ToDo: Localize;
	x = 0.202127 * safezoneW + safezoneX;
	y = 0.66494 * safezoneH + safezoneY;
	w = 0.0630115 * safezoneW;
	h = 0.021992 * safezoneH;
	action= "[] spawn M4RR_A_ResetScore;"; 
};
class M4R_LaneB_CheckScore: RscButton
{
	idc = 1641;
	text = "Check Score"; //--- ToDo: Localize;
	x = 0.454174 * safezoneW + safezoneX;
	y = 0.620956 * safezoneH + safezoneY;
	w = 0.0630115 * safezoneW;
	h = 0.021992 * safezoneH;
	action = "[] spawn M4RR_B_ChkScore;"; 
};
class M4R_LaneB_ResetScore: RscButton
{
	idc = 1642;
	text = "Reset Score"; //--- ToDo: Localize;
	x = 0.454174 * safezoneW + safezoneX;
	y = 0.66494 * safezoneH + safezoneY;
	w = 0.0630115 * safezoneW;
	h = 0.021992 * safezoneH;
	Action="[] spawn M4RR_B_ResetScore;"; 
};
class M4R_LaneC_CheckScore: RscButton
{
	idc = 1643;
	text = "Check Score"; //--- ToDo: Localize;
	x = 0.689035 * safezoneW + safezoneX;
	y = 0.620956 * safezoneH + safezoneY;
	w = 0.0630115 * safezoneW;
	h = 0.021992 * safezoneH;
	Action="[] spawn M4RR_C_ChkScore;"; 
};
class M4R_LaneC_ResetScore: RscButton
{
	idc = 1644;
	text = "Reset Score"; //--- ToDo: Localize;
	x = 0.689035 * safezoneW + safezoneX;
	y = 0.66494 * safezoneH + safezoneY;
	w = 0.0630115 * safezoneW;
	h = 0.021992 * safezoneH;
	action="[] spawn M4RR_C_ResetScore;"; 
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
}; 
}; 