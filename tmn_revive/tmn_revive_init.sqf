//TMN Revive Module - Based off of Farooq's Revive. Made way better by Fr33d0m. 

Badassery= 0; 

// Seconds until unconscious unit bleeds out and dies. Set to 0 to disable.
TMN_BleedOut = 120;	

// Enable teamkill notifications
TMN_EnableDeathMessages = true;

/*
	0 = Only medics can revive
	1 = All units can revive
	2 = Same as 1 but a medikit is required to revive
*/
TMN_ReviveMode = 0;

//------------------------------------------//

call compile preprocessFile "TMN_revive\TMN_revive_funcs.sqf";

#define SCRIPT_VERSION "2.0"

TMN_isDragging = false;
TMN_isDragging_EH = [];
TMN_deathMessage = [];
TMN_Debugging = true;

if (isDedicated) exitWith {};

////////////////////////////////////////////////
// Player Initialization
////////////////////////////////////////////////
[] spawn
{
    waitUntil { !isNull player };

	// Public event handlers
	"TMN_isDragging_EH" addPublicVariableEventHandler TMN_public_EH;
	"TMN_deathMessage" addPublicVariableEventHandler TMN_public_EH;
	
	[] spawn TMN_Player_Init;
	
	hintSilent format["TMN Medic Module %1 is initialized.", SCRIPT_VERSION];

	// Event Handlers
	player addEventHandler 
	[
		"Respawn", 
		{ 
			[] spawn TMN_Player_Init;
		}
	];
};

// Drag & Carry animation fix
[] spawn
{
	while {true} do
	{
		if (animationState player == "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon" || animationState player == "helper_switchtocarryrfl" || animationState player == "AcinPknlMstpSrasWrflDnon") then
		{
			if (TMN_isDragging) then
			{
				player switchMove "AcinPknlMstpSrasWrflDnon";
			}
			else
			{
				player switchMove "amovpknlmstpsraswrfldnon";
			};
		};
			
		sleep 3;
	}
};

TMN_Player_Init =
{
	// Cache player's side
	TMN_PlayerSide = side player;

	// Clear event handler before adding it
	player removeAllEventHandlers "HandleDamage";

	player addEventHandler ["HandleDamage", TMN_HandleDamage_EH];
	player addEventHandler 
	[
		"Killed",
		{
			// Remove dead body of player (for missions with respawn enabled)
			_body = _this select 0;
			
			[_body] spawn 
			{
			
				waitUntil { alive player };
				_body = _this select 0;
				removeGoggles _body;
			}
		}
	];
	
	player setVariable ["TMN_isUnconscious", 0, true];
	player setVariable ["TMN_isDragged", 0, true];
	TMN_isDragging = false;
	
	[] spawn TMN_Player_Actions;
};

////////////////////////////////////////////////
// [Debugging] Add revive to playable AI units
////////////////////////////////////////////////
if (!TMN_Debugging || isMultiplayer) exitWith {};

{
	if (!isPlayer _x) then 
	{
		_x addEventHandler ["HandleDamage", TMN_HandleDamage_EH];
		_x setVariable ["TMN_isUnconscious", 0, true];
		_x setVariable ["TMN_isDragged", 0, true];
	};
} forEach switchableUnits;