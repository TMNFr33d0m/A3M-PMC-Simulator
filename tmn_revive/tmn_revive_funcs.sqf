////////////////////////////////////////////////
// Player Actions
////////////////////////////////////////////////
TMN_Player_Actions =
{
	if (alive player && player isKindOf "Man") then 
	{
		// addAction args: title, filename, (arguments, priority, showWindow, hideOnUse, shortcut, condition, positionInModel, radius, radiusView, showIn3D, available, textDefault, textToolTip)
		player addAction ["<t color=""#00FFFF"">" + "Stabilize Trauma" + "</t>", "TMN_revive\TMN_handleAction.sqf", ["action_revive"], 10, true, true, "", "call TMN_Check_Revive"];
		player addAction ["<t color=""#C90000"">" + "Succumb to Injuries" + "</t>", "TMN_revive\TMN_handleAction.sqf", ["action_suicide"], 9, false, true, "", "call TMN_Check_Suicide"];
		player addAction ["<t color=""#FFFF00"">" + "Drag to Safety" + "</t>", "TMN_revive\TMN_handleAction.sqf", ["action_drag"], 9, false, true, "", "call TMN_Check_Dragging"];
	};
};

////////////////////////////////////////////////
// Handle Death
////////////////////////////////////////////////
TMN_HandleDamage_EH =
{
	private ["_unit", "_amountOfDamage", "_killer", "_isUnconscious"];

	_unit = _this select 0;
	_wherehit= _this select 1; 
	_amountOfDamage = _this select 2;
	_killer = _this select 3;
	//_killerammotype= _this select 4; 
	_isUnconscious = _unit getVariable "TMN_isUnconscious";
	
	if (alive _unit && {_amountOfDamage >= 1} && {_isUnconscious == 0}) then 
	{
		_unit setDamage 0;
		_unit allowDamage false;

		[_wherehit, _unit, _killer] spawn TMN_Player_Unconscious;
		
		_amountOfDamage = 0;
	};
	
	_amountOfDamage
};

////////////////////////////////////////////////
// Make Player Unconscious
////////////////////////////////////////////////
TMN_Player_Unconscious =
{
	private["_wherehit", "_unit", "_killer"];
	_wherehit = _this select 0;
	_unit = _this select 1;
	_killer = _this select 2;
	
	// Death message
	if (TMN_EnableDeathMessages && {!isNil "_killer"} && {_killer != _unit}) then
	{
		TMN_deathMessage = [_unit, _killer];
		publicVariable "TMN_deathMessage";
		["TMN_deathMessage", [_unit, _killer]] call TMN_public_EH;
	};
	
	if (isPlayer _unit) then
	{
		disableUserInput true;
		titleText ["You have been seriously wounded. You need medical assistance, fast!", "PLAIN"];
		playMusic "dead";		
	
	};
	
	// Eject unit if inside vehicle
	if (vehicle _unit != _unit) then 
	{
		unAssignVehicle _unit;
		_unit action ["eject", vehicle _unit];
		
		sleep 1;
	};
	
	[ [ _unit, "Static_Dead" ], "switchMoveEverywhere" ] call BIS_fnc_MP;
	
	_unit setDamage 0;
    _unit setVelocity [0,0,0];
    _unit allowDamage false;
	_unit setCaptive true;
    sleep 2.0;
	    
	if (isPlayer _unit) then
	{
		disableUserInput false;
		["", [_unit]] call TMN_laststand;
	};
	_unit setVariable ["TMN_isUnconscious", 1, true];
	
   [ [ _unit, "acts_InjuredAngryRifle01" ], "switchMoveEverywhere" ] call BIS_fnc_MP;
   

	// Call this code only on players
	if (isPlayer _unit) then 
	{
		_bleedOut = time + TMN_BleedOut;
		
		while { !isNull _unit && {alive _unit} && {_unit getVariable "TMN_isUnconscious" == 1} && {(TMN_BleedOut <= 0 || time < _bleedOut)} } do
		{
			hintSilent format["You have been severely wounded in the %1, You will bleed out in %2 seconds\n\n%3", _wherehit, round (_bleedOut - time), call TMN_CheckFriendlies];
			sleep 0.5;
		};
		
		// Player bled out
		if (TMN_BleedOut > 0 && {time > _bleedOut}) then
		{
			[ [ _unit, "Static_Dead" ], "switchMoveEverywhere" ] call BIS_fnc_MP;
			_unit setDamage 1;
			_unit setCaptive false;
			_unit setVariable ["TMN_isUnconscious", 0, true];
			_unit setVariable ["TMN_isDragged", 0, true];
			_unit removeAction laststand;
			badassery= 0; 
			playMusic "";
            heldrating= rating _unit; 
            hint format ["You have passed away. At your time of death, you had %1 rating points. These points are being passed along to your new character.", heldrating]; 
		}
		else
		{
			// Player got revived
			sleep 1.0;
			
			// Clear the "medic nearby" hint
			hintSilent "";
			
			_unit allowDamage true;
			_unit setDamage 0;
			_unit setCaptive false;
			_unit removeAction lastStand; 
			badassery= 0; 
			playMusic "";
			[[ _unit, "amovppnemstpsraswrfldnon" ], "switchMoveEverywhere" ] call BIS_fnc_MP;
		};
	}
	else
	{
		// [Debugging] Bleedout for AI
		_bleedOut = time + TMN_BleedOut;
		
		while { !isNull _unit && {alive _unit} && {_unit getVariable "TMN_isUnconscious" == 1} && {(TMN_BleedOut <= 0 || time < _bleedOut)} } do
		{
			sleep 0.5;
		};
		
		// AI bled out
		if (TMN_BleedOut > 0 && {time > _bleedOut}) then
		{
			_unit setDamage 1;
			_unit setVariable ["TMN_isUnconscious", 0, true];
			_unit setVariable ["TMN_isDragged", 0, true];
		}
	};
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////  
  TMN_laststand= 
{

laststand= player addAction ["Wounded Crawl",{
heldrating= rating player; 
 player setFatigue 1; 
 player allowDamage True;
 player removeItems "FirstAidKit";
 player setDamage 0.9;  
 player setCaptive False; 
 player removeAction laststand; 
 badassery= 1;
 [[ player, "AmovPpneMstpSrasWrflDnon_injured" ], "switchMoveEverywhere" ] call BIS_fnc_MP;
 }];	 
 
 while {badassery == 1} do {player playMove "AmovPpneMstpSrasWrflDnon_injured";};
 
 
 if !(alive player) then {
_unit setVariable ["TMN_isUnconscious", 0, true];
_unit setVariable ["TMN_isDragged", 0, true];
_unit removeAction laststand;
badassery= 0; 
playMusic "";

[ [ _unit, "Static_Dead" ], "switchMoveEverywhere" ] call BIS_fnc_MP;};
 
};  
 
 

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

////////////////////////////////////////////////
// Revive Player
////////////////////////////////////////////////
TMN_HandleRevive =
{
	private ["_target"];
	_target = _this select 0;


	if (alive _target) then
	{
		player playAction "medicStart";
		sleep 5.0;
		
		_target setVariable ["TMN_isUnconscious", 0, true];
		_target setVariable ["TMN_isDragged", 0, true];
		
		player playMoveNow "amovpknlMstpSrasWrflDnon";
	
		// [Debugging] Code below is only relevant if revive script is enabled for AI
		if (!isPlayer _target) then
		{
		  sleep 4.0;			
			_target allowDamage true;
			_target setDamage 0;
			_target setCaptive false;
			[ [ _target, "amovppnemstpsraswrfldnon" ], "switchMoveEverywhere" ] call BIS_fnc_MP;
		};
	
	};
};

////////////////////////////////////////////////
// Drag Injured Player
////////////////////////////////////////////////
TMN_Drag =
{
	private ["_target", "_id"];
	
	TMN_isDragging = true;

	_target = _this select 0;

    _target attachTo [player, [0, 1.1, 0.092]];
	_target setDir 180;
	_target setVariable ["TMN_isDragged", 1, true];
	
	
	player playMoveNow "AcinPknlMstpSrasWrflDnon";
	[ [ _target, "AinjPpneMrunSnonWnonDb" ], "switchMoveEverywhere" ] call BIS_fnc_MP;
	
	// Rotation fix
	TMN_isDragging_EH = _target;
	publicVariable "TMN_isDragging_EH";
	
	// Add release action and save its id so it can be removed
	_id = player addAction ["<t color=""#FFFF00"">" + "Release Wounded" + "</t>", "TMN_revive\TMN_handleAction.sqf", ["action_release"], 10, true, true, "", "true"];
	
	hint "Press 'C' if you can't move.";
	
	// Wait until release action is used
	waitUntil 
	{ 
		!alive player || player getVariable "TMN_isUnconscious" == 1 || !alive _target || _target getVariable "TMN_isUnconscious" == 0 || !TMN_isDragging || _target getVariable "TMN_isDragged" == 0 
	};

	// Handle release action
	TMN_isDragging = false;
	
	if (!isNull _target && alive _target) then
	{
		[ [ _target, "Acts_SittingWounded_loop" ], "switchMoveEverywhere" ] call BIS_fnc_MP;
		_target setVariable ["TMN_isDragged", 0, true];
		detach _target;
		_target setDir (getDir player);
	};
	
	player removeAction _id;
};

TMN_Release =
{
	// Switch back to default animation
	player playMove "amovpknlmstpsraswrfldnon";

	TMN_isDragging = false;
};



////////////////////////////////////////////////
// Event handler for public variables
////////////////////////////////////////////////
TMN_public_EH =
{
	if(count _this < 2) exitWith {};
	
	_EH  = _this select 0;
	_target = _this select 1;

	// TMN_isDragging
	if (_EH == "TMN_isDragging_EH") then
	{
		_target setDir 180;
	};
	
	// TMN_deathMessage
	if (_EH == "TMN_deathMessage") then
	{
		_killed = _target select 0;
		_killer = _target select 1;

		if (isPlayer _killed && isPlayer _killer) then
		{
			systemChat format["%1 was seriously wounded by %2", name _killed, name _killer];
		};
	};
};

////////////////////////////////////////////////
// Revive Action Check
////////////////////////////////////////////////
TMN_Check_Revive = 
{
	private ["_target", "_isTargetUnconscious", "_isDragged"];

	_return = false;
	
	// Unit that will excute the action
	_isPlayerUnconscious = player getVariable "TMN_isUnconscious";
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf player >> "attendant");
	_target = cursorTarget;

	// Make sure player is alive and target is an injured unit
	if( !alive player || _isPlayerUnconscious == 1 || TMN_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !TMN_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return
	};

	_isTargetUnconscious = _target getVariable "TMN_isUnconscious";
	_isDragged = _target getVariable "TMN_isDragged"; 
	
	// Make sure target is unconscious and player is a medic 
	if (_isTargetUnconscious == 1 && _isDragged == 0 && (_isMedic == 1 || TMN_ReviveMode > 0) ) then
	{
		_return = true;

		// [ReviveMode] Check if player has a Medikit
		if ( TMN_ReviveMode == 2 && !("Medikit" in (items player)) ) then
		{
			_return = false;
		};
	};
	
	_return
};

////////////////////////////////////////////////
// Suicide Action Check
////////////////////////////////////////////////
TMN_Check_Suicide =
{
	_return = false;
	_isPlayerUnconscious = player getVariable "TMN_isUnconscious";
	
	if (alive player && _isPlayerUnconscious == 1) then 
	{
		_return = true;
	};
	
	_return
};

////////////////////////////////////////////////
// Dragging Action Check
////////////////////////////////////////////////
TMN_Check_Dragging =
{
	private ["_target", "_isPlayerUnconscious", "_isDragged"];
	
	_return = false;
	_target = cursorTarget;
	_isPlayerUnconscious = player getVariable "TMN_isUnconscious";

	if( !alive player || _isPlayerUnconscious == 1 || TMN_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !TMN_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return;
	};
	
	// Target of the action
	_isTargetUnconscious = _target getVariable "TMN_isUnconscious";
	_isDragged = _target getVariable "TMN_isDragged"; 
	
	if(_isTargetUnconscious == 1 && _isDragged == 0) then
	{
		_return = true;
	};
		
	_return
};

////////////////////////////////////////////////
// Show Nearby Friendly Medics
////////////////////////////////////////////////
TMN_IsFriendlyMedic =
{
	private ["_unit"];
	
	_return = false;
	_unit = _this;
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf _unit >> "attendant");
				
	if ( alive _unit && {(isPlayer _unit || TMN_Debugging)} && {side _unit == TMN_PlayerSide} && {_unit getVariable "TMN_isUnconscious" == 0} && {(_isMedic == 1 || TMN_ReviveMode > 0)} ) then
	{
		_return = true;
	};
	
	_return
};

TMN_CheckFriendlies =
{
	private ["_unit", "_units", "_medics", "_hintMsg"];
	
	_units = nearestObjects [getpos player, ["Man", "Car", "Air", "Ship"], 800];
	_medics = [];
	_dist = 800;
	_hintMsg = "";
	
	// Find nearby friendly medics
	if (count _units > 1) then
	{
		{
			if (_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship") then
			{
				if (alive _x && count (crew _x) > 0) then
				{
					{
						if (_x call TMN_IsFriendlyMedic) then
						{
							_medics = _medics + [_x];
							
							if (true) exitWith {};
						};
					} forEach crew _x;
				};
			} 
			else 
			{
				if (_x call TMN_IsFriendlyMedic) then
				{
					_medics = _medics + [_x];
				};
			};
			
		} forEach _units;
	};
	
	// Sort medics by distance
	if (count _medics > 0) then
	{
		{
			if (player distance _x < _dist) then
			{
				_unit = _x;
				_dist = player distance _x;
			};
		
		} forEach _medics;
		
		if (!isNull _unit) then
		{
			_unitName	= name _unit;
			_distance	= floor (player distance _unit);
			
			_hintMsg = format["There is hope! Nearest Medic:\n%1 is %2m away.", _unitName, _distance];
		};
	} 
	else 
	{
		_hintMsg = "You are fucked. No medic nearby.";
	};
	
	_hintMsg
};



