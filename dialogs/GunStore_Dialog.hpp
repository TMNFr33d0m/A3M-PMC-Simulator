/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  
                                                                                                             



Item Store GUI V 2.0 by Cody Salazar AKA Fr33d0m 
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


class A3M_GunStore
{
    idd = 2420;
	movingEnable = true;
	enableSimulation = true;
	
class Controls
{ 

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Salazar, v1.063, #Razika)
////////////////////////////////////////////////////////

class A3M_btn_pistols: RscButton
{
	action = "[] call DoAddPistols";

	idc = 1810;
	text = "Pistols & SMGs"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.180921 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Sidearms and Personal Defense Weapons"; //--- ToDo: Localize;
};
class A3M_btn_Rifles: RscButton
{
	action = "[] call DoAddRifles"; 

	idc = 1811;
	text = "Long Rifles"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.13691 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access catalogue of Assault Rifles and Long Arms Weapons"; //--- ToDo: Localize;
};
class A3M_btn_Lnch: RscButton
{
	action = "[] call DoAddLaunchers"; 

	idc = 1812;
	text = "Launchers"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.400976 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Launchers"; //--- ToDo: Localize;
};
class A3M_btn_Mags: RscButton
{
	action = "[] call DoAddAmmo";

	idc = 1813;
	text = "Ammunition"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.224932 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Magazines and Ammunition"; //--- ToDo: Localize;
};
class A3M_Btn_Optics: RscButton
{
	action = "[] call DoAddOptics"; 

	idc = 1814;
	text = "Optics"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.268943 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Weapon Optics and Target Acquisition Assistance Devices"; //--- ToDo: Localize;
};
class A3M_btn_Supp: RscButton
{
	action = "[] call DoAddSuppressors";

	idc = 1815;
	text = "Suppressors"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.312954 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Suppressors"; //--- ToDo: Localize;
};
class A3M_btn_Smoke: RscButton
{
	action = "[] call DoAddSmoke";

	idc = 1816;
	text = "Smoke Grenades"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.488997 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access catalogue of smoke and signaling devices"; //--- ToDo: Localize;
};
class A3M_btn_Expl: RscButton
{
	action = "[] call DoAddExplosives";

	idc = 1817;
	text = "Grenades / Explosives"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.444986 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access catalogue of Grenades and Explosives"; //--- ToDo: Localize;
};
class A3M_Btn_Unis: RscButton
{
	action = "[] call DoAddClothes";

	idc = 1818;
	text = "Uniforms"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.555014 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Clothing"; //--- ToDo: Localize;
};
class A3M_btn_Vests: RscButton
{
	action = "[] call DoAddVests"; 

	idc = 1819;
	text = "Body Armor / Carriers"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.687046 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Body Armor and Carrier Catalogue"; //--- ToDo: Localize;
};
class A3M_Btn_Misc: RscButton
{
	action = "[] call DoAddItems"; 

	idc = 1820;
	text = "Misc Items"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.841084 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Electronics and Non-Weapon Tactical Items Catalogue"; //--- ToDo: Localize;
};
class RscListbox_1500: RscListbox
{
	onLBDblClick = "_this spawn A3M_fnc_GShandleClick";

	idc = 1850;
	x = 0.213957 * safezoneW + safezoneX;
	y = 0.158905 * safezoneH + safezoneY;
	w = 0.678651 * safezoneW;
	h = 0.759212 * safezoneH;
};
class A3M_BackPackButton: RscButton
{
	action = "[] call DoAddBackpacks"; 

	idc = 1821;
	text = "Backpacks"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.599024 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Backpacks"; //--- ToDo: Localize;
};
class A3M_ModSelector: RscCombo
{
	onLBSelChanged = "_this spawn A3M_fnc_handleWModClick";
	idc = 2175;
	text = "Select Modification "; //--- ToDo: Localize;
	x = 0.33174 * safezoneW + safezoneX;
	y = 0.130295 * safezoneH + safezoneY;
	w = 0.194821 * safezoneW;
	h = 0.0220062 * safezoneH;
	tooltip = "Select Modification to list Supported Items. ENSURE THE MOD IS INSTALLED BEFORE PURCHASING MOD ITEMS! "; //--- ToDo: Localize;
};
class A3M_HeadGearButton: RscButton
{
	action = "[] call DoAddHeadgear";

	idc = 1822;
	text = "Head Gear"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.643035 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Ballistic Head Protection and Hats"; //--- ToDo: Localize;
};
class A3M_ModsTxt: RscText
{
	idc = 1000;
	text = "Supported Modifications:"; //--- ToDo: Localize;
	x = 0.213957 * safezoneW + safezoneX;
	y = 0.125895 * safezoneH + safezoneY;
	w = 0.126061 * safezoneW;
	h = 0.0220062 * safezoneH;
};
class A3M_StoreFrameSA: RscFrame
{
	Moving = 1; 
	idc = 1800;
	text = "Lazarus International Security Supply"; //--- ToDo: Localize;
	x = 0.0737401 * safezoneW + safezoneX;
	y = 0.0642782 * safezoneH + safezoneY;
	w = 0.830978 * safezoneW;
	h = 0.913225 * safezoneH;
};
class A3M_exitbutton: RscButton
{
	action = "closeDialog 0;";

	idc = 1823;
	text = "Exit"; //--- ToDo: Localize;
	x = 0.113001 * safezoneW + safezoneX;
	y = 0.918117 * safezoneH + safezoneY;
	w = 0.0401102 * safezoneW;
	h = 0.0220062 * safezoneH;
	tooltip = "Exit Store Interface"; //--- ToDo: Localize;
};
class A3M_Btn_Med: RscButton
{
	action = "[] spawn DoAddMedical";

	idc = 1824;
	text = "Medical"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.753062 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
};
class A3M_Btn_Elect: RscButton
{
	action = "[] spawn DoAddElect"; 

	idc = 1825;
	text = "Electronics"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.797073 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Electronics and Non-Weapon Tactical Items Catalogue"; //--- ToDo: Localize;
};
class A3m_Btn_Buy: RscButton
{
	action="[] call A3M_Fnc_BuyButton"; 

	idc = 1826;
	text = "PURCHASE"; //--- ToDo: Localize;
	x = 0.802869 * safezoneW + safezoneX;
	y = 0.92912 * safezoneH + safezoneY;
	w = 0.0897389 * safezoneW;
	h = 0.0330092 * safezoneH;
};



}; 
}; 
