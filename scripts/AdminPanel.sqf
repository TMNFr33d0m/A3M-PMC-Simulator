/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/      
 
Admin Panel V 1.0 by Cody Salazar AKA Fr33d0m 
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

// Make sure only MAJOR rank can access Admin Panel
B_maxrank = "MAJOR";
_prat = rank player; 
 // Gather Some Data...
  
 // Number of Playable Blufor Slots Remaining: 
 A3M_AvailSlots = playableSlotsNumber blufor; 
 
 A3M_HandlePlyrSel= {
PassedVar = _this select 1;
TargetPlayer = lbdata [1595, PassedVar];
hint format ["Operative Selected. You have selected %1", TargetPlayer];
publicVariable "TargetPlayer";

[] call DoCurSelPlyr; 

 }; 
 
 //////////////////////////////////////////////////////////////////////////////////////////////////
//Initial Budget Creator
////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////
//Initial Budget for Side - Change in ParamsArray! 
B_initialbudget= paramsArray select 1;

if (isnil"B_defensebudget") then {
B_defensebudget= B_initialbudget;
publicVariable"B_defensebudget";
};
if (isnil"B_totalcost") then {
B_totalcost= 0;
publicVariable"B_totalcost";
};
///////////////////////////////////////////////////////////////////////////////////////////
//Number Conversion by Corello
A3M_handle_number=
{
private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];
_number = [_this,0,0,[0]] call bis_fnc_param;
_mod = [_this,1,3,[0]] call bis_fnc_param;
_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;
_modBase = _digitsCount % _mod;
_numberText ="";
{
_numberText = _numberText + str _x;
if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText +",";};
} foreach _digits;
_numberText
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Budget Balance in GUI
DoBudget = {
disableSerialization;
//Get the dialog display (a viewport)
_Bdisplay = findDisplay 9290;
if (str (_Bdisplay) !="no display") then
{
_ChildControl = _Bdisplay displayCtrl 1121;
//Change It
form_B_defensebudget= [B_defensebudget] call A3M_handle_number;
_ChildControl ctrlSetStructuredText parseText format ["$%1", form_B_defensebudget];
};
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Total Balance in GUI
DoTotal = {
disableSerialization;
//Get the dialog display (a viewport)
_BTdisplay = findDisplay 9290;
if (str (_BTdisplay) !="no display") then
{
_ChildControl2 = _BTdisplay displayCtrl 1122;
//Change It
form_B_totalcost= [B_totalcost] call A3M_handle_number;
_ChildControl2 ctrlSetStructuredText parseText format ["$%1", form_B_totalcost];
};
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Currently Selected Player in GUI
DoCurSelPlyr = {
disableSerialization;
//Get the dialog display (a viewport)
_BTdisplay = findDisplay 9290;
if (str (_BTdisplay) !="no display") then
{
_ChildControl3 = _BTdisplay displayCtrl 1124;
//Change It
if (isNil "TargetPlayer") then {_ChildControl3 ctrlSetStructuredText parseText format ["None"];} else {
_ChildControl3 ctrlSetStructuredText parseText format ["%1", TargetPlayer];
}; 
};
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Available Slots in GUI
DoPlyblSltCnt = {
disableSerialization;
//Get the dialog display (a viewport)
_BTdisplay = findDisplay 9290;
if (str (_BTdisplay) !="no display") then
{
_ChildControl3 = _BTdisplay displayCtrl 1123;
//Change It

if (isNil "A3M_AvailSlots") then {A3M_AvailSlots = "SP / ERROR"};

_ChildControl3 ctrlSetStructuredText parseText format ["%1", A3M_AvailSlots];
};
};

// Done With The Predefines and setup........
 //  Evaluate whether you are important enough to access this module...
 if (_prat != B_maxrank) then { Hint "You are not the Team Coordinator, and may not access the Admin Panel. Only the team coordinator may access this feature."} else {
 
 // Define how to get a list of players in game: 
 A3M_GetPlayers = {
 lbClear 1595;
 _idx= { lbAdd [1595, name _x] } forEach allPlayers; 
 // Pass the player's actual name along with the index number:
 {lbSetData [1595, _forEachIndex, name _X ]} forEach allPlayers; 
 };
 
 // This is to test the locality execution effect:  
 A3MLocalEffectTest = {
 if (isNil "TargetPlayer") then { hint " Please Select an Active Operative First!"} else {
PvtTextMsg = ctrlText 1400;
publicVariable "PvtTextMsg";
['','A3M_Fnc_Testmessage',True,False] call BIS_fnc_MP;
hint Format ["You have messaged %1 with the following message: \n \n %2", TargetPlayer, PvtTextMsg];
}; 
};
 
 // Define what buttons do: 
 
// Advance $10,000 to all Players 
CashAdvance = { 
hint "You have advanced $10,000.00 to each player in the game. This money has been subtracted from the Operational Budget. "; 
sleep 1; 
[ '','A3M_fnc_MoneyToAll',True,False] spawn BIS_fnc_MP; 
[] call DoBudget;
[] call DoTotal; 
}; 

// Advance to Individual Player (Custom Amount)
OpAdvance = {

GlobalPushAmount = ctrlText 1401;
GlobalPushAmount = parseNumber GlobalPushAmount;
publicVariable "GlobalPushAmount"; 

if (isNil "TargetPlayer") then { hint "Please Select an Active Operative First"} else {
	if (isNil "GlobalPushAmount") then { Hint "You must first set an amount."} else {
		if (GlobalPushAmount <= 0 ) then { Hint "You Can't Do That."} else {
			if (GlobalPushAmount < 1) then {Hint "You must advance more than that, cheapskate!"} else {
				if (GlobalPushAmount >= 1) then {
				['','A3M_fnc_MoneyToYou',True,False] spawn BIS_fnc_MP; 
				sleep 1; 
				[] call DoBudget;
				[] call DoTotal;
				}; 
			}; 
		};
	};
};	
};
// Deduct From Individual Player 
OpDeduct = {

GlobalPushAmount = ctrlText 1401;
GlobalPushAmount = parseNumber GlobalPushAmount;
publicVariable "GlobalPushAmount";

if (isNil "TargetPlayer") then { hint " Please Select an Active Operative First"} else {
	if (isNil "GlobalPushAmount") then { Hint "You must first set an amount."} else {
		 if (GlobalPushAmount <= 0 ) then { Hint "You Can't Do That."} else {
			if (GlobalPushAmount < 1) then {Hint "You must deduct more than that, light-hand!"} else {
				if (GlobalPushAmount >= 1) then {
				['','A3M_fnc_MoneyFromYou',True,False] spawn BIS_fnc_MP; 
				sleep 1; 
				[] call DoBudget;
				[] call DoTotal;
				}; 
			};
		 };
	};
};	
};

// Force Cancel All Missions
CancelAllMissions = {

hint "You have issued an order to abandon all orders and RTB. Processing..."; 

sleep 2; 

MissionStatus= "M0"; 
PublicVariable "MissionStatus"; 
hint "JIP Tasker Module Reset"; 

sleep 1; 

EscortActive = 0; 
publicVariable "EscortActive"; 
[VIP1] joinSilent grpnull; 

deleteVehicle VIPDest;
deleteVehicle VIPDead; 
deleteVehicle VIP1;

hint "Escort Mission Cancelled."; 

sleep 1; 

ConveyActive = 0; 
publicVariable "ConvoyActive"; 
deleteVehicle DelDest;
deleteVehicle DelDead; 
deleteVehicle DEL1;
hint "Convoy Mission Cancelled."; 

sleep 1; 

CheckpointActive = 0;
publicVariable "CheckpointActive"; 
hint "Checkpoint Shift Ended Early.";

sleep 1; 

SEActive = 0; 
PublicVariable "SEActive"; 
"SAR1ICO" setmarkerpos (getMarkerpos "offmap");
deleteVehicle SAR1; 
hint "Snatch And Extract Mission Cancelled.";

sleep 1; 

raid1Active = 0; 
publicVariable "raid1Active"; 
hint "Raid I Mission Cancelled.";

sleep 1; 

raid2Active = 0; 
publicVariable "raid2active"; 
hint "Raid II Mission Cancelled."; 

sleep 1; 

NSARActive = 1; 
publicVariable "NSARActive"; 
hint "NATO Search And Rescue Mission Cancelled.";

sleep 1; 

T9Active = 1; 
publicVariable "T9Active"; 
hint "T9 Security Shift Ended Early.";

hint "Cancelling all missions for players"; 

sleep 1; 

[ '','A3M_MissionsCanceledMP',True,False] spawn BIS_fnc_MP;

sleep 1; 

hint "All Missions Force Cancelled Successfully."; 

};

// Force Cleanup
A3M_Fnc_Cleanup = {
hint "Cleanup Initiated...Removing Waste...";
{ if (!alive _x) then { deletevehicle _x } } foreach (nearestObjects [center, ["Man", "Car", "Tank", "Helicopter"], 7500]);

};

// Incarcerate
A3M_fnc_Incarcerate = {
if (isNil "TargetPlayer") then { hint " Please Select an Active Operative First!"} else {
['','A3M_Fnc_GoToJail',True,False] spawn BIS_fnc_MP; 
hint format ["You have incarcerated %1 in the C-12 Detention Facility.", TargetPlayer];
};
}; 

// Refresh
A3M_Refresh = {

[] spawn A3M_GetPlayers; 
[] call DoBudget;
[] call DoTotal; 
[] call DoCurSelPlyr; 
[] call DoPlyblSltCnt;

}; 

// Close Dialog

A3M_Fnc_CloseDia = {
CloseDialog 0; 
TargetPlayer= nil; 
publicVariable "TargetPlayer";
GlobalPushAmount = Nil; 
PublicVariable "GlobalPushAmount";
PvtTextMsg = nil; 
PublicVariable "PvtTextMsg";
};
 ///////////////////////////////////////////////////////////////////////////////////////////
// Open Dialog
_handle= CreateDialog "A3M_AdminPanel";
// Create list of connected players 
[] spawn A3M_GetPlayers; 
[] call DoBudget;
[] call DoTotal; 
[] call DoCurSelPlyr; 
[] call DoPlyblSltCnt; 

}; 
