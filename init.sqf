/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/      
                                                                                                                                                                 
                                                                                                             



Init V2.0 by Cody Salazar AKA Fr33d0m 
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

// Set Initial Variable - Dedi Server Detection 
DediPresent = 0; 

if (isDedicated) then {
	
	// Set Global Variable - Dedicated Server Is Present! 
	DediPresent = 1; 
	publicVariable "DediPresent";
	
	// No TFAR Backpacks on spawn. No!! 
	tf_no_auto_long_range_radio = true;
	publicVariable "tf_no_auto_long_range_radio";

	
	// The line below is very important for  A3M revive, The Sitting Script and the Base Animations. 
	switchMoveEverywhere = compileFinal " _this select 0 switchMove (_this select 1);";
	
			// Server Side Predefines
			_SvrPreDef = ExecVM "scripts\ServerSide_Predef.sqf";
			waitUntil {scriptDone _SvrPreDef};
			
			// Load the Common Predefines 
			//_CmnPreDef = execVM "scripts\Common_Predef.sqf";
			//waitUntil {scriptDone _CmnPreDef};
		
			// Load Mission Predefines 
			//_MsnPreDef = ExecVM "scripts\Mission_Predef.sqf";
			//waitUntil {scriptDone _MsnPreDef};
			
	     // Server Executes Base Animations for all players, JIP players too via BIS_Fnc_MP
		 
		//the line below makes base animations happen
		[[[],"scripts\C12staff.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
		// T9 Facility Staff 
		[[[],"scripts\T9staff.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
		
		// Retrive Company Budget from ALiVE Servers, if selected from mission params. 
		
				AlivePersistBudget = paramsArray select 1; 
		
				if (AlivePersistBudget == 1) then {
					B_DefenseBudget = ["P_DefenseBudget"] call ALiVE_fnc_getData;
					
					if (B_DefenseBudget == 1) then {systemChat "ERROR: Persistant Budget Failed To Load. Budget set at 12 Million."; B_DefenseBudget = 12000000; publicVariable "B_DefenseBudget";} else {publicVariable "B_DefenseBudget"};					
				}; 
				
		} else {
			// Handle Client Hosted ...Bad Idea!! 
			if ((isServer) and (!IsDedicated))then {
				// Set Initialization Phase to 1 (True)
					if (IsNil "AlivePersistBudget") then {AlivePersistBudget = 0}; 
					
					if (AlivePersistBudget == 1) then {
					B_DefenseBudget = 12000000;
					publicVariable "B_DefenseBudget";					
					systemChat "WARNING: ALiVE Budget Persistence NOT SUPPORTED in Client Hosting Mode.";
					systemChat "WARNING: Budget Reverted to 12 Million.";
				}; 
				
				initphase = 1; 
					// No TFAR Backpacks on spawn. No!! 
					tf_no_auto_long_range_radio = true;
					publicVariable "tf_no_auto_long_range_radio";
				// The line below is very important for  A3M revive, The Sitting Script and the Base Animations. 
				switchMoveEverywhere = compileFinal " _this select 0 switchMove (_this select 1);";
		
				// Make Player Invincible for Spawn In 
				player allowDamage false; 
		
				// Show Black Load Screen
				titleText ["A3M | PMC SIMULATOR  *  LOADING, PLEASE WAIT..... ", "BLACK FADED",10];

			//the line below makes C-12 base animations happen, execute on server, to all via MP.
			[[[],"scripts\C12staff.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
		
			// T9 Facility Staff animations, execute on server, to all via MP.
			[[[],"scripts\T9staff.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
			
			hint "WARNING: This mission is best played on a dedicated server. This is a performance demanding mode, and will degrade performance on most client-hosted machines. ALiVE Persistant Budget Disabled.";
			
			
			// Server Side Predefines
			_SvrPreDef = ExecVM "scripts\ServerSide_Predef.sqf";
			waitUntil {scriptDone _SvrPreDef};
			
				// Load the MP Predefines 
			_MPpreDef = execVM "scripts\MP_Predef.sqf";
			waitUntil {scriptDone _MPpreDef};
		
			
			// Load the Common Predefines OLD METHOD, OUTDATED, DO NOT USE! 
			//_CmnPreDef = execVM "scripts\Common_Predef.sqf";
			//waitUntil {scriptDone _CmnPreDef};
		
			// Load Mission Predefines 
			//_MsnPreDef = ExecVM "scripts\Mission_Predef.sqf";
			//waitUntil {scriptDone _MsnPreDef};
		
		// Initiate Bank Account
		[] call A3M_Fnc_InitBank; 
		
		titleText ["A3M PMC SIMULATOR | Lite Version *  LOADING, PLEASE WAIT..... ", "BLACK FADED",1];
		
		// The intro wont work without this sleep, for some reason. 
		sleep 1; 
		
		//The line below plays the intro text at spawn in. 
		execVM "scripts\intro.sqf";
	
		waitUntil {player == player}; 

		[player] execVM "Scripts\PMCBasic.sqf"; 

				//the line below starts the briefing
				execVM "scripts\briefing.sqf";
	
		_JIPTasker = execVM "scripts\initask.sqf"; 
		waitUntil {scriptDone _JIPTasker};
		
		// Some invincible time, to allow player to avoid troll killing.  
		sleep 30; 
		
		// Shield removed. Player is now vulnerable. 
		player allowDamage true; 
		
		initphase = 0; 

		systemChat "Loading Phase * A3M PMC Simulator Lite Version * 100% Complete...";
		systemChat "A3M PMC Simulator ~ By Cody Salazar AKA TMN Fr33d0m ";
		systemChat "WARNING: THIS MISSION IS MADE FOR A DEDICATED SERVER!"; 
		systemChat "WARNING: CLIENT HOST DETECTED, PERFORMANCE MAY BE DEGRADED!"; 
		systemChat "FOR MORE INFORMATION PLEASE VISIT http://www.a3milsim.com"; 
			}; 
				
	// Handle Regular Clients
	if (!IsServer) then {
		// Set Initialization Phase to 1 (True)
		initphase = 1; 
		
		// The line below is very important for  A3M revive, The Sitting Script and the Base Animations. 
		switchMoveEverywhere = compileFinal " _this select 0 switchMove (_this select 1);";
		
		// Make Player Invincible for Spawn In 
		player allowDamage false; 
		
		// Show Black Load Screen
		titleText ["A3M PMC SIMULATOR | Lite Version *  LOADING, PLEASE WAIT..... ", "BLACK FADED",10];

		//The Line(s) Below calls all the predefines for the mission. Most of the MP Compat stuff is done via predefine 
				// Load the MP Predefines 
			_MPpreDef = execVM "scripts\MP_Predef.sqf";
			waitUntil {scriptDone _MPpreDef};
			
		// Load the Common Predefines OLD METHOD, DO NOT USE!!
		//_CmnPreDef = execVM "scripts\Common_Predef.sqf";
		//waitUntil {scriptDone _CmnPreDef};
		
		// Load Mission Predefines 
	//	_MsnPreDef = ExecVM "scripts\Mission_Predef.sqf";
		// waitUntil {scriptDone _MsnPreDef};
		
		// Initiate Bank Account
		[] call A3M_Fnc_InitBank; 
		

		// Server Executes Base Animations for all players, JIP players too via BIS_Fnc_MP
	// Line exists in this function to support client hosted games		
		
		titleText ["A3M PMC SIMULATOR | Lite Version *  LOADING, PLEASE WAIT..... ",  "BLACK FADED",1];
		
		// The intro wont work without this sleep, for some reason. 
		sleep 1; 
		//The line below plays the intro text at spawn in. 
		execVM "scripts\intro.sqf";
	
		waitUntil {player == player}; 

		[player] execVM "Scripts\PMCBasic.sqf"; 

				//the line below starts the briefing
				execVM "scripts\briefing.sqf";
				
		//  Detention Center Predefines (Suspended until it is more usable, right now is terrible. Uncomment to use anyway, will allow locking doors and using 1 way mirror room in C-12 jail)
		// execVM "scripts\Detention.sqf"; 
		
		// the line below starts the JIP Tasker. 
		_JIPTasker = execVM "scripts\initask.sqf"; 
		waitUntil {scriptDone _JIPTasker};
		
		// Some invincible time, to allow player to avoid troll killing.  
		sleep 30; 
		
		// Shield removed. Player is now vulnerable. 
		player allowDamage true; 
		
		initphase = 0; 

		systemChat "Loading Phase * A3M PMC Simulator * 100% Complete...";
		systemChat "                                                         "; 
		systemChat "A3M PMC Simulator ~ By Cody Salazar AKA TMN Fr33d0m ";
		systemChat "                                                        "; 
		systemChat "             http://www.a3milsim.com                "; 
		};
}; 
