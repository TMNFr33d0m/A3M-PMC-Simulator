// Military Police HQ Predefines (Door locks, mostly) 

Add_MPPowers = {
MPAction1 = Player addAction ["Lock Observation Room", {["","DRI_MPHQ_LockObsRoom",True,False] spawn BIS_fnc_MP; } ]; 
MPAction2 = Player addAction ["Unlock Observation Room", {["","DRI_MPQH_UnlockObsRoom",True,False] spawn BIS_fnc_MP;} ]; 
MPAction3 = Player addAction ["Lock MP Armory", {["","DRI_MPHQ_LockMPArmory",True,False] spawn BIS_fnc_MP; } ]; 
MPAction4 = Player addAction ["Unlock MP Armory", {["","DRI_MPHQ_UnlockMPArmory",True,False] spawn BIS_fnc_MP;} ]; 
MPAction5 = Player addAction ["Lock Holding Cell A", {["","DRI_MPHQ_LockCellA",True,False] spawn BIS_fnc_MP; } ]; 
MPAction6 = Player addAction ["Unlock Holding Cell A", {["","DRI_MPHQ_UnlockCellA",True,False] spawn BIS_fnc_MP;} ]; 
MPAction7 = Player addAction ["Lock Holding Cell B", {["","DRI_MPHQ_LockCellB",True,False] spawn BIS_fnc_MP; } ]; 
MPAction8 = Player addAction ["Unlock Holding Cell B", {["","DRI_MPHQ_UnlockCellB",True,False] spawn BIS_fnc_MP;} ]; 
MPAction9 = Player addAction ["Lock Holding Cell C", {["","DRI_MPHQ_LockCellC",True,False] spawn BIS_fnc_MP; } ]; 
MPAction10 = Player addAction ["Unlock Holding Cell C", {["","DRI_MPHQ_UnlockCellC",True,False] spawn BIS_fnc_MP;} ]; 
}; 

Remove_MPPowers = {
Player RemoveAction MPAction1; 
Player RemoveAction MPAction2;
Player RemoveAction MPAction3;
Player RemoveAction MPAction4;
Player RemoveAction MPAction5;
Player RemoveAction MPAction6;
Player RemoveAction MPAction7;
Player RemoveAction MPAction8;
Player RemoveAction MPAction9;
Player RemoveAction MPAction10;
}; 

DRI_MPHQ_LockCellA = {
MP_HQ =  [0,0,0] nearestObject 1779021;
MP_HQ setVariable ["bis_disabled_Door_5", 1];
}; 

DRI_MPHQ_UnlockCellA = {
MP_HQ =  [0,0,0] nearestObject 1779021;
MP_HQ setVariable ["bis_disabled_door_5", 0];
}; 

DRI_MPHQ_LockObsRoom = {
MP_HQ =  [0,0,0] nearestObject 1779021;
MP_HQ setVariable ["bis_disabled_Door_4", 1];
}; 

DRI_MPQH_UnlockObsRoom = {
MP_HQ =  [0,0,0] nearestObject 1779021;
MP_HQ setVariable ["bis_disabled_Door_4", 0];
}; 

DRI_MPHQ_LockMPArmory = {
MP_HQ =  [0,0,0] nearestObject 1779021;
MP_HQ setVariable ["bis_disabled_Door_6", 1];
}; 

DRI_MPHQ_UnlockMPArmory = {
MP_HQ =  [0,0,0] nearestObject 1779021;
MP_HQ setVariable ["bis_disabled_Door_6", 1];
}; 


DRI_MPHQ_LockCellB = {
MP_HQ =  [0,0,0] nearestObject 1779021;
MP_HQ setVariable ["bis_disabled_Door_7", 1];
}; 

DRI_MPHQ_UnlockCellB= {
MP_HQ =  [0,0,0] nearestObject 1779021;
MP_HQ setVariable ["bis_disabled_Door_7", 1];
}; 

DRI_MPHQ_LockCellC = {
MP_HQ =  [0,0,0] nearestObject 1779021;
MP_HQ setVariable ["bis_disabled_Door_8", 1];
}; 

DRI_MPHQ_UnlockCellC = {
MP_HQ =  [0,0,0] nearestObject 1779021;
MP_HQ setVariable ["bis_disabled_Door_8", 1];
}; 

