/*
  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/  



Bank Account V 1.5 by Cody Salazar AKA Fr33d0m 
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

Corello, for helping me with forming long numbers in Arma without truncation, and his awesome wife #define, for her work and encouragement. 

Cannabis, Sativa and Indica, (The legal, medical variety) for giving me the patience and focus to complete this project over, and over again. 

And last, but definitely not least, the A3 community, who through over 250+ encouraging messages highly encouraged me to continue this project. I'm glad you like it, 
and I hope you enjoy the things I have in the works! 

################################## LET US BEGIN #################################### */

disableSerialization;

A3M_handle_number=
{
private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];
 
_number = [_this,0,0,[0]] call bis_fnc_param;
_mod = [_this,1,3,[0]] call bis_fnc_param;
 
_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;
 
_modBase = _digitsCount % _mod;
_numberText = "";
{
_numberText = _numberText + str _x;
if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + ",";};
} foreach _digits;
_numberText
};

///////////////////////////////////////////////////////////////////////////////////////////
//Update Account Balance in GUI

DoBalance = {
//Get the dialog display (a viewport)
_Bdisplay = findDisplay 6969;

if (str (_Bdisplay) != "no display") then 
{
	_ChildControl = _Bdisplay displayCtrl 1160;
        //Change It
		form_Balance= [Wallet] call A3M_handle_number;
	_ChildControl ctrlSetStructuredText parseText format ["$%1", form_Balance];
};
}; 



///////////////////////////////////////////////////////////////////////////////////////////
//Update Debit Balance in GUI

DoDebits = {
//Get the dialog display (a viewport)
_Bdisplay = findDisplay 6969;

if (str (_Bdisplay) != "no display") then 
{
	_ChildControl = _Bdisplay displayCtrl 1161;
        //Change It
		form_Debits= [Debits] call A3M_handle_number;
	_ChildControl ctrlSetStructuredText parseText format ["$%1", form_Debits];
};
}; 



A3M_fnc_TnE = 
{ 
if (signedin == 1) then { 
PM = ParamsArray Select 0; 
disableSerialization;
plyscore = rating player;
multiplyer = plyscore * PM; 
Wallet = (Wallet + Multiplyer); 
profileNamespace setVariable ["SavedMoney", Wallet]; 
hint format ["Payday! You were paid $%1.00 for services rendered. The money has been direct deposited to your account.", multiplyer]; 
player addRating -plyscore; 
plyscore = rating player;
SaveProfileNamespace;
[] call DoBalance; 
[] call DoDebits; 

} else {Hint "Guest User: You are not signed in! Please sign in to the banking system."}; 
};

A3M_SignIn = {
if (signedin == 0) then {
disableSerialization;
Wallet = 0; 
getdough= profileNamespace getVariable ["SavedMoney", 0];
Wallet = (Wallet+getdough); 
Pname = profileName;
hint format ["Welcome %1, You have signed in to the Medius Federated Credit Union.", Pname]; 
signedin= 1; 
[] call DoBalance; 
[] call DoDebits; 
} else {hint format ["Welcome back, %1! You are already signed in!", Pname]}; 

}; 


///////////////////////////////////////////////////////////////////////////////////////////
// Open Dialog
_handle= CreateDialog "A3M_BankAccount";

[] call DoDebits; 
[] call DoBalance; 