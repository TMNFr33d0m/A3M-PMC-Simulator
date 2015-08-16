/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/      
                                                                                                                                                              

X Reload AIR (A spin-off of Xeno's X-Reload) V 1.0 by Cody Salazar AKA Fr33d0m 
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

To Xeno, for this script's core, despite the fact that he'd probably call me a thief. 

And last, but definitely not least, the A3 community, who through over 250+ encouraging messages highly encouraged me to continue this project. I'm glad you like it, 
and I hope you enjoy the things I have in the works! 

################################## LET US BEGIN #################################### */

// DEBUG - 1 = ON : 0= OFF
_Debug = 0; 

_object = _this;
_type = typeOf _object;
_ReloadTime = 3.00;

_Crew1= Crewman1;
_Crew2= Crewman2;
_Stage= crewstage1;
_Stage2= crewstage2;
_Stage3= crewstage3;
_helipad= salsvc;

_ReFuelCost = 0; 
_ReArmCost = 0; 

_GasPrice = ParamsArray Select 6; 
_RepairPrice = ParamsArray Select 5;

if (isNil "B_DefenseBudget") then { B_DefenseBudget = paramsArray select 1}; 
if (isnil "B_totalcost") then {B_totalcost= 0}; 

if (B_DefenseBudget < 5000) then { Hint "OPSG does not have the available company funds to service this vehicle."} else { 

_LastFuelState = fuel _object;

_object setFuel 0; 

_Crew1 playMove "Acts_NavigatingChopper_Out"; 
sleep 1.0; 
_Crew2 doMove (getPos _object);
sleep 3.0;
_Crew2 attachTo [_object, [-1.5,0.0,-1.5]];
_Crew2 setDir 90;
sleep 1.0;
publicSwitch1= Crewman2 switchMove "Acts_carFixingWheel"; 
publicVariable "publicSwitch1";

_object vehicleChat format ["Servicing %1... Please stand by...", _type];

_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

_SavedMags =0;
 
_SavedMags = count Magazines _object; 

if (count _magazines > 0) then {
	_removed = [];
	{
		if (!(_x in _removed)) then {
			_object removeMagazines _x;
			_removed = _removed + [_x];
		};
	} forEach _magazines;
	{
		_object vehicleChat format ["Reloading %1", _x];
		sleep _ReloadTime;
		_object addMagazine _x;
		_ReArmCost = (_ReArmCost + 100); 
	} forEach _magazines;
};

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

if (_count > 0) then {
	for "_i" from 0 to (_count - 1) do {
		scopeName "xx_reload2_xx";
		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
		_magazines = getArray(_config >> "magazines");
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_object removeMagazines _x;
				_removed = _removed + [_x];
			};
		} forEach _magazines;
		{
			_object vehicleChat format ["Rearming Aircraft %1", _x];
			sleep _ReloadTime;
			_object addMagazine _x;
			_ReArmCost = (_ReArmCost + 100); 
			sleep _ReloadTime;
		} forEach _magazines;
		_count_other = count (_config >> "Turrets");
		if (_count_other > 0) then {
			for "_i" from 0 to (_count_other - 1) do {
				_config2 = (_config >> "Turrets") select _i;
				_magazines = getArray(_config2 >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_object removeMagazines _x;
						_removed = _removed + [_x];
					};
				} forEach _magazines;
				{
					_object vehicleChat format ["Reloading %1", _x]; 
					sleep _ReloadTime;
					_object addMagazine _x;
					_ReArmCost = (_ReArmCost + 100); 
					sleep _ReloadTime;
				} forEach _magazines;
			};
		};
	};
};

_SavedMags = (_SavedMags * 100); 
_ReArmCost = (_ReArmCost - _SavedMags); 

	if (_Debug == 1) then {

hint format ["_Savedmags Count is %1", _Savedmags]; 
Sleep 5; 
hint format ["_ReArmCost is %1", _ReArmCost]; 
Sleep 5; 
};

B_DefenseBudget = (B_DefenseBudget - _ReArmCost); 

_object setVehicleAmmo 1;	// Reload turrets / drivers magazine

sleep _ReloadTime;

// Get Damage of Vehicle
_CurDmg = getDammage _object; 

// Mutiply by 10 to get a PMI (0.9 * 10 = 9)  - so it should take 9 hours to fix it. 
_DmgWait = (_CurDmg * 10); 

_LaborPrice = (_DmgWait * _RepairPrice); // 9 hours, * 20 an hour, or whatever you set Repair Price to (ParamsArray Select 5) 
// PARTS!! At rate of 1000 per .10 of damage, or again, at 9 damage, 9000 in parts. 
_PartsPrice = (_CurDmg * 20000); 
// Price of all damage is Labor + Parts. 
_DmgPrice = (_LaborPrice + _PartsPrice); 

hint format [" SERVICE DEPARTMENT: \n \n The service will take %1 Labor Hours to complete, that'll run about $%2 at the agreed labor price of $%3 per hour... \n \n The service will cost  $%4 in parts... \n \n The total cost will be $%5", _DmgWait, _LaborPrice, _RepairPrice, _PartsPrice, _DmgPrice]; 
Sleep 5; 

B_DefenseBudget = (B_DefenseBudget - _DmgPrice); 


_object vehicleChat "Repairing...";
sleep _DmgWait;
_object setDamage 0;
sleep _ReloadTime;

_object vehicleChat "Refueling...";
while {fuel _object < 0.99} do {
	_object setFuel ((fuel _object + 0.1) min 1);
	//_object setFuel 1;
	B_DefenseBudget = (B_DefenseBudget - _GasPrice); 
	_ReFuelCost= (_ReFuelCost + _GasPrice); 
	sleep 0.10;
};
sleep _ReloadTime;

_SubTotal = (_ReArmCost+_ReFuelCost+_DmgPrice); 
hint format ["Service Cost: \n \n Rearmament: $%1 \n \n Repairs: $%2, \n \n Refuelling: $%3 \n \n Total: $%4 \n \n Billed to OPSG PMC GROUP.", _ReArmCost, _DmgPrice, _ReFuelCost, _SubTotal];
B_totalcost = (B_totalcost + _SubTotal); 
publicVariable "B_totalcost"; 
publicVariable "B_DefenseBudget"; 

detach _Crew2;
_Crew2 switchMove "Acts_NavigatingChopper_Out"; 

_object vehicleChat format ["%1 is Go-Flight...fly safe!", _type];
sleep 2.0; 
_Crew2 doMove (getPos _Stage);
sleep 3.0;
_Crew2 setPosATL (getPos _Stage);
_Crew1 setPosATL (getPos _Stage2);
if (true) exitWith {};
}; 