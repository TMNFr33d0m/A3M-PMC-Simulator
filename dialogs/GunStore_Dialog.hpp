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

Cannabis, Sativa and Indica, (The legal, medical variety) for giving me the patience and focus to complete this project over, and over again. 

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
// GUI EDITOR OUTPUT START (by CPL Salazar, v1.063, #Wowipo)
////////////////////////////////////////////////////////

class A3M_btn_pistols: RscButton
{
	action = "[] spawn DoAddPistols";

	idc = 1610;
	text = "Pistols & SMGs"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.180921 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Sidearms and Personal Defense Weapons"; //--- ToDo: Localize;
};
class A3M_btn_Rifles: RscButton
{
	action = "[] spawn DoAddRifles"; 

	idc = 1611;
	text = "Long Rifles"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.13691 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access catalogue of Assault Rifles and Long Arms Weapons"; //--- ToDo: Localize;
};
class A3M_btn_Lnch: RscButton
{
	action = "[] spawn DoAddLaunchers"; 

	idc = 1612;
	text = "Launchers"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.400976 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Launchers"; //--- ToDo: Localize;
};
class A3M_btn_Mags: RscButton
{
	action = "[] spawn DoAddAmmo";

	idc = 1613;
	text = "Ammunition"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.224932 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Magazines and Ammunition"; //--- ToDo: Localize;
};
class A3M_Btn_Optics: RscButton
{
	action = "[] spawn DoAddOptics"; 

	idc = 1614;
	text = "Optics"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.268943 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Weapon Optics and Target Acquisition Assistance Devices"; //--- ToDo: Localize;
};
class A3M_btn_Supp: RscButton
{
	action = "[] spawn DoAddSuppressors";

	idc = 1615;
	text = "Suppressors"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.312954 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Suppressors"; //--- ToDo: Localize;
};
class A3M_btn_Smoke: RscButton
{
	action = "[] spawn DoAddSmoke";

	idc = 1616;
	text = "Smoke Grenades"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.488997 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access catalogue of smoke and signalling devices"; //--- ToDo: Localize;
};
class A3M_btn_Expl: RscButton
{
	action = "[] spawn DoAddExplosives";

	idc = 1617;
	text = "Grenades / Explosives"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.444986 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access catalogue of Grenades and Explosives"; //--- ToDo: Localize;
};
class A3M_Btn_Unis: RscButton
{
	action = "[] spawn DoAddClothes";

	idc = 1618;
	text = "Uniforms"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.555014 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Clothing"; //--- ToDo: Localize;
};
class A3M_btn_Vests: RscButton
{
	action = "[] spawn DoAddVests"; 

	idc = 1619;
	text = "Body Armor / Carriers"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.687046 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Body Armor and Carrier Catalogue"; //--- ToDo: Localize;
};
class A3M_Btn_Misc: RscButton
{
	action = "[] spawn DoAddItems"; 

	idc = 1620;
	text = "Misc Items"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.841084 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Our Non-Weapon Tactical Items Catalogue"; //--- ToDo: Localize;
};
class RscListbox_1650: RscListbox
{
	onLBDblClick = "_this spawn A3M_fnc_GShandleClick";

	idc = 1650;
	x = 0.196263 * safezoneW + safezoneX;
	y = 0.13691 * safezoneH + safezoneY;
	w = 0.687706 * safezoneW;
	h = 0.759187 * safezoneH;
	tooltip = "Select a supported mod from the drop down, and then click a category to see mod gear."; //--- ToDo: Localize;
};
class A3M_BackPackButton: RscButton
{
	action = "[] spawn DoAddBackpacks"; 

	idc = 1621;
	text = "Backpacks"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.599024 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Backpacks"; //--- ToDo: Localize;
};
class A3M_ModSelector: RscCombo
{
	idc = 2175;
	text = "Select Modification "; //--- ToDo: Localize;
	x = 0.683388 * safezoneW + safezoneX;
	y = 0.103902 * safezoneH + safezoneY;
	w = 0.194821 * safezoneW;
	h = 0.0220062 * safezoneH;
	onLBSelChanged = "_this spawn A3M_fnc_handleWModClick";
	tooltip = "Select Modification to list Supported Items. ENSURE THE MOD IS INSTALLED BEFORE PURCHASING MOD ITEMS! "; //--- ToDo: Localize;
};
class A3M_HeadGearButton: RscButton
{
	action = "[] spawn DoAddHeadgear";

	idc = 1622;
	text = "Head Gear"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.643035 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Catalogue of Ballstic Head Protection and Hats"; //--- ToDo: Localize;
};
class A3M_ModsTxt: RscText
{
	idc = 1887;
	text = "Supported Modifications:"; //--- ToDo: Localize;
	x = 0.551578 * safezoneW + safezoneX;
	y = 0.103902 * safezoneH + safezoneY;
	w = 0.126061 * safezoneW;
	h = 0.0220062 * safezoneH;
};
class A3M_StoreFrameSA: RscFrame
{
	idc = 1821;
	text = "Lazarus International Security Supply"; //--- ToDo: Localize;
	x = 0.0759146 * safezoneW + safezoneX;
	y = 0.037886 * safezoneH + safezoneY;
	w = 0.830978 * safezoneW;
	h = 0.913225 * safezoneH;
};
class A3M_exitbutton: RscButton
{
	action = "closeDialog 0; [] call A3M_fnc_silence; ";

	idc = 1623;
	text = "Exit"; //--- ToDo: Localize;
	x = 0.0873763 * safezoneW + safezoneX;
	y = 0.9071 * safezoneH + safezoneY;
	w = 0.0401102 * safezoneW;
	h = 0.0220062 * safezoneH;
	tooltip = "Exit Store Interface"; //--- ToDo: Localize;
};
class A3M_Btn_Med: RscButton
{
	action = "[] spawn DoAddMedical";
	idc = 1624;
	text = "Medical"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.753062 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
};
class A3M_Btn_Elect: RscButton
{
	action = "[] spawn DoAddElect"; 

	idc = 1625;
	text = "Electronics"; //--- ToDo: Localize;
	x = 0.0816454 * safezoneW + safezoneX;
	y = 0.797073 * safezoneH + safezoneY;
	w = 0.108887 * safezoneW;
	h = 0.0330081 * safezoneH;
	tooltip = "Access Electronics and Non-Weapon Tactical Items Catalogue"; //--- ToDo: Localize;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////



}; 
}; 