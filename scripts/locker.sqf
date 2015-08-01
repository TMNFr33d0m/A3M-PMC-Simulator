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

Cannabis, Sativa and Indica, (The legal, medical variety) for giving me the patience and focus to complete this project over, and over again. 

And last, but definitely not least, the A3 community, who through over 250+ encouraging messages highly encouraged me to continue this project. I'm glad you like it, 
and I hope you enjoy the things I have in the works! 

################################## LET US BEGIN #################################### */

GetCurrentGear = {

CurWeaponArray = Weapons Player; 
CurMagArray = Magazines Player; 
CurUni = Uniform Player; 
CurBackpack = Backpack Player; 
CurLBV = Vest Player; 
CurHelm = Headgear Player; 
CurItems = Items Player; 

PreCollectiveArray = CurWeaponArray+CurMagArray;
PreCollectiveArray pushback CurUni;
PreCollectiveArray pushback CurBackpack;
PreCollectiveArray pushback CurLBV;
PreCollectiveArray pushback CurHelm;
CollectiveArray = PreCollectiveArray+CurItems;

lbClear 1525;

_idx={lbAdd [1525, gettext (configFile >> "CfgWeapons" >> _x >> "displayName")]} forEach CurWeaponArray; 
_idm={lbadd [1525, gettext (configFile >> "CfgMagazines" >> _x >> "displayName")] } forEach CurMagArray; 
_idu= lbadd [1525, gettext (configFile >> "CfgWeapons" >> CurUni >> "displayName")];
_idb=lbadd [1525, gettext (configFile >> "CfgVehicles" >> CurBackpack >> "displayName")];
_idl=lbadd [1525, gettext (configFile >> "CfgWeapons" >> CurLBV >> "displayName")];
_idh=lbadd [1525, gettext (configFile >> "CfgWeapons" >> CurHelm >> "displayName")];
_ici={lbAdd [1525,  gettext (configFile >> "CfgWeapons" >> _x >> "displayName")] } forEach CurItems;

{lbSetData [1525, _forEachIndex, _x]} forEach CollectiveArray; 

{lbSetPicture	[1525,_forEachIndex,getText (configFile >>"CfgWeapons">>_x>>"picture")]} forEach CollectiveArray; 	
{lbSetPictureColor	[1525,_forEachIndex,[0.9,0.9,0.9,0.8]]} forEach CollectiveArray; 

{lbSetPicture	[1525,_forEachIndex,getText (configFile >>"CfgMagazines">>_x>>"picture")]} forEach CollectiveArray; 	
{lbSetPictureColor	[1525,_forEachIndex,[0.9,0.9,0.9,0.8]]} forEach CollectiveArray; 

{lbSetPicture	[1525,_forEachIndex,getText (configFile >>"CfgVehicles">>_x>>"picture")]} forEach CollectiveArray; 	
{lbSetPictureColor	[1525,_forEachIndex,[0.9,0.9,0.9,0.8]]} forEach CollectiveArray;

}; 

GetStashGear = {

StsWeaponArray = profileNameSpace GetVariable "SvdWeaponArray";
StsMagArray = profileNameSpace GetVariable "SvdMagArray";
StsBagArray = profileNameSpace GetVariable "SvdBagArray";


PreStashCombined = StsWeaponArray+StsMagArray;
StashArray= PreStashCombined+StsBagArray;

lbClear 1526;

_Sax={lbAdd [1526, gettext (configFile >> "CfgWeapons" >> _x >> "displayName")]} forEach StsWeaponArray; 
_Sam={lbadd [1526, gettext (configFile >> "CfgMagazines" >> _x >> "displayName")] } forEach StsMagArray; 
_Sab={lbadd [1526, gettext (configFile >> "CfgVehicles" >> _x >> "displayName")]} forEach StsBagArray;

 
{lbSetData [1526, _forEachIndex, _x]} forEach StashArray; 

{lbSetPicture	[1526,_forEachIndex,getText (configFile >>"CfgWeapons">>_x>>"picture")]} forEach StashArray; 	
{lbSetPictureColor	[1526,_forEachIndex,[0.9,0.9,0.9,0.8]]} forEach StashArray; 

{lbSetPicture	[1526,_forEachIndex,getText (configFile >>"CfgMagazines">>_x>>"picture")]} forEach StashArray; 	
{lbSetPictureColor	[1526,_forEachIndex,[0.9,0.9,0.9,0.8]]} forEach StashArray; 

{lbSetPicture	[1526,_forEachIndex,getText (configFile >>"CfgVehicles">>_x>>"picture")]} forEach StashArray; 	
{lbSetPictureColor	[1526,_forEachIndex,[0.9,0.9,0.9,0.8]]} forEach StashArray;



}; 

HandleCurInv = {

PassedIntCI= _this select 1; 
ItmClsNme = lbdata [1525, PassedIntCI]; 
hint format ["%1 has been selected from Inventory...", ItmClsNme];

}; 

HandleCurStash={

PassedIntCS= _this select 1; 
ItmStsNme = lbdata [1526, PassedIntCS]; 
hint format ["%1 has been selected from Stash...", ItmStsNme];

};

MoveToStash= {

if (isNil "PassedIntCI") then {Hint "You must select an Item from your Inventory."} else {

																if (ItmClsNme isKindOf [ItmClsNme, configFile >> "CfgWeapons"]) then { 
																	
																	if (isNil "StsWeaponArray") then {
																	StsWeaponArray = []
																	};
																	
																	StsWeaponArray pushback ItmClsNme;
																	ProfileNameSpace SetVariable ["SvdWeaponArray", StsWeaponArray];
																	SaveProfileNamespace; 
																	
																	if ((ItmClsNme isKindOf ["Vest_Camo_Base", configFile >> "CfgWeapons"]) OR (ItmClsNme isKindOf ["Vest_NoCamo_Base", configFile >> "CfgWeapons"])) then {
																		removeVest Player; 
																		lbDelete [1525, PassedIntCI];
																		} else {
																		if (ItmClsNme isKindOf ["Uniform_Base", configFile >> "CfgWeapons"]) then {
																			removeUniform Player; 
																			lbDelete [1525, PassedIntCI];
																		} else {
																			_IsHeadGear = getText (configfile >> "CfgWeapons" >> ItmClsNme >> "ItemInfo" >> "_generalMacro" );
																				if (_IsHeadGear == "HeadgearItem") then {
																				removeHeadGear Player; 
																				lbDelete [1525, PassedIntCI];
																			} else {
																					if (ItmClsNme isKindOf ["ItemCore", configFile >> "CfgWeapons"]) then {
																					Player removeItem ItmClsNme; 
																					lbDelete [1525, PassedIntCI];
																			} else {
																					if (ItmClsNme isKindOf [ItmClsNme, configFile >> "CfgWeapons"]) then {
																					Player removeWeapon ItmClsNme; 
																					lbDelete [1525, PassedIntCI];
																					}; 
																			}; 	
																		};
																	}; 
																}; 
															} else {
																	if (ItmClsNme isKindOf [ItmClsNme, configFile >> "CfgMagazines"]) then {
																		if (isNil "StsMagArray") then {
																		StsMagArray = []
																		}; 
																		StsMagArray pushBack ItmClsNme;
																		ProfileNameSpace SetVariable ["SvdMagArray", StsMagArray];
																		SaveProfileNamespace; 
																		Player RemoveMagazine ItmClsNme;
																		lbDelete [1525, PassedIntCI];																		
																		} else {
																			if (ItmClsNme isKindOf [ItmClsNme, configFile >> "CfgVehicles"]) then {
																				if (isNil "StsBagArray") then {
																				StsBagArray = []
																				}; 
																			StsBagArray pushBack ItmClsNme;
																			ProfileNameSpace SetVariable ["SvdBagArray", StsBagArray];
																			SaveProfileNamespace; 
																			removeBackpack Player; 
																			lbDelete [1525, PassedIntCI];
																			} else { 
hint "Item Type Cannot Be Found"}; 
	};
}; 
 
ItmClsNme= nil; 
PassedIntCI= nil; 

// Debug Hint...
// hint format ["Passed Weapons: \n %1 \n \n Passed Mags: \n %2 \n \n Passed Uni: \n %3 \n \n Passed Backpack: \n %4 \n \n Passed Vest: \n %5 \n \n Passed Helmet: \n %6 \n \n Passed Items: \n %7 \n \n CllArrayInv: \n %8 \n \n StashArray: \n %9 \n \n %10 \n \n %11", CurWeaponArray, CurMagArray, CurUni, CurBackpack, CurLBV, CurHelm, CurItems, CollectiveArray, StsWeaponArray, StsMagArray, StsBagArray];

[] call GetStashGear;


}; 

};

GetFromStash= {

if (isNil "PassedIntCS") then {Hint "You must select an Item from your Stash."} else {
	
	if (ItmStsNme isKindOf [ItmStsNme, configFile >> "CfgWeapons"]) then {
		
		_IsUniform = getText (configfile >> "CfgWeapons" >> ItmStsNme >> "ItemInfo" >> "uniformClass");		
		_IsVest = getText (configfile >> "CfgWeapons" >> ItmStsNme >> "ItemInfo" >> "_generalMacro" );
		// _IsItem = getText ( )
		If (_IsUniform != "") then {  
			_PlyrCrUni = Uniform Player; 
				if (_PlyrCrUni != "") Then {
				StsWeaponArray pushBack _PlyrCrUni; 
				};  
			Player ForceAddUniform ItmStsNme; 
			lbDelete [1526, PassedIntCS];
			[] call GetCurrentGear;
			_TempWpnCt = {_x == ItmStsNme} count StsWeaponArray;
			StsWeaponArray = StsWeaponArray - [ItmStsNme];
			_TempWpnCt = _TempWpnCt-1;
				
				if (_TempWpnCt > 0) then {
					
					for "_x" from 1 to _TempWpnCt do {
					StsWeaponArray PushBack ItmStsNme; 
					};
				}; 	
			ProfileNameSpace SetVariable ["SvdWeaponArray", StsWeaponArray];
			SaveProfileNamespace;
			_IsUniform = nil; 
			[] call GetStashGear; 
	 
		} else {

				if (_IsVest == "VestItem") then {
				
				_PlyrCrVst = Vest Player; 
				if (_PlyrCrVst != "") Then {
				StsWeaponArray pushBack _PlyrCrVst; 
				};  
				
				Player AddVest ItmStsNme; 
				lbDelete [1526, PassedIntCS];
				[] call GetCurrentGear;
				_TempWpnCt = {_x == ItmStsNme} count StsWeaponArray;
				StsWeaponArray = StsWeaponArray - [ItmStsNme];
				_TempWpnCt = _TempWpnCt-1;
				
				if (_TempWpnCt > 0) then {
				
					for "_x" from 1 to _TempWpnCt do {
					StsWeaponArray PushBack ItmStsNme; 
					};
				}; 	
				ProfileNameSpace SetVariable ["SvdWeaponArray", StsWeaponArray];
				SaveProfileNamespace;
				[] call GetStashGear;
				
				
				} else {
						if (ItmStsNme isKindOf ["ItemCore", configFile >> "CfgWeapons"]) then {
						Player AddItem ItmStsNme; 
						lbDelete [1526, PassedIntCS];
						[] call GetCurrentGear;
						_TempWpnCt = {_x == ItmStsNme} count StsWeaponArray;
						StsWeaponArray = StsWeaponArray - [ItmStsNme];
						_TempWpnCt = _TempWpnCt-1;
				
							if (_TempWpnCt > 0) then {
				
								for "_x" from 1 to _TempWpnCt do {
								StsWeaponArray PushBack ItmStsNme; 
								};
							}; 	
				ProfileNameSpace SetVariable ["SvdWeaponArray", StsWeaponArray];
				SaveProfileNamespace;
				[] call GetStashGear;
				
						
						} else {
				
								if (ItmStsNme isKindOf ["Rifle", configFile >> "CfgWeapons"]) then {
					 
								_TmpPriWpn = PrimaryWeapon Player;
						
									if (_TmpPriWpn != "") Then {
									StsWeaponArray pushBack _TmpPriWpn;
									ProfileNameSpace SetVariable ["SvdWeaponArray", StsWeaponArray];
									SaveProfileNamespace;
							
									[] call GetStashGear;
								};  
						
								} else { 
										if (ItmStsNme isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
										_TmpScdWpn = HandgunWeapon Player; 
						
											if (_TmpScdWpn != "") Then {
											StsWeaponArray pushBack _TmpScdWpn; 
											ProfileNameSpace SetVariable ["SvdWeaponArray", StsWeaponArray];
											SaveProfileNamespace;
								
											[] call GetStashGear;
											};  
						
										};
									};
								}; 
				Player AddWeapon ItmStsNme; 
				lbDelete [1526, PassedIntCS];
				
				[] call GetCurrentGear;
				
				_TempWpnCt = {_x == ItmStsNme} count StsWeaponArray;
				StsWeaponArray = StsWeaponArray - [ItmStsNme];
				_TempWpnCt = _TempWpnCt-1;
				
				if (_TempWpnCt > 0) then {
				
					for "_x" from 1 to _TempWpnCt do {
					StsWeaponArray PushBack ItmStsNme; 
					};
				}; 	
				
				ProfileNameSpace SetVariable ["SvdWeaponArray", StsWeaponArray];
				SaveProfileNamespace;
				[] call GetStashGear;
				
				}; 
		}; 		
	} else { 
	
			if (ItmStsNme isKindOf [ItmStsNme, configFile >> "CfgMagazines"]) then { 
			
			Player AddMagazine ItmStsNme; 
			lbDelete [1526, PassedIntCS];
			[] call GetCurrentGear;
			_TempMagCt = {_x == ItmStsNme} count StsMagArray;	
			StsMagArray = StsMagArray - [ItmStsNme];
			_TempMagCt = _TempMagCt-1;
			
			if (_TempMagCt > 0) then {
					
					for "_x" from 1 to _TempMagCt do {
					StsMagArray PushBack ItmStsNme; 
					};
			}; 
			ProfileNameSpace SetVariable ["SvdMagArray", StsMagArray];
			SaveProfileNamespace;
			[] call GetStashGear;
			
			} else {
				
				if (ItmStsNme isKindOf [ItmStsNme, configFile >> "CfgVehicles"]) then { 		
				Player AddBackpack ItmStsNme; 
				lbDelete [1526, PassedIntCS];
				
				[] call GetCurrentGear;
				
				_TmpBkPk = Backpack Player; 
						
								if (_TmpBkPk != "") Then {
								StsBagArray pushBack _TmpBkPk; 
								ProfileNameSpace SetVariable ["SvdBagArray", StsBagArray];
								SaveProfileNamespace;
								
				
				_TempBagCt = {_x == ItmStsNme} count StsBagArray;
				StsBagArray = StsBagArray - [ItmStsNme];
				_TempBagCt = _TempBagCt-1;
					
					if (_TempBagCt > 0) then {
						
						for "_x" from 1 to _TempBagCt do {
						StsBagArray PushBack ItmStsNme; 
						};
					}; 
			ProfileNameSpace SetVariable ["SvdBagArray", StsBagArray];
			SaveProfileNamespace;
			[] call GetStashGear;
			
			}; 																		
		}; 																	
	}; 
}; 

ItmStsNme= nil; 
PassedIntCS= nil; 

};
}; 

DiscardItem = {

if (isNil "PassedIntCS") then {Hint "You must select an Item from your Stash."} else {

	if (ItmStsNme isKindOf [ItmStsNme, configFile >> "CfgWeapons"]) then {
		lbDelete [1526, PassedIntCS];
		_TempWpnCt = {_x == ItmStsNme} count StsWeaponArray;
		StsWeaponArray = StsWeaponArray - [ItmStsNme];
		_TempWpnCt = _TempWpnCt-1;
			if (_TempWpnCt > 0) then {
				for "_x" from 1 to _TempWpnCt do {
					StsWeaponArray PushBack ItmStsNme; 
				};
			}; 	
	ProfileNameSpace SetVariable ["SvdWeaponArray", StsWeaponArray];
	SaveProfileNamespace;
 	[] call GetStashGear; 
	
	} else {
	
			if (ItmStsNme isKindOf [ItmStsNme, configFile >> "CfgMagazines"]) then {
				lbDelete [1526, PassedIntCS];
				_TempMagCt = {_x == ItmStsNme} count StsMagArray;
				StsMagArray = StsMagArray - [ItmStsNme];
				_TempMagCt = _TempMagCt-1;
					if (_TempMagCt > 0) then {
						for "_x" from 1 to _TempMagCt do {
							StsMagArray PushBack ItmStsNme; 
						};
					}; 	
	ProfileNameSpace SetVariable ["SvdMagArray", StsMagArray];
	SaveProfileNamespace;
 	[] call GetStashGear; 
	
			} else { 
			
					if (ItmStsNme isKindOf [ItmStsNme, configFile >> "CfgVehicles"]) then {
						lbDelete [1526, PassedIntCS];
						_TempBagCt = {_x == ItmStsNme} count StsBagArray;
						StsBagArray = StsBagArray - [ItmStsNme];
						_TempBagCt = _TempBagCt-1;
							if (_TempBagCt > 0) then {
								for "_x" from 1 to _TempBagCt do {
									StsBagArray PushBack ItmStsNme; 
								};
							}; 	
					ProfileNameSpace SetVariable ["SvdBagArray", StsBagArray];
					SaveProfileNamespace;
					[] call GetStashGear; 
					
					} else {
							if (ItmStsNme == "") then { lbDelete [1526, PassedIntCS]; hint "Item Type Not Found, Faux Delete Operation."}; };
				}; 
			};
		}; 	
	}; 		
			
 ///////////////////////////////////////////////////////////////////////////////////////////
// Open Dialog
_handle= CreateDialog "A3M_WpnLkr";

StashArray = ["SMB"]; 

[] call GetCurrentGear; 
[] call GetStashGear;


