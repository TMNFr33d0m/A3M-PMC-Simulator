/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/    

JIP Tasking Framework V 2.0 by Cody Salazar AKA Fr33d0m 
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

And last, but definitely not least, the A3 community, who through over 250+ encouraging messages highly encouraged me to continue this project. I'm glad you like it, 
and I hope you enjoy the things I have in the works! 

################################## LET US BEGIN #################################### */


hint "A3M JIP Manager is working....";
sleep 3.0; 
switch (missionStatus) do 
{
	case "M0": {
CO1 = player createSimpleTask ["Report to briefing area."]; 
CO1 setSimpleTaskDescription ["Report to briefing area","Report","Briefing Area"]; 
CO1 setSimpleTaskDestination (getPos Laptop1);
CO1 setTaskState "Created";
player setCurrentTask CO1;
	};
	
	case "M1": {
VIPEscort=player createSimpleTask ["Escort VIP"]; 
VIPEscort SetSimpleTaskDescription ["Escort the Astral Corp to his Destination. Protect him at all costs.", "Escort VIP", "VIP's Destination"];
VIPEscort SetSimpleTaskDestination (getMarkerPos PublicDestination);
VIPEscort setTaskState "Assigned"; 
player setCurrentTask VIPEscort; 
playMusic "Assigned";
hint "A VIP Escort Mission is in progress. Contact your Team Coordinator for instructions.";
	};
		
	case "M2": {
DELEscort=player createSimpleTask ["Deliver Supplies Truck to Destination"]; 
DELEscort SetSimpleTaskDescription ["Escort the Astral Corp Supplies to their Destination. Protect them at all costs.", "Deliver Supplies Truck", " Supplies Destination"];
DELEscort SetSimpleTaskDestination (getMarkerPos PubDelDestination);
DELEscort setTaskState "Assigned"; 
player setCurrentTask DELEscort; 
playMusic "Assigned";
hint "A Delivery / Convoy mission is in progress. Contact your Team Coordinator for instructions.";
		};
		
	case "M3": {
RBduty=player createSimpleTask ["Checkpoint Duty"]; 
RBduty SetSimpleTaskDescription ["Stand at the checkpoint and perform stop and search checkpoint duties with the authority of the Altian Armed Forces.", "Checkpoint Duty", " Checkpoint C-12N"];
RBduty SetSimpleTaskDestination (getMarkerPos "RBC");
RBduty setTaskState "Assigned"; 
player setCurrentTask RBduty; 
playMusic "Assigned";
hint "Checkpoint Duty at Checkpoint C-12 North is in progress. Contact your teem coordinator for instructions.";
		};
	
 Case "M4": {
SARMission=player createSimpleTask ["Locate and Extract kidnapped Astral Corp Executive."]; 
SARMission SetSimpleTaskDescription ["An Astral Corporation executive has been confirmed capture by a high tech anti-pharmaceutical extremist faction. We've been contrated to bring him back to our compound alive. ", "Snatch and Extract", " Last Known Location"];
SARMission SetSimpleTaskDestination (getMarkerPos PublicLoc);
SARMission setTaskState "Assigned"; 
player setCurrentTask SARMission; 
playMusic "Assigned";
hint "A rescue mission is currently underway. Contact your teem coordinator for instructions.";
	
	};
	
	 Case "M5": {
A3MRaid1=player createSimpleTask ["Move to the Enemy Terrorist Compound and eliminate the enemy forces."]; 
A3MRaid1 SetSimpleTaskDescription ["The Altian Government requests assistance in dealing with a foreign terrorist cell that has taken over a compound. The Altian Government cannot risk an international incident by stepping in, but the Altian police forces are unprepared and ill equipped to handle this situation. OPSG is hereby contracted to eliminate all terror cells operating in Altis. ", "Eliminate Terror Cell", "Terrorist Compound"];
A3MRaid1 SetSimpleTaskDestination (getMarkerPos "sg1");
A3MRaid1 setTaskState "Assigned"; 
player setCurrentTask A3MRaid1; 
playMusic "Assigned";
hint "A raid mission is in progress. Contact your team coordinator for instructions.";
	
	};
	
	Case "M6": {
A3MRaid2=player createSimpleTask ["Move to the Enemy Terrorist City and eliminate the enemy forces."]; 
A3MRaid2 SetSimpleTaskDescription ["The Altian Government requests assistance in dealing with a foreign terrorist cell that has taken over an entire city. The Altian Government cannot risk an international incident by stepping in, but the Altian police forces are unprepared and ill equipped to handle this situation. OPSG is hereby contracted to eliminate all terror cells operating in Altis. ", "Eliminate Terror Cell", "Terrorist City"];
A3MRaid2 SetSimpleTaskDestination (getMarkerPos "sg2");
A3MRaid2 setTaskState "Assigned"; 
player setCurrentTask A3MRaid2; 
playMusic "Assigned";
hint "A raid mission is in progress. Contact your team coordinator for instructions.";
	
	};
	
	case "M7": {
	if (NSARpt2 == 0) then {
	NSARTask=player createSimpleTask ["Assist the stranded NATO forces."]; 
	NSARTask SetSimpleTaskDescription ["A distress call from a NATO unit in the mountains was received by an AAF telecommunications center. The message attached indicated that the unit is currently combat ineffective and awaiting an extraction that failed. The United States has contracted OPSG to insert and assist the NATO operatives in their extract.  ", "Assist NATO Operatives", "NATO Operatives"];
	NSARTask SetSimpleTaskDestination (getMarkerPos NSARPickedNo);
	NSARTask setTaskState "Assigned"; 
	player setCurrentTask NSARTask; 
	playMusic "Assigned";
	hint "An extraction support mission is currently underway, and your team is currently in a big hurry to get to the stranded team in the field. Contact your Team Coordinator for orders."; } 
	else {
	NSARTask=player createSimpleTask ["Escort NATO forces to their Extraction Point."]; 
	NSARTask SetSimpleTaskDescription ["You have located the straded NATO forces. Escort them to as they egress to their destination. These are soldiers, and they will fight, but you're being paid to make sure they make it safe! Stay sharp! ", "Assist NATO Operatives", "NATO Extract"];
	NSARTask SetSimpleTaskDestination (getMarkerPos NSARDestNo);
	NSARTask setTaskState "Assigned"; 
	player setCurrentTask NSARTask; 
	playMusic "Assigned";
	hint "An extraction support mission is currently underway, and your team is currently in egressing to the objective with the NATO team. Contact your Team Coordinator for orders.";
	}; 
	
	}; 
	
	case "M8" : {
T9Task=player createSimpleTask ["T9 Premise Security Shift"]; 
T9Task SetSimpleTaskDescription ["The T9 Facility is a highly classified facility operated by Astral Corp by contract of the United States Air Force.  ", "Perform Security Detail at T9 Facility", "T9 Facility"];
T9Task SetSimpleTaskDestination (getMarkerPos T9);
T9Task setTaskState "Assigned"; 
player setCurrentTask T9Task; 
playMusic "Assigned";
hint "A security force is currently working a shift at the T9 facility. Contact your team coordinator for information and possible assignment on this objective.";
	}; 
	
	
	default
	{
        hint "Something went horribly wrong. Could not assign JIP task";
    };

	}; 
	