
/*

  /$$$$$$   /$$$$$$  /$$      /$$       /$$$$$$$  /$$      /$$  /$$$$$$         /$$$$$$  /$$                         /$$             /$$                        
 /$$__  $$ /$$__  $$| $$$    /$$$      | $$__  $$| $$$    /$$$ /$$__  $$       /$$__  $$|__/                        | $$            | $$                        
| $$  \ $$|__/  \ $$| $$$$  /$$$$      | $$  \ $$| $$$$  /$$$$| $$  \__/      | $$  \__/ /$$ /$$$$$$/$$$$  /$$   /$$| $$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ 
| $$$$$$$$   /$$$$$/| $$ $$/$$ $$      | $$$$$$$/| $$ $$/$$ $$| $$            |  $$$$$$ | $$| $$_  $$_  $$| $$  | $$| $$ |____  $$|_  $$_/   /$$__  $$ /$$__  $$
| $$__  $$  |___  $$| $$  $$$| $$      | $$____/ | $$  $$$| $$| $$             \____  $$| $$| $$ \ $$ \ $$| $$  | $$| $$  /$$$$$$$  | $$    | $$  \ $$| $$  \__/
| $$  | $$ /$$  \ $$| $$\  $ | $$      | $$      | $$\  $ | $$| $$    $$       /$$  \ $$| $$| $$ | $$ | $$| $$  | $$| $$ /$$__  $$  | $$ /$$| $$  | $$| $$      
| $$  | $$|  $$$$$$/| $$ \/  | $$      | $$      | $$ \/  | $$|  $$$$$$/      |  $$$$$$/| $$| $$ | $$ | $$|  $$$$$$/| $$|  $$$$$$$  |  $$$$/|  $$$$$$/| $$      
|__/  |__/ \______/ |__/     |__/      |__/      |__/     |__/ \______/        \______/ |__/|__/ |__/ |__/ \______/ |__/ \_______/   \___/   \______/ |__/    

 Fleet Management Module V 3.0 by Cody Salazar AKA Fr33d0m 
 www.A3MilSim.com
 
Last Modified: 4/15/2015

License:
You can do whatever you were going to do anyway. Just give me the credit i'm due, and don't outright steal my shit and call it your own. If I find it, I'll be pissed. 
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

###################
 Rank ###### Rating
###################

PRIVATE   0
CORPORAL  50
SERGEANT 150
LIEUTENANT 250
CAPTAIN 350
MAJOR 500
COLONEL 750

################################## LET US BEGIN #################################### */

//Addon Options - Enabled By Default? 1 = Yes, 0 = No. 
RHS_Support_Enabled = 0;
/////////////////////////////////////////////////////////////////////////////////////
//Initial Budget for Side - Change in ParamsArray! 
B_initialbudget= paramsArray select 1;
//Rating to Purchase Values 
B_vaslimit= 0;
B_Mlimit= 3500;
B_Llimit= 5500;

// Big Ticket Item Rank (Expensive Shit Locked to a rank)
B_maxrank ="MAJOR";

// Pre-Define Add-on Suport to Off Position 
RHS_Support_Enabled = 0;
Ace3_Enabled = 0;
Apex_Enabled = 0;
Iowa_Enabled = 0;
SMA_Enabled = 0;
HLC_Enabled = 0;

//////////////////////////////////////////////////////////////////////////////////////
//Monetary Costs of Things:
//////////////////////////////////////////////////////////////////////////////////////

//A3 Stock Wheeled
B_MRAP_01_F=470000;
B_MRAP_01_hmg_F=500000;
B_MRAP_01_gmg_F=520000;
B_Truck_01_covered_F=125000;
B_Truck_01_transport_F=90000;
B_Quadbike_01_F=7500;
O_MRAP_02_F=470000;
O_MRAP_02_hmg_F=500000;
O_MRAP_02_gmg_F=520000;
O_Truck_02_covered_F=125000;
O_Truck_02_transport_F=90000;

// RHS Russian Wheeled
rhs_tigr_msv =75500;
rhs_gaz66_msv=125500;
rhs_gaz66o_msv= 125500;
rhs_gaz66_r142_msv= 125500;
rhs_gaz66_ap2_msv = 125500;
rhs_gaz66_repair_msv= 125500;
rhs_typhoon_vdv= 75000;
rhs_uaz_msv= 15500;
rhs_ural_msv= 73500;
rhs_ural_open_msv= 78000;

// RHS US Wheeled
rhsusf_m1025_w= 74969;
rhsusf_m1025_d= 74969;
rhsusf_m1025_w_s= 75969;
rhsusf_m1025_w_s= 75969;
rhsusf_m1025_w_m2= 84969;
rhsusf_m1025_d_m2= 84969;
rhsusf_m1025_w_s_m2= 85969;
rhsusf_m1025_d_s_m2= 85969;
rhsusf_M1078A1P2_wd_fmtv_usarmy= 200000;
rhsusf_M1078A1P2_wd_open_fmtv_usarmy= 200000;
rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy= 200000;
rhsusf_M1078A1P2_B_wd_fmtv_usarmy= 200500;
rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy= 200500;
rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy= 200500;
rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy=0;
rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy= 0;
rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy= 0;
rhsusf_M1083A1P2_wd_fmtv_usarmy_10= 200000;
rhsusf_M1083A1P2_wd_open_fmtv_usarmy_10= 200000;
rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy_10= 200000;
rhsusf_M1083A1P2_B_wd_fmtv_usarmy_10= 200500;
rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy_10= 200500;
rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy_10= 200500;
rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy_10= 0;
rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy_10= 0;
rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy_10= 0;
rhsusf_m998_w_4dr= 61665;
rhsusf_m998_d_4dr= 61665;
rhsusf_m998_w_4dr_halftop= 63665;
rhsusf_m998_d_4dr_halftop= 63665;
rhsusf_m998_w_4dr_fulltop= 65665;
rhsusf_m998_d_4dr_fulltop= 65665;
rhsusf_m998_w_s_2dr= 61665;
rhsusf_m998_d_s_2dr=61665;
rhsusf_m998_w_s_2dr_halftop=63665;
rhsusf_m998_d_s_2dr_halftop=63665;
rhsusf_m998_w_s_2dr_fulltop=65665;
rhsusf_m998_d_s_2dr_fulltop=65665;
rhsusf_m998_w_s_4dr=61665;
rhsusf_m998_d_s_4dr= 61665;
rhsusf_m998_w_s_4dr_halftop=63665;
rhsusf_m998_d_s_4dr_halftop=63665;
rhsusf_m998_w_s_4dr_fulltop=65665;
rhsusf_m998_d_s_4dr_fulltop=65665;
rhsusf_rg33_wd=460000;
rhsusf_rg33_m2_wd=475000;
rhsusf_rg33_usmc_wd=460000;
rhsusf_rg33_m2_usmc_wd=475000;
rhsusf_rg33_d=460000;
rhsusf_rg33_m2_d=475000;
rhsusf_rg33_usmc_d=460000;
rhsusf_rg33_m2_usmc_d=475000;

//A3 Stock Armor
B_MBT_01_cannon_F=6000000;
B_MBT_01_mlrs_F=2410000;
B_APC_Wheeled_01_cannon_F=3157500;
B_APC_Tracked_01_rcws_F=3000000;
B_APC_Tracked_01_AA_F=3800000;
O_MBT_02_cannon_F=6000000;
O_MBT_02_arty_F=2410000;
O_APC_Tracked_02_cannon_F=3157500;
O_APC_Wheeled_02_rcws_F=3000000;
O_APC_Tracked_02_AA_F=3800000;

// RHS: Escalation USA Armor
rhsusf_m109_usarmy_10=0;
rhsusf_m109d_usarmy_10=0;
rhsusf_m109_usarmy=1200000;
rhsusf_m109d_usarmy=1200000;
rhsusf_m113_usarmy=1600000;
rhsusf_m113d_usarmy=1600000;
rhsusf_m1a1aimwd_usarmy=8580000;
rhsusf_m1a1aim_tuski_wd=8950000;
rhsusf_m1a1fep_wd=9110000;
rhsusf_m1a1fep_od=9110000;
rhsusf_m1a1aimd_usarmy=8580000;
rhsusf_m1a1aim_tuski_d=8950000;
rhsusf_m1a1fep_d=9110000;
rhsusf_m1a2sep1wd_usarmy=9157500;
rhsusf_m1a2sep1tuskiwd_usarmy=8600000;
rhsusf_m1a2sep1d_usarmy=9000000;
rhsusf_m1a2sep1tuskid_usarmy=9250000;
rhs_m2a2_wd=3166000;
rhs_m2a2_buski_wd=3500000;
rhs_m2a2=3166000;
rhs_m2a2_buski=3500000;
RHS_M2A3_wd=3566000;
RHS_M2A3_BUSKI_wd=4000000;
RHS_M2A3_BUSKIII_wd=4500000;
RHS_M2A3=3566000;
RHS_M2A3_BUSKI=4000000;
RHS_M2A3_BUSKIII=4500000;
rhs_m6_wd_10=0;
rhs_m6_wd=4200000;
rhs_m6_10=0;
rhs_m6=0;

// RHS: Escalation RUS Armor
rhs_sprut_vdv=945000;
rhs_2s3_tv=4300500;
RHS_BM21_MSV_01=7580000;
rhs_bmd1=1350000;
rhs_bmd1k=1375000;
rhs_bmd1p=1450000;
rhs_bmd1pk=1525000;
rhs_bmd1r=1450000;
rhs_bmd2=1575000;
rhs_bmd2k=1850000;
rhs_bmd2m=1875000;
rhs_bmd4_vdv=2210000;
rhs_bmd4m_vdv=2225000;
rhs_bmd4ma_vdv=2275000;
rhs_bmp1_VDV=2500000;
rhs_bmp1p_VDV=2575000;
rhs_bmp1k_VDV=2625000;
rhs_bmp1d_VDV=2650000;
rhs_bmp2e_VDV=2655000;
rhs_bmp2_VDV=2675000;
rhs_bmp2k_VDV=2710000;
rhs_bmp2d_VDV=2745000;
rhs_brm1k_msv=2847650;
rhs_btr60_msv=2500000;
rhs_btr70_msv=2750000;
rhs_btr80_msv=3000000;
rhs_btr80a_msv=3110000;
rhs_prp3_msv=1525375;
rhs_t72ba_tv=4250000;
rhs_t72bb_tv=4550000;
rhs_t72bc_tv=4725000;
rhs_t72bd_tv=7850000;
rhs_t80=6250450;
rhs_t80a=6300500;
rhs_t80b=6400000;
rhs_t80bk=6410000;
rhs_t80bv=6450000;
rhs_t80bvk=6500000;
rhs_t80u=6525000;
rhs_t80ue1=6550000;
rhs_t80u45m=6575000;
rhs_t80um=6600000;
rhs_zsu234_aa=6500000;

//Stock A3 - Rotary Aircraft 
B_Heli_Attack_01_F=35700000;
B_Heli_Transport_01_F=30500000;
B_Heli_Light_01_armed_F=2300000;
B_Heli_Light_01_F=2000000;
O_Heli_Light_02_unarmed_F=14300000;
O_Heli_Light_02_F=16800000;
O_Heli_Attack_02_F=21300000;
O_Heli_Attack_02_black_F=23000000;

// RHS: Escalation - USA Rotary Aircraft 
RHS_AH1Z= 27550000;
RHS_AH1Z_GS= 27157500;
RHS_AH1Z_CS= 27350000;
rhs_ah1z_wd = 31550000;
rhs_ah1z_wd_gs= 31157500;
rhs_ah1z_wd_cs = 31350000;
RHS_AH64DGrey= 65325950;
rhs_ah64d_wd = 35950000;
rhs_ah64d_wd_gs = 35725950;
rhs_ah64d_wd_cs = 35695500;
RHS_AH64D_wd_AA= 35725950;
rhs_ch_47f_10 = 38550000;
rhs_ch_47f_light_10 = 38550000;
rhs_ch_47f = 38550000;
rhs_ch_47f_light = 38550000;
rhs_uh1y = 21600000;
rhs_uh1y_ffar = 21600000;
rhs_uh1y_unarmed = 21600000;
rhs_uh60m = 21300000;
rhs_uh60m_mev2 = 21300000;
rhs_uh60m_mev = 21300000;


// RHS: Escalation - RUS Rotary Aircraft
RHS_Ka52_vvs=16000000;
RHS_Ka52_vvsc=16000000;
rhs_ka60_grey=21575000;
rhs_ka60_c =21575000;
RHS_Mi24P_vdv =12000000;
RHS_Mi24V_vdv =12000000;
RHS_Mi24P_vvs =12000000;
RHS_Mi24V_vvs =12000000;
RHS_Mi24P_vvsc =12000000;
RHS_Mi24V_vvsc =12000000;
RHS_Mi8AMT_vdv =9000000;
RHS_Mi8AMTSh_vdv =9350000;
RHS_Mi8AMT_vvs =9000000;
RHS_Mi8AMTSh_vvs =9350000;
RHS_Mi8AMT_vvsc =9000000;
RHS_Mi8AMTSh_vvsc=9350000;
RHS_Mi8mt_vdv =9000000;
RHS_Mi8MTV3_vdv=9350000;
RHS_Mi8mt_vvs =9000000;
RHS_Mi8MTV3_vvs=9350000;
RHS_Mi8mt_vvsc=9000000;
RHS_Mi8MTV3_vvsc=9350000;

//Stock A3 - Fixed Wing Aircraft
B_Plane_CAS_01_F=11800000;
O_Plane_CAS_02_F=11000000;

// RHS: Escalation - RUS / US Aircraft
RHS_Su25SM_vvs=11000000;
RHS_Su25SM_vvsc=11000000;
rhs_a10=11800000;
RHS_C130J=70370000;

// Autonomous / Robotic 
B_UAV_01_F=	369;
B_UGV_01_F=	3210526;
B_UGV_01_rcws_F= 3225550;
B_UAV_02_F=	16900000;
B_UAV_02_CAS_F=	17300000;
UAV_Drakon=	15750000;
rq11_zerlegt=232000;
rq11b_zerlegt=232000;
rq11_camera=8400;
rq11b_camera=8400;


// Personnel and Maritime / Motor Support 
					
B_Truck_01_fuel_F=	1200000;		// HEMTT Fuel Truck 
Box_NATO_Ammo_F=6720;		// Basic Ammo (NATO) 
Box_NATO_Wps_F=	91800;		// Basic Weapons (NATO) 
B_Boat_Armed_01_minigun_F=	1275000;		//Patrol Boat w/ Minigun 
B_Boat_Transport_01_F=	1275;		//RHIB Boat 
B_SDV_01_F=	1200000;		//SDV (NATO) 	

ACE_Wheel=525;		//Spare Tire
ACE_Track=175;		//Spare Track
ACE_Box_Ammo=392378;		//Office Supply Crate 
ACE_medicalSupplyCrate_advanced=9895;		//Medical Supply Crate
ACE_Item_Sandbag_empty=	1;		//Empty Sandbag

USS_Iowa_Battleship=100000000; //Iowa-class battleship (U.S. Navy) 

SMA_Weapon_Box=2185995;		// 120 Assorted Weapons, Ammo, Accessories

HLC_MP5_ammobox=6340000;		// 180 HK MP5 Submachineguns, Accessories, Ammo

rhs_weapon_crate=2106000;		// 330 Assorted Russian Weapons / Ammunition 
rhsusf_weapon_crate=6900000;		// 460  Assorted U.S. Weapons / Ammunition




// Base Upgrades, Safehouse Upgrades




if (isNil"_MATV") then {_MATV ="";};
//////////////////////////////////////////////////////////////////////////////////////////////////
//Initial Budget Creator
////////////////////////////////////////////////////////////////////////////////////////////////
if (isnil"B_defensebudget") then {
B_defensebudget= B_initialbudget;
publicVariable"B_defensebudget";
};
if (isnil"B_totalcost") then {
B_totalcost= 0;
publicVariable"B_totalcost";
};

///////////////////////////////////////////////////////////////////////////////////////////
// Open Dialog
_handle= CreateDialog"A3M_store";

///////////////////////////////////////////////////////////////////////////////////////////
//Update Budget Balance in GUI
DoBudget = {
disableSerialization;
//Get the dialog display (a viewport)
_Bdisplay = findDisplay 420;
if (str (_Bdisplay) !="no display") then
{
_ChildControl = _Bdisplay displayCtrl 1170;
//Change It
form_B_defensebudget= [B_defensebudget] call A3M_handle_number;
_ChildControl ctrlSetStructuredText parseText format ["$%1", form_B_defensebudget];

// Send Current Budget to ALiVE Server
["", "ALiVEBudgetPush", false, false, false] call bis_fnc_MP; 

};
};
[] call DoBudget;
///////////////////////////////////////////////////////////////////////////////////////////
//Update Total Balance in GUI
DoTotal = {
disableSerialization;
//Get the dialog display (a viewport)
_BTdisplay = findDisplay 420;
if (str (_BTdisplay) !="no display") then
{
_ChildControl2 = _BTdisplay displayCtrl 1171;
//Change It
form_B_totalcost= [B_totalcost] call A3M_handle_number;
_ChildControl2 ctrlSetStructuredText parseText format ["$%1", form_B_totalcost];
};
};
[] call DoTotal; 
//////////////////////////////////////////////////////////////////////////////////////////
//Show Current Rank in GUI
DoRankChk = {
disableSerialization;
//Get the dialog display (a viewport)
_BRdisplay = findDisplay 420;
if (str (_BRdisplay) !="no display") then
{
_ChildControl3 = _BRdisplay displayCtrl 1172;
//Change It
_prank = rank player;
_Pnum = rating player;
_ChildControl3 ctrlSetStructuredText parseText format ["Rank is %1<br />Rating is %2", _prank, _Pnum];
};
};
[] call DoRankChk;
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Supported Modifications:
_indexSM0= lbAdd [2175,"Stock A3"];
_indexSM1= lbAdd [2175,"RHS: Escalation"];
_indexSM2= lbAdd [2175,"Ace 3"];
_indexSM3= lbAdd [2175,"Apex Drakon"];
_indexSM4= lbAdd [2175,"USS Iowa"];
_indexSM5= lbAdd [2175,"Specialist Military Arms"];
_indexSM6= lbAdd [2175,"HLC / Toadie2k"];

// End Supported Mods.
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//Add Wheeled Vehicles to Main List
DoAddWheel = {
wheelson = 1;
wingson = 0;
helion = 0;
armoredon = 0;
RoboticsOn = 0; 
SupportOn = 0; 
UpgradesOn = 0; 
lbClear 1575;
_index0 =   lbAdd   [1575,"MAT-V Unarmed Vehicle                                                    Price:   $470,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "B_MRAP_01_F">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
_index1 =   lbAdd   [1575,"MAT-V Armed (.50 HMG)                                                    Price:   $500,000.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "B_MRAP_01_hmg_F">> "picture"); lbSetPicture    [1575, 1    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];
_index2 =   lbAdd   [1575,"MAT-V Armed (40mm GMG)                                                   Price:   $520,000.00"]; _Pic3= getText( configFile  >> "CfgVehicles">> "B_MRAP_01_gmg_F">> "picture"); lbSetPicture    [1575, 2    , _Pic3   ];  lbSetPictureColor   [1575, 2 ,[0.738,0.714,0.417,1 ]];
_index3 =   lbAdd   [1575,"HEMTT Troop Transport - Covered                                          Price:   $125,000.00"]; _Pic4= getText( configFile  >> "CfgVehicles">> "B_Truck_01_covered_F">> "picture");    lbSetPicture    [1575, 3    , _Pic4   ];  lbSetPictureColor   [1575, 3 ,[0.738,0.714,0.417,1 ]];
_index4 =   lbAdd   [1575,"HEMTT Troop Transport - Open                                             Price:    $90,000.00"]; _Pic5= getText( configFile  >> "CfgVehicles">> "B_Truck_01_transport_F">> "picture");  lbSetPicture    [1575, 4    , _Pic5   ];  lbSetPictureColor   [1575, 4 ,[0.738,0.714,0.417,1 ]];
_index5 =   lbAdd   [1575,"ATV                                                                      Price:     $7,500.00"]; _Pic6= getText( configFile  >> "CfgVehicles">> "B_Quadbike_01_F">> "picture"); lbSetPicture    [1575, 5    , _Pic6   ];  lbSetPictureColor   [1575, 5,[0.738,0.714,0.417,1 ]];
_index6 =   lbAdd   [1575,"Ifrit Unarmed Vehicle                                                    Price:   $470,000.00"]; _Pic7= getText( configFile  >> "CfgVehicles">> "O_MRAP_02_F">> "picture"); lbSetPicture    [1575, 6    , _Pic7   ];  lbSetPictureColor   [1575, 6 ,[0.738,0.714,0.417,1 ]];
_index7 =   lbAdd   [1575,"Ifrit Armed (.50 HMG)                                                    Price:   $500,000.00"]; _Pic8= getText( configFile  >> "CfgVehicles">> "O_MRAP_02_hmg_F">> "picture"); lbSetPicture    [1575, 7    , _Pic8   ];  lbSetPictureColor   [1575, 7 ,[0.738,0.714,0.417,1 ]];
_index8 =   lbAdd   [1575,"Ifrit Armed (40mm GMG)                                                   Price:   $520,000.00"]; _Pic9= getText( configFile  >> "CfgVehicles">> "O_MRAP_02_gmg_F">> "picture"); lbSetPicture    [1575, 8    , _Pic9   ];  lbSetPictureColor   [1575, 8 ,[0.738,0.714,0.417,1 ]];
_index9 =   lbAdd   [1575,"Zamak Troop Transport - Covered                                          Price:   $125,000.00"]; _Pic10= getText( configFile  >> "CfgVehicles">> "O_Truck_02_covered_F">> "picture");    lbSetPicture    [1575, 9    , _Pic10  ];  lbSetPictureColor   [1575, 9 ,[0.738,0.714,0.417,1 ]];
_index10 =  lbAdd   [1575,"Zamak Troop Transport - Open                                             Price:    $90,000.00"]; _Pic11= getText( configFile  >> "CfgVehicles">> "O_Truck_02_transport_F">> "picture");  lbSetPicture    [1575, 10   , _Pic11  ];  lbSetPictureColor   [1575, 10,[0.738,0.714,0.417,1 ]];

if (RHS_Support_Enabled == 1) then {

_index11 =lbAdd   [1575,"Gaz 233011 Tigr                                                      Price:    $75,500.00"]; _Pic12= getText( configFile  >> "CfgVehicles">> "rhs_tigr_msv">> "picture");   lbSetPicture    [1575, 11   , _Pic12  ];  lbSetPictureColor   [1575, 11,[0.738,0.714,0.417,1 ]];
_index12 =lbAdd   [1575,"GAZ-66                                                               Price:   $125,500.00"]; _Pic13= getText( configFile  >> "CfgVehicles">> "rhs_gaz66_msv">> "picture");  lbSetPicture    [1575, 12   , _Pic13  ];  lbSetPictureColor   [1575, 12,[0.738,0.714,0.417,1 ]];
_index13 =lbAdd   [1575,"GAZ-66 (Open)                                                        Price:   $125,500.00"]; _Pic14= getText( configFile  >> "CfgVehicles">> "rhs_gaz66o_msv">> "picture"); lbSetPicture    [1575, 13   , _Pic14  ];  lbSetPictureColor   [1575, 13,[0.738,0.714,0.417,1 ]];
_index14 =lbAdd   [1575,"GAZ-66 (R-142N)                                                      Price:   $125,500.00"]; _Pic15= getText( configFile  >> "CfgVehicles">> "rhs_gaz66_r142_msv">> "picture");  lbSetPicture    [1575, 14   , _Pic15  ];  lbSetPictureColor   [1575, 14,[0.738,0.714,0.417,1 ]];
_index15 =lbAdd   [1575,"GAZ-66 (AP-2)                                                        Price:   $125,500.00"]; _Pic16= getText( configFile  >> "CfgVehicles">> "rhs_gaz66_ap2_msv">> "picture");  lbSetPicture    [1575, 15   , _Pic16  ];  lbSetPictureColor   [1575, 15,[0.738,0.714,0.417,1 ]];
_index16 =lbAdd   [1575,"GAZ-66 (ESB-8IM)                                                     Price:   $125,500.00"]; _Pic17= getText( configFile  >> "CfgVehicles">> "rhs_gaz66_repair_msv">> "picture");    lbSetPicture    [1575, 16   , _Pic17  ];  lbSetPictureColor   [1575, 16,[0.738,0.714,0.417,1 ]];
_index17 =lbAdd   [1575,"Kamaz-63968                                                          Price:    $75,000.00"]; _Pic18= getText( configFile  >> "CfgVehicles">> "rhs_typhoon_vdv">> "picture"); lbSetPicture    [1575, 17   , _Pic18  ];  lbSetPictureColor   [1575, 17,[0.738,0.714,0.417,1 ]];
_index18 =lbAdd   [1575,"UAZ-469                                                              Price:    $15,500.00"]; _Pic19= getText( configFile  >> "CfgVehicles">> "rhs_uaz_vdv">> "picture"); lbSetPicture    [1575, 18   , _Pic19  ];  lbSetPictureColor   [1575, 18,[0.738,0.714,0.417,1 ]];
_index19 =lbAdd   [1575,"URAL-4320                                                            Price:    $73,500.00"]; _Pic20= getText( configFile  >> "CfgVehicles">> "rhs_ural_msv">> "picture");    lbSetPicture    [1575, 19   , _Pic20  ];  lbSetPictureColor   [1575, 19,[0.738,0.714,0.417,1 ]];
_index20 =lbAdd   [1575,"URAL-4320 (Open)                                                     Price:    $78,000.00"]; _Pic21= getText( configFile  >> "CfgVehicles">> "rhs_ural_open_msv">> "picture");   lbSetPicture    [1575, 20   , _Pic21  ];  lbSetPictureColor   [1575, 20,[0.738,0.714,0.417,1 ]];
_index21 =lbAdd   [1575,"USA (Army - Woodland )  M1025A2 (Unarmed)                            Price:    $74,969.00"]; _Pic22= getText( configFile  >> "CfgVehicles">> "rhsusf_m1025_w">> "picture");  lbSetPicture    [1575, 21   , _Pic22  ];  lbSetPictureColor   [1575, 21,[0.738,0.714,0.417,1 ]];
_index22 =lbAdd   [1575,"USA (Army - Desert )  M1025A2 (Unarmed)                              Price:    $74,969.00"]; _Pic23= getText( configFile  >> "CfgVehicles">> "rhsusf_m1025_d">> "picture");  lbSetPicture    [1575, 22   , _Pic23  ];  lbSetPictureColor   [1575, 22,[0.738,0.714,0.417,1 ]];
_index23 =lbAdd   [1575,"USA (USMC - Woodland )  M1025A2 (Unarmed/Snorkel)                    Price:    $75,969.00"]; _Pic24= getText( configFile  >> "CfgVehicles">> "rhsusf_m1025_w_s">> "picture");   lbSetPicture    [1575, 23   , _Pic24  ];  lbSetPictureColor   [1575, 23,[0.738,0.714,0.417,1 ]];
_index24 =lbAdd   [1575,"USA (USMC - Desert )  M1025A2 (Unarmed/Snorkel)                      Price:    $75,969.00"]; _Pic25= getText( configFile  >> "CfgVehicles">> "rhsusf_m1025_w_s">> "picture");   lbSetPicture    [1575, 24   , _Pic25  ];  lbSetPictureColor   [1575, 24,[0.738,0.714,0.417,1 ]];
_index25 =lbAdd   [1575,"USA (Army - Woodland )  M1025A2 (M2)                                 Price:    $84,969.00"]; _Pic26= getText( configFile  >> "CfgVehicles">> "rhsusf_m1025_w_m2">> "picture");   lbSetPicture    [1575, 25   , _Pic26  ];  lbSetPictureColor   [1575, 25,[0.738,0.714,0.417,1 ]];
_index26 =lbAdd   [1575,"USA (Army - Desert )  M1025A2 (M2)                                   Price:    $84,969.00"]; _Pic27= getText( configFile  >> "CfgVehicles">> "rhsusf_m1025_d_m2">> "picture");  lbSetPicture    [1575, 26   , _Pic27  ];  lbSetPictureColor   [1575, 26,[0.738,0.714,0.417,1 ]];
_index27 =lbAdd   [1575,"USA (USMC - Woodland )  M1025A2 (M2/Snorkel)                         Price:    $85,969.00"]; _Pic28= getText( configFile  >> "CfgVehicles">> "rhsusf_m1025_w_s_m2">> "picture");    lbSetPicture    [1575, 27   , _Pic28  ];  lbSetPictureColor   [1575, 27,[0.738,0.714,0.417,1 ]];
_index28 =lbAdd   [1575,"USA (USMC - Desert )  M1025A2 (M2/Snorkel)                           Price:    $85,969.00"]; _Pic29= getText( configFile  >> "CfgVehicles">> "rhsusf_m1025_d_s_m2">> "picture");    lbSetPicture    [1575, 28   , _Pic29  ];  lbSetPictureColor   [1575, 28,[0.738,0.714,0.417,1 ]];
_index29 =lbAdd   [1575,"USA (Army 2014)  M1078A1P2                                           Price:   $200,000.00"]; _Pic30= getText( configFile  >> "CfgVehicles">> "rhsusf_M1078A1P2_wd_fmtv_usarmy">> "picture");    lbSetPicture    [1575, 29   , _Pic30  ];  lbSetPictureColor   [1575, 29,[0.738,0.714,0.417,1 ]];
_index30 =lbAdd   [1575,"USA (Army 2014)  M1078A1P2 (Open)                                    Price:   $200,000.00"]; _Pic31= getText( configFile  >> "CfgVehicles">> "rhsusf_M1078A1P2_wd_open_fmtv_usarmy">> "picture");   lbSetPicture    [1575, 30   , _Pic31  ];  lbSetPictureColor   [1575, 30,[0.738,0.714,0.417,1 ]];
_index31 =lbAdd   [1575,"USA (Army 2014)  M1078A1P2 (Flatbed)                                 Price:   $200,000.00"]; _Pic32= getText( configFile  >> "CfgVehicles">> "rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy">> "picture");    lbSetPicture    [1575, 31   , _Pic32  ];  lbSetPictureColor   [1575, 31,[0.738,0.714,0.417,1 ]];
_index32 =lbAdd   [1575,"USA (Army 2014)  M1078A1P2-B                                         Price:   $200,500.00"]; _Pic33= getText( configFile  >> "CfgVehicles">> "rhsusf_M1078A1P2_B_wd_fmtv_usarmy">> "picture");   lbSetPicture    [1575, 32   , _Pic33  ];  lbSetPictureColor   [1575, 32,[0.738,0.714,0.417,1 ]];
_index33 =lbAdd   [1575,"USA (Army 2014)  M1078A1P2-B (Open)                                  Price:   $200,500.00"]; _Pic34= getText( configFile  >> "CfgVehicles">> "rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy">> "picture");  lbSetPicture    [1575, 33   , _Pic34  ];  lbSetPictureColor   [1575, 33,[0.738,0.714,0.417,1 ]];
_index34 =lbAdd   [1575,"USA (Army 2014)  M1078A1P2-B (Flatbed)                               Price:   $200,500.00"]; _Pic35= getText( configFile  >> "CfgVehicles">> "rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy">> "picture");   lbSetPicture    [1575, 34   , _Pic35  ];  lbSetPictureColor   [1575, 34,[0.738,0.714,0.417,1 ]];
_index35 =lbAdd   [1575,"USA (Army 2014)  M1078A1P2-B (M2)                                    Price:   $210,000.00"]; _Pic36= getText( configFile  >> "CfgVehicles">> "rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy">> "picture");    lbSetPicture    [1575, 35   , _Pic36  ];  lbSetPictureColor   [1575, 35,[0.738,0.714,0.417,1 ]];
_index36 =lbAdd   [1575,"USA (Army 2014)  M1078A1P2-B (M2/Open)                               Price:   $210,000.00"]; _Pic37= getText( configFile  >> "CfgVehicles">> "rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy">> "picture");  lbSetPicture    [1575, 36   , _Pic37  ];  lbSetPictureColor   [1575, 36,[0.738,0.714,0.417,1 ]];
_index37 =lbAdd   [1575,"USA (Army 2014)  M1078A1P2-B (M2/Flatbed)                            Price:   $210,000.00"]; _Pic38= getText( configFile  >> "CfgVehicles">> "rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy">> "picture");   lbSetPicture    [1575, 37   , _Pic38  ];  lbSetPictureColor   [1575, 37,[0.738,0.714,0.417,1 ]];
_index38 =lbAdd   [1575,"USA (Army 2010)  M1083A1P2                                           Price:   $200,000.00"]; _Pic39= getText( configFile  >> "CfgVehicles">> "rhsusf_M1083A1P2_wd_fmtv_usarmy_10">> "picture"); lbSetPicture    [1575, 38   , _Pic39  ];  lbSetPictureColor   [1575, 38,[0.738,0.714,0.417,1 ]];
_index39 =lbAdd   [1575,"USA (Army 2010)  M1083A1P2 (Open)                                    Price:   $200,000.00"]; _Pic40= getText( configFile  >> "CfgVehicles">> "rhsusf_M1083A1P2_wd_open_fmtv_usarmy_10">> "picture"); lbSetPicture    [1575, 39   , _Pic40  ];  lbSetPictureColor   [1575, 39,[0.738,0.714,0.417,1 ]];
_index40 =lbAdd   [1575,"USA (Army 2010)  M1083A1P2 (Flatbed)                                 Price:   $200,000.00"]; _Pic41= getText( configFile  >> "CfgVehicles">> "rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy_10">> "picture"); lbSetPicture    [1575, 40   , _Pic41  ];  lbSetPictureColor   [1575, 40,[0.738,0.714,0.417,1 ]];
_index41 =lbAdd   [1575,"USA (Army 2010)  M1083A1P2-B                                         Price:   $200,500.00"]; _Pic42= getText( configFile  >> "CfgVehicles">> "rhsusf_M1083A1P2_B_wd_fmtv_usarmy_10">> "picture");   lbSetPicture    [1575, 41   , _Pic42  ];  lbSetPictureColor   [1575, 41,[0.738,0.714,0.417,1 ]];
_index42 =lbAdd   [1575,"USA (Army 2010)  M1083A1P2-B (Open)                                  Price:   $200,500.00"]; _Pic43= getText( configFile  >> "CfgVehicles">> "rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy_10">> "picture");   lbSetPicture    [1575, 42   , _Pic43  ];  lbSetPictureColor   [1575, 42,[0.738,0.714,0.417,1 ]];
_index43 =lbAdd   [1575,"USA (Army 2010)  M1083A1P2-B (Flatbed)                               Price:   $200,500.00"]; _Pic44= getText( configFile  >> "CfgVehicles">> "rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy_10">> "picture");   lbSetPicture    [1575, 43   , _Pic44  ];  lbSetPictureColor   [1575, 43,[0.738,0.714,0.417,1 ]];
_index44 =lbAdd   [1575,"USA (Army 2010)  M1083A1P2-B (M2)                                    Price:   $210,000.00"]; _Pic45= getText( configFile  >> "CfgVehicles">> "rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy_10">> "picture"); lbSetPicture    [1575, 44   , _Pic45  ];  lbSetPictureColor   [1575, 44,[0.738,0.714,0.417,1 ]];
_index45 =lbAdd   [1575,"USA (Army 2010)  M1083A1P2-B (M2/Open)                               Price:   $210,000.00"]; _Pic46= getText( configFile  >> "CfgVehicles">> "rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy_10">> "picture");    lbSetPicture    [1575, 45   , _Pic46  ];  lbSetPictureColor   [1575, 45,[0.738,0.714,0.417,1 ]];
_index46 =lbAdd   [1575,"USA (Army 2010)  M1083A1P2-B (M2/Flatbed)                            Price:   $210,000.00"]; _Pic47= getText( configFile  >> "CfgVehicles">> "rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy_10">> "picture");    lbSetPicture    [1575, 46   , _Pic47  ];  lbSetPictureColor   [1575, 46,[0.738,0.714,0.417,1 ]];
_index47 =lbAdd   [1575,"USA (Army - Woodland )  M1097A2 , 2dr cgo open                       Price:    $61,665.00"]; _Pic48= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_w_4dr">> "picture");  lbSetPicture    [1575, 47   , _Pic48  ];  lbSetPictureColor   [1575, 47,[0.738,0.714,0.417,1 ]];
_index48 =lbAdd   [1575,"USA (Army - Desert )  M1097A2 , 2dr cgo open                         Price:    $61,665.00"]; _Pic49= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_d_4dr">> "picture");   lbSetPicture    [1575, 48   , _Pic49  ];  lbSetPictureColor   [1575, 48,[0.738,0.714,0.417,1 ]];
_index49 =lbAdd   [1575,"USA (Army - Woodland )  M1097A2 , 2dr cgo halfsoftop                 Price:    $63,665.00"]; _Pic50= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_w_4dr_halftop">> "picture");   lbSetPicture    [1575, 49   , _Pic50  ];  lbSetPictureColor   [1575, 49,[0.738,0.714,0.417,1 ]];
_index50 =lbAdd   [1575,"USA (Army - Desert )  M1097A2 , 2dr cgo halfsoftop                   Price:    $63,665.00"]; _Pic51= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_d_4dr_halftop">> "picture");   lbSetPicture    [1575, 50   , _Pic51  ];  lbSetPictureColor   [1575, 50,[0.738,0.714,0.417,1 ]];
_index51 =lbAdd   [1575,"USA (Army - Woodland )  M1097A2 , 2dr cgo softop                     Price:    $65,665.00"]; _Pic52= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_w_4dr_fulltop">> "picture");   lbSetPicture    [1575, 51   , _Pic52  ];  lbSetPictureColor   [1575, 51,[0.738,0.714,0.417,1 ]];
_index52 =lbAdd   [1575,"USA (Army - Desert )  M1097A2 , 2dr cgo softop                       Price:    $65,665.00"]; _Pic53= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_d_4dr_fulltop">> "picture");   lbSetPicture    [1575, 52   , _Pic53  ];  lbSetPictureColor   [1575, 52,[0.738,0.714,0.417,1 ]];
_index53 =lbAdd   [1575,"USA (USMC - Woodland )  M1123, 2dr cgo open w/ snorkel               Price:    $61,665.00"]; _Pic54= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_w_s_2dr">> "picture");    lbSetPicture    [1575, 53   , _Pic54  ];  lbSetPictureColor   [1575, 53,[0.738,0.714,0.417,1 ]];
_index54 =lbAdd   [1575,"USA (USMC - Desert )  M1123, 2dr cgo open w/ snorkel                 Price:    $61,665.00"]; _Pic55= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_d_s_2dr">> "picture"); lbSetPicture    [1575, 54   , _Pic55  ];  lbSetPictureColor   [1575, 54,[0.738,0.714,0.417,1 ]];
_index55 =lbAdd   [1575,"USA (USMC - Woodland )  M1123, 2dr cgo halfsoftop w/ snorkel         Price:    $63,665.00"]; _Pic56= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_w_s_2dr_halftop">> "picture");    lbSetPicture    [1575, 55   , _Pic56  ];  lbSetPictureColor   [1575, 55,[0.738,0.714,0.417,1 ]];
_index56 =lbAdd   [1575,"USA (USMC - Desert )  M1123, 2dr cgo halfsoftop w/ snorkel           Price:    $63,665.00"]; _Pic57= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_d_s_2dr_halftop">> "picture");    lbSetPicture    [1575, 56   , _Pic57  ];  lbSetPictureColor   [1575, 56,[0.738,0.714,0.417,1 ]];
_index57 =lbAdd   [1575,"USA (USMC - Woodland )  M1123, 2dr cgo softop w/ snorkel             Price:    $65,665.00"]; _Pic58= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_w_s_2dr_fulltop">> "picture"); lbSetPicture    [1575, 57   , _Pic58  ];  lbSetPictureColor   [1575, 57,[0.738,0.714,0.417,1 ]];
_index58 =lbAdd   [1575,"USA (USMC - Desert )  M1123, 2dr cgo softop w/ snorkel               Price:    $65,665.00"]; _Pic59= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_d_s_2dr_fulltop">> "picture");    lbSetPicture    [1575, 58   , _Pic59  ];  lbSetPictureColor   [1575, 58,[0.738,0.714,0.417,1 ]];
_index59 =lbAdd   [1575,"USA (USMC - Woodland )  M1123, 4dr cgo open w/ snorkel               Price:    $61,665.00"]; _Pic60= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_w_s_4dr">> "picture");    lbSetPicture    [1575, 59   , _Pic60  ];  lbSetPictureColor   [1575, 59,[0.738,0.714,0.417,1 ]];
_index60 =lbAdd   [1575,"USA (USMC - Desert )  M1123, 4dr cgo open w/ snorkel                 Price:    $61,665.00"]; _Pic61= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_d_s_4dr">> "picture"); lbSetPicture    [1575, 60   , _Pic61  ];  lbSetPictureColor   [1575, 60,[0.738,0.714,0.417,1 ]];
_index61 =lbAdd   [1575,"USA (USMC - Woodland )  M1123, 4dr cgo halfsoftop w/ snorkel         Price:    $63,665.00"]; _Pic62= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_w_s_4dr_halftop">> "picture");    lbSetPicture    [1575, 61   , _Pic62  ];  lbSetPictureColor   [1575, 61,[0.738,0.714,0.417,1 ]];
_index62 =lbAdd   [1575,"USA (USMC - Desert )  M1123, 4dr cgo halfsoftop w/ snorkel           Price:    $63,665.00"]; _Pic63= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_d_s_4dr_halftop">> "picture");    lbSetPicture    [1575, 62   , _Pic63  ];  lbSetPictureColor   [1575, 62,[0.738,0.714,0.417,1 ]];
_index63 =lbAdd   [1575,"USA (USMC - Woodland )  M1123, 4dr cgo softop w/ snorkel             Price:    $65,665.00"]; _Pic64= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_w_s_4dr_fulltop">> "picture");    lbSetPicture    [1575, 63   , _Pic64  ];  lbSetPictureColor   [1575, 63,[0.738,0.714,0.417,1 ]];
_index64 =lbAdd   [1575,"USA (USMC - Desert )  M1123, 4dr cgo softop w/ snorkel               Price:    $65,665.00"]; _Pic65= getText( configFile  >> "CfgVehicles">> "rhsusf_m998_d_s_4dr_fulltop">> "picture");    lbSetPicture    [1575, 64   , _Pic65  ];  lbSetPictureColor   [1575, 64,[0.738,0.714,0.417,1 ]];
_index65 =lbAdd   [1575,"USA (Army 2010)  Woodland RG-33 (Unarmed)                            Price:   $460,000.00"]; _Pic66= getText( configFile  >> "CfgVehicles">> "rhsusf_rg33_wd">> "picture");  lbSetPicture    [1575, 65   , _Pic66  ];  lbSetPictureColor   [1575, 65,[0.738,0.714,0.417,1 ]];
_index66 =lbAdd   [1575,"USA (Army 2010)  Woodland  RG-33 (M2)                                Price:   $475,000.00"]; _Pic67= getText( configFile  >> "CfgVehicles">> "rhsusf_rg33_m2_wd">> "picture");  lbSetPicture    [1575, 66   , _Pic67  ];  lbSetPictureColor   [1575, 66,[0.738,0.714,0.417,1 ]];
_index67 =lbAdd   [1575,"USA (USMC 2010)  Woodland RG-33 (Unarmed)                            Price:   $460,000.00"]; _Pic68= getText( configFile  >> "CfgVehicles">> "rhsusf_rg33_usmc_wd">> "picture"); lbSetPicture    [1575, 67   , _Pic68  ];  lbSetPictureColor   [1575, 67,[0.738,0.714,0.417,1 ]];
_index68 =lbAdd   [1575,"USA (USMC 2010)  Woodland RG-33 (M2)                                 Price:   $475,000.00"]; _Pic69= getText( configFile  >> "CfgVehicles">> "rhsusf_rg33_m2_usmc_wd">> "picture"); lbSetPicture    [1575, 68   , _Pic69  ];  lbSetPictureColor   [1575, 68,[0.738,0.714,0.417,1 ]];

};
};
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Add Fixed Wing to Main List
DoAddFixedWing = {
wheelson = 0;
wingson = 1;
helion = 0;
armoredon = 0;
RoboticsOn = 0; 
SupportOn = 0; 
UpgradesOn = 0; 
lbClear 1575;
_index0 =   lbAdd   [1575,"A-164 Wipeout Anti-Tank Aircraft                                         Price:   $11,800,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "B_Plane_CAS_01_F">> "picture");    lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
_index1 =   lbAdd   [1575,"To-199 Neophron                                                          Price:   $11,000,000.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "O_Plane_CAS_02_F">> "picture");    lbSetPicture    [1575, 1    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];

if (RHS_Support_Enabled == 1) then {

_index2 =   lbAdd   [1575,"RUS (VVS grey)  Su-25SM                                                  Price:   $11,000,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "RHS_Su25SM_vvs">> "picture");  lbSetPicture    [1575, 2    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
_index3 =   lbAdd   [1575,"RUS (VVS camo)  Su-25SM                                                  Price:   $11,000,000.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "RHS_Su25SM_vvsc">> "picture"); lbSetPicture    [1575, 3    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];
_index4 =   lbAdd   [1575,"A-10A Thunderbolt II                                                     Price:   $11,800,000.00"]; _Pic3= getText( configFile  >> "CfgVehicles">> "rhs_a10">> "picture"); lbSetPicture    [1575, 4    , _Pic3   ];  lbSetPictureColor   [1575, 2 ,[0.738,0.714,0.417,1 ]];
_index5 =   lbAdd   [1575,"Hercules C-130J                                                          Price:   $70,370,000.00"]; _Pic4= getText( configFile  >> "CfgVehicles">> "RHS_C130J">> "picture");   lbSetPicture    [1575, 5    , _Pic4   ];  lbSetPictureColor   [1575, 3 ,[0.738,0.714,0.417,1 ]];

}; 
};
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//Add Rotary Aircraft to Main List
DoAddRotary = {
wheelson = 0;
wingson = 0;
helion = 1;
armoredon = 0;
RoboticsOn = 0; 
SupportOn = 0; 
UpgradesOn = 0; 
lbClear 1575;
_index0 =   lbAdd   [1575,"AH-99 Blackfoot Attack Helicopter                             Price:  $35,700,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "B_Heli_Attack_01_F">> "picture");  lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
_index1 =   lbAdd   [1575,"UH-80 Ghosthawk Combat Transport Helicopter                   Price:  $30,500,000.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "B_Heli_Transport_01_F">> "picture");   lbSetPicture    [1575, 1    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];
_index2 =   lbAdd   [1575,"AH-9 Pawnee Combat Support Helicopter                         Price:  $2,300,000.00"]; _Pic3= getText( configFile  >> "CfgVehicles">> "B_Heli_Light_01_armed_F">> "picture"); lbSetPicture    [1575, 2    , _Pic3   ];  lbSetPictureColor   [1575, 2 ,[0.738,0.714,0.417,1 ]];
_index3 =   lbAdd   [1575,"MH-9 Hummingbird Light Transport Helicopter                   Price:  $2,000,000.00"]; _Pic4= getText( configFile  >> "CfgVehicles">> "B_Heli_Light_01_F">> "picture");   lbSetPicture    [1575, 3    , _Pic4   ];  lbSetPictureColor   [1575, 3 ,[0.738,0.714,0.417,1 ]];
_index4 =   lbAdd   [1575,"PO-30 Orca (Black)                                            Price:  $14,300,000.00"]; _Pic5= getText( configFile  >> "CfgVehicles">> "O_Heli_Light_02_unarmed_F">> "picture");   lbSetPicture    [1575, 4    , _Pic5   ];  lbSetPictureColor   [1575, 4 ,[0.738,0.714,0.417,1 ]];
_index5 =   lbAdd   [1575,"PO-30 Orca                                                    Price:  $16,800,000.00"]; _Pic6= getText( configFile  >> "CfgVehicles">> "O_Heli_Light_02_F">> "picture");   lbSetPicture    [1575, 5    , _Pic6   ];  lbSetPictureColor   [1575, 5,[0.738,0.714,0.417,1 ]];
_index6 =   lbAdd   [1575,"Mi-48 Kajman                                                  Price:  $21,300,000.00"]; _Pic7= getText( configFile  >> "CfgVehicles">> "O_Heli_Attack_02_F">> "picture");  lbSetPicture    [1575, 6    , _Pic7   ];  lbSetPictureColor   [1575, 6 ,[0.738,0.714,0.417,1 ]];
_index7 =   lbAdd   [1575,"Mi-48 Kajman (Black)                                          Price:  $23,000,000.00"]; _Pic8= getText( configFile  >> "CfgVehicles">> "O_Heli_Attack_02_black_F">> "picture");    lbSetPicture    [1575, 7    , _Pic8   ];  lbSetPictureColor   [1575, 7 ,[0.738,0.714,0.417,1 ]];

if (RHS_Support_Enabled == 1) then {
_index8=lbAdd	[1575,	"USA (Desert)  AH-1Z (Multi-Role) 								Price: 	$27,550,000.00	"	];		_Pic1	=	getText	(	configFile >>	"CfgVehicles"	>>	"RHS_AH1Z">>	"picture");	lbSetPicture	[	1575	,	8	,	_Pic1	];	lbSetColor	[	1575	,	8	,	[	0.9	,	0.2	,	0.2	,	0.5	]];
_index9=lbAdd	[1575,	"USA (Desert)  AH-1Z (Ground-Suppression)						Price: 	$27,150,000.00	"];		_Pic2	=	getText	(	configFile >>	"CfgVehicles">>	"RHS_AH1Z_GS">>	"picture");	lbSetPicture	[	1575	,	9	,	_Pic2	];	lbSetColor	[	1575	,	9	,	[	0.9	,	0.2	,	0.2	,	0.5	]];
_index10=lbAdd	[1575,	"USA (Desert)  AH-1Z (Close-Support) 							Price: 	$27,350,000.00	"];		_Pic3=getText	(	configFile >>	"CfgVehicles">>	"RHS_AH1Z_CS">>	"picture");	lbSetPicture	[	1575	,	10	,	_Pic3	];	lbSetColor	[	1575	,	10	,	[	0.9	,	0.2	,	0.2	,	0.5	]];
_index11=lbAdd	[1575,	"USA (Woodland)  AH-1Z (Multi-Role) 							Price: 	$31,550,000.00	"];		_Pic4=getText	(	configFile >>	"CfgVehicles">>	"rhs_ah1z_wd">>	"picture");	lbSetPicture	[	1575	,	11	,	_Pic4	];	lbSetColor	[	1575	,	11	,	[	0.9	,	0.2	,	0.2	,	0.5	]];
_index12=lbAdd	[1575,	"USA (Woodland)  AH-1Z (Ground-Suppression)						Price: 	$31,150,000.00	"];		_Pic5=getText	(	configFile >>	"CfgVehicles">>	"rhs_ah1z_wd_gs">>	"picture");	lbSetPicture	[	1575	,	12	,	_Pic5	];	lbSetColor	[	1575	,	12	,	[	0.9	,	0.2	,	0.2	,	0.5	]];
_index13=lbAdd	[1575,	"USA (Woodland)  AH-1Z (Close-Support)							Price: 	$31,350,000.00	"];		_Pic6=getText	(	configFile >>	"CfgVehicles">>	"rhs_ah1z_wd_cs">>	"picture");	lbSetPicture	[	1575	,	13	,	_Pic6	];	lbSetColor	[	1575	,	13	,	[	0.9	,	0.2	,	0.2	,	0.5	]];
_index14=lbAdd	[1575,	"USA (Army 2010)  AH-64D (grey) 								Price: 	$65,325,950.00	"];		_Pic7=getText	(	configFile >>	"CfgVehicles">>	"RHS_AH64DGrey">>	"picture");	lbSetPicture	[	1575	,	14	,	_Pic7	];	lbSetPictureColor	[	1575	,	14	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index15=lbAdd	[1575,	"USA (Army 2014)  AH-64D (Multi-Role) 							Price: 	$35,950,000.00	"];		_Pic8=getText	(	configFile >>	"CfgVehicles">>	"rhs_ah64d_wd">>	"picture");	lbSetPicture	[	1575	,	15	,	_Pic8	];	lbSetPictureColor	[	1575	,	15	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index16=lbAdd	[1575,	"USA (Army 2014)  AH-64D (Ground-Suppression)					Price: 	$35,725,950.00	"];		_Pic9=getText	(	configFile >>	"CfgVehicles">>	"rhs_ah64d_wd_gs">>	"picture");	lbSetPicture	[	1575	,	16	,	_Pic9	];	lbSetPictureColor	[	1575	,	16	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index17=lbAdd	[1575,	"USA (Army 2014)  AH-64D (Close-Support) 						Price: 	$35,695,500.00	"];		_Pic10=getText	(	configFile >>	"CfgVehicles">>	"rhs_ah64d_wd_cs">>	"picture");	lbSetPicture	[	1575	,	17	,	_Pic10	];	lbSetPictureColor	[	1575	,	17	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index18=lbAdd	[1575,	"USA (Army 2014)  AH-64D (AA) 									Price: 	$35,725,950.00	"];		_Pic11=getText	(	configFile >>	"CfgVehicles">>	"RHS_AH64D_wd_AA">>	"picture");	lbSetPicture	[	1575	,	18	,	_Pic11	];	lbSetPictureColor	[	1575	,	18	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index19=lbAdd	[1575,	"USA (Army 2010)  CH-47 										Price: 	$38,550,000.00	"];		_Pic12=getText	(	configFile >>	"CfgVehicles">>	"rhs_ch_47f_10">>	"picture");	lbSetPicture	[	1575	,	19	,	_Pic12	];	lbSetPictureColor	[	1575	,	19	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index20=lbAdd	[1575,	"USA (Army 2010)  CH-47 (D)										Price: 	$38,550,000.00	"];		_Pic13=getText	(	configFile >>	"CfgVehicles">>	"rhs_ch_47f_light_10">>	"picture");	lbSetPicture	[	1575	,	20	,	_Pic13	];	lbSetPictureColor	[	1575	,	20	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index21=lbAdd	[1575,	"USA (Army 2014)  CH-47											Price: 	$38,550,000.00	"];		_Pic14=getText	(	configFile >>	"CfgVehicles">>	"rhs_ch_47f">>	"picture");	lbSetPicture	[	1575	,	21	,	_Pic14	];	lbSetPictureColor	[	1575	,	21	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index22=lbAdd	[1575,	"USA (Army 2014)  CH-47 (D)										Price: 	$38,550,000.00	"];		_Pic15=getText	(	configFile >>	"CfgVehicles">>	"rhs_ch_47f_light">>	"picture");	lbSetPicture	[	1575	,	22	,	_Pic15	];	lbSetPictureColor	[	1575	,	22	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index23=lbAdd	[1575,	"USA (USMC 2010)  UH-1Y (FFAR/MG)								Price: 	$21,600,000.00	"];		_Pic16=getText	(	configFile >>	"CfgVehicles">>	"rhs_uh1y">>	"picture");	lbSetPicture	[	1575	,	23	,	_Pic16	];	lbSetPictureColor	[	1575	,	23	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index24=lbAdd	[1575,	"USA (USMC 2010)  UH-1Y (FFAR) 								   Price: 	$21,600,000.00	"];		_Pic17=getText	(	configFile >>	"CfgVehicles">>	"rhs_uh1y_ffar">>	"picture");	lbSetPicture	[	1575	,	24	,	_Pic17	];	lbSetPictureColor	[	1575	,	24	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index25=lbAdd	[1575,	"USA (USMC 2010)  UH-1Y (Unarmed) 							   Price: 	$21,600,000.00	"];		_Pic18=getText	(	configFile >>	"CfgVehicles">>	"rhs_uh1y_unarmed">>	"picture");	lbSetPicture	[	1575	,	25	,	_Pic18	];	lbSetPictureColor	[	1575	,	25	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index26=lbAdd	[1575,	"USA (Army 2014)  UH-60M 									   Price: 	$21,300,000.00	"];		_Pic19=getText	(	configFile >>	"CfgVehicles">>	"rhs_uh60m">>	"picture");	lbSetPicture	[	1575	,	26	,	_Pic19	];	lbSetPictureColor	[	1575	,	26	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index27=lbAdd	[1575,	"USA (Army 2014)  UH-60M MEV 								   Price: 	$21,300,000.00	"];		_Pic20=getText	(	configFile >>	"CfgVehicles">>	"rhs_uh60m_mev2">>	"picture");	lbSetPicture	[	1575	,	27	,	_Pic20	];	lbSetPictureColor	[	1575	,	27	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index28=lbAdd	[1575,	"USA (Army 2014)  UH-60M MEV (ESSS)							   Price: 	$21,300,000.00	"];		_Pic21=getText	(	configFile >>	"CfgVehicles">>	"rhs_uh60m_mev">>	"picture");	lbSetPicture	[	1575	,	28	,	_Pic21	];	lbSetPictureColor	[	1575	,	28	,	[	0.9	,	0.9	,	0.9	,	0.8	]];
_index29 =lbAdd   [1575, "RUS Ka-52 (Grey)                                             Price:   $16,000,000"];     _Pic22= getText( configFile  >> "CfgVehicles">> "RHS_Ka52_vvs">>   "picture"); lbSetPicture    [1575, 29   , _Pic22  ];  lbSetPictureColor   [1575, 29,[0.738,0.714,0.417,1 ]];
_index30 =lbAdd   [1575, "RUS Ka-52 (Camo)                                             Price:   $16,000,000"];     _Pic23= getText( configFile  >> "CfgVehicles">> "RHS_Ka52_vvsc">>  "picture"); lbSetPicture    [1575, 30   , _Pic23  ];  lbSetPictureColor   [1575, 30,[0.738,0.714,0.417,1 ]];
_index31 =lbAdd   [1575, "RUS Ka-60 (Grey)                                             Price:   $21,500,000"];     _Pic24= getText( configFile  >> "CfgVehicles">> "rhs_ka60_grey">>  "picture"); lbSetPicture    [1575, 31   , _Pic24  ];  lbSetPictureColor   [1575, 31,[0.738,0.714,0.417,1 ]];
_index32 =lbAdd   [1575, "RUS Ka-60 (Camo)                                             Price:   $21,500,000"];     _Pic25= getText( configFile  >> "CfgVehicles">> "rhs_ka60_c">> "picture"); lbSetPicture    [1575, 32   , _Pic25  ];  lbSetPictureColor   [1575, 32,[0.738,0.714,0.417,1 ]];
_index33 =lbAdd   [1575, "RUS Mi-24P                                                   Price:   $12,000,000"];     _Pic26= getText( configFile  >> "CfgVehicles">> "RHS_Mi24P_vdv">>  "picture"); lbSetPicture    [1575, 33   , _Pic26  ];  lbSetPictureColor   [1575, 33,[0.738,0.714,0.417,1 ]];
_index34 =lbAdd   [1575, "RUS Mi-24V                                                   Price:   $12,000,000"];     _Pic27= getText( configFile  >> "CfgVehicles">> "RHS_Mi24V_vdv">>  "picture"); lbSetPicture    [1575, 34   , _Pic27  ];  lbSetPictureColor   [1575, 34,[0.738,0.714,0.417,1 ]];
_index35 =lbAdd   [1575, "RUS Mi-24P (Grey)                                            Price:   $12,000,000"];     _Pic28= getText( configFile  >> "CfgVehicles">> "RHS_Mi24P_vvs">>  "picture"); lbSetPicture    [1575, 35   , _Pic28  ];  lbSetPictureColor   [1575, 35,[0.738,0.714,0.417,1 ]];
_index36 =lbAdd   [1575, "RUS Mi-24V (Grey)                                            Price:   $12,000,000"];     _Pic29= getText( configFile  >> "CfgVehicles">> "RHS_Mi24V_vvs">>  "picture"); lbSetPicture    [1575, 36   , _Pic29  ];  lbSetPictureColor   [1575, 36,[0.738,0.714,0.417,1 ]];
_index37 =lbAdd   [1575, "RUS Mi-24P (Camo)                                            Price:   $12,000,000"];     _Pic30= getText( configFile  >> "CfgVehicles">> "RHS_Mi24P_vvsc">> "picture"); lbSetPicture    [1575, 37   , _Pic30  ];  lbSetPictureColor   [1575, 37,[0.738,0.714,0.417,1 ]];
_index38 =lbAdd   [1575, "RUS Mi-24V (Camo)                                            Price:   $12,000,000"];     _Pic31= getText( configFile  >> "CfgVehicles">> "RHS_Mi24V_vvsc">> "picture"); lbSetPicture    [1575, 38   , _Pic31  ];  lbSetPictureColor   [1575, 38,[0.738,0.714,0.417,1 ]];
_index39 =lbAdd   [1575, "RUS Mi-8AMT                                                  Price:   $9,000,000 "];     _Pic32= getText( configFile  >> "CfgVehicles">> "RHS_Mi8AMT_vdv">> "picture"); lbSetPicture    [1575, 39   , _Pic32  ];  lbSetPictureColor   [1575, 39,[0.738,0.714,0.417,1 ]];
_index40 =lbAdd   [1575, "RUS  Mi-8AMTSh                                               Price:   $9,350,000 "];     _Pic33= getText( configFile  >> "CfgVehicles">> "RHS_Mi8AMTSh_vdv">>   "picture"); lbSetPicture    [1575, 40   , _Pic33  ];  lbSetPictureColor   [1575, 40,[0.738,0.714,0.417,1 ]];
_index41 =lbAdd   [1575, "RUS Mi-8AMT (Grey)                                           Price:   $9,000,000 "];     _Pic34= getText( configFile  >> "CfgVehicles">> "RHS_Mi8AMT_vvs">> "picture"); lbSetPicture    [1575, 41   , _Pic34  ];  lbSetPictureColor   [1575, 41,[0.738,0.714,0.417,1 ]];
_index42 =lbAdd   [1575, "RUS Mi-8AMTSh (Grey)                                         Price:   $9,350,000 "];     _Pic35= getText( configFile  >> "CfgVehicles">> "RHS_Mi8AMTSh_vvs">>   "picture"); lbSetPicture    [1575, 42   , _Pic35  ];  lbSetPictureColor   [1575, 42,[0.738,0.714,0.417,1 ]];
_index43 =lbAdd   [1575, "RUS Mi-8AMT (Camo)                                           Price:   $9,000,000 "];     _Pic36= getText( configFile  >> "CfgVehicles">> "RHS_Mi8AMT_vvsc">> "picture"); lbSetPicture    [1575, 43   , _Pic36  ];  lbSetPictureColor   [1575, 43,[0.738,0.714,0.417,1 ]];
_index44 =lbAdd   [1575, "RUS Mi-8AMTSh (Camo)                                         Price:   $9,350,000 "];     _Pic37= getText( configFile  >> "CfgVehicles">> "RHS_Mi8AMTSh_vvsc">>  "picture"); lbSetPicture    [1575, 44   , _Pic37  ];  lbSetPictureColor   [1575, 44,[0.738,0.714,0.417,1 ]];
_index45 =lbAdd   [1575, "RUS  Mi-8MT                                                  Price:   $9,000,000 "];     _Pic38= getText( configFile  >> "CfgVehicles">> "RHS_Mi8mt_vdv">>  "picture"); lbSetPicture    [1575, 45   , _Pic38  ];  lbSetPictureColor   [1575, 45,[0.738,0.714,0.417,1 ]];
_index46 =lbAdd   [1575, "RUS  Mi-8MTV-3                                               Price:   $9,350,000 "];     _Pic39= getText( configFile  >> "CfgVehicles">> "RHS_Mi8MTV3_vdv">> "picture"); lbSetPicture    [1575, 46   , _Pic39  ];  lbSetPictureColor   [1575, 46,[0.738,0.714,0.417,1 ]];
_index47 =lbAdd   [1575, "RUS  Mi-8MT (Grey)                                           Price:   $9,000,000 "];     _Pic40= getText( configFile  >> "CfgVehicles">> "RHS_Mi8mt_vvs">>  "picture"); lbSetPicture    [1575, 47   , _Pic40  ];  lbSetPictureColor   [1575, 47,[0.738,0.714,0.417,1 ]];
_index48 =lbAdd   [1575, "RUS  Mi-8MTV-3 (Grey)                                        Price:   $9,350,000 "];     _Pic41= getText( configFile  >> "CfgVehicles">> "RHS_Mi8MTV3_vvs">> "picture"); lbSetPicture    [1575, 48   , _Pic41  ];  lbSetPictureColor   [1575, 48,[0.738,0.714,0.417,1 ]];
_index49 =lbAdd   [1575, "RUS  Mi-8MT (Camo)                                           Price:   $9,000,000 "];     _Pic42= getText( configFile  >> "CfgVehicles">> "RHS_Mi8mt_vvsc">> "picture"); lbSetPicture    [1575, 49   , _Pic42  ];  lbSetPictureColor   [1575, 49,[0.738,0.714,0.417,1 ]];
_index50 =lbAdd   [1575, "RUS  Mi-8MTV-3 (Camo)                                        Price:   $9,350,000 "];     _Pic43= getText( configFile  >> "CfgVehicles">> "RHS_Mi8MTV3_vvsc">>   "picture"); lbSetPicture    [1575, 50   , _Pic43  ];  lbSetPictureColor   [1575, 50,[0.738,0.714,0.417,1 ]];

}; 
};
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//Add Armored Vehicles to Main List
DoAddArmored = {
wheelson = 0;
wingson = 0;
helion = 0;
armoredon = 1;
RoboticsOn = 0; 
SupportOn = 0; 
UpgradesOn = 0; 
lbClear 1575;
_index0 =   lbAdd   [1575,"M2A1 Slammer Battle Tank                                     Price:   $6,000,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "B_MBT_01_cannon_F">> "picture");   lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
_index1 =   lbAdd   [1575,"M5 Sandstorm MLRS                                            Price:   $2,410,000.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "B_MBT_01_mlrs_F">> "picture"); lbSetPicture    [1575, 1    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];
_index2 =   lbAdd   [1575,"AMV-7 Amphibious APC                                         Price:   $3,150,000.00"]; _Pic3= getText( configFile  >> "CfgVehicles">> "B_APC_Wheeled_01_cannon_F">> "picture");   lbSetPicture    [1575, 2    , _Pic3   ];  lbSetPictureColor   [1575, 2 ,[0.738,0.714,0.417,1 ]];
_index3 =   lbAdd   [1575,"IFV-6c Panther APC                                           Price:   $3,000,000.00"]; _Pic4= getText( configFile  >> "CfgVehicles">> "B_APC_Tracked_01_rcws_F">> "picture"); lbSetPicture    [1575, 3    , _Pic4   ];  lbSetPictureColor   [1575, 3 ,[0.738,0.714,0.417,1 ]];
_index4 =   lbAdd   [1575,"IFV-6a Cheetah AA Tank                                       Price:   $3,800,000.00"]; _Pic5= getText( configFile  >> "CfgVehicles">> "B_APC_Tracked_01_AA_F">> "picture");   lbSetPicture    [1575, 4    , _Pic5   ];  lbSetPictureColor   [1575, 4 ,[0.738,0.714,0.417,1 ]];
_index5 =   lbAdd   [1575,"T-100 Varsuk Battle Tank                                     Price:   $6,000,000.00"]; _Pic6= getText( configFile  >> "CfgVehicles">> "O_MBT_02_cannon_F">> "picture");   lbSetPicture    [1575, 5    , _Pic6   ];  lbSetPictureColor   [1575, 5,[0.738,0.714,0.417,1 ]];
_index6 =   lbAdd   [1575,"2S9 Sochor Artillery                                         Price:   $2,410,000.00"]; _Pic7= getText( configFile  >> "CfgVehicles">> "O_MBT_02_arty_F">> "picture"); lbSetPicture    [1575, 6    , _Pic7   ];  lbSetPictureColor   [1575, 6 ,[0.738,0.714,0.417,1 ]];
_index7 =   lbAdd   [1575,"BTR-K Kamysh Amphibious APC                                  Price:   $3,150,000.00"]; _Pic8= getText( configFile  >> "CfgVehicles">> "O_APC_Tracked_02_cannon_F">> "picture");   lbSetPicture    [1575, 7    , _Pic8   ];  lbSetPictureColor   [1575, 7 ,[0.738,0.714,0.417,1 ]];
_index8 =   lbAdd   [1575,"MSE-3 Marid APC                                              Price:   $3,000,000.00"]; _Pic9= getText( configFile  >> "CfgVehicles">> "O_APC_Wheeled_02_rcws_F">> "picture"); lbSetPicture    [1575, 8    , _Pic9   ];  lbSetPictureColor   [1575, 8 ,[0.738,0.714,0.417,1 ]];
_index9 =   lbAdd   [1575,"ZSU-39 Tigris AA Tank                                        Price:   $3,800,000.00"]; _Pic10= getText( configFile  >> "CfgVehicles">> "O_APC_Tracked_02_AA_F">> "picture");   lbSetPicture    [1575, 9    , _Pic10  ];  lbSetPictureColor   [1575, 9 ,[0.738,0.714,0.417,1 ]];


if (RHS_Support_Enabled == 1) then {
_index10 =lbAdd   [1575,"US (Army 2010)  M109A6 (WD)                              Price:   $1,200,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "rhsusf_m109_usarmy_10">> "picture");   lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
_index11 =lbAdd   [1575,"US (Army 2010)  M109A6 (D)                               Price:   $1,200,000.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "rhsusf_m109d_usarmy_10">> "picture");  lbSetPicture    [1575, 1    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];
_index12 =lbAdd   [1575,"US (Army 2014)  M109A6 (WD)                              Price:   $1,200,000.00"]; _Pic3= getText( configFile  >> "CfgVehicles">> "rhsusf_m109_usarmy">> "picture");  lbSetPicture    [1575, 2    , _Pic3   ];  lbSetPictureColor   [1575, 2 ,[0.738,0.714,0.417,1 ]];
_index13 =lbAdd   [1575,"US (Army 2014)  M109A6 (D)                               Price:   $1,200,000.00"]; _Pic4= getText( configFile  >> "CfgVehicles">> "rhsusf_m109d_usarmy">> "picture"); lbSetPicture    [1575, 3    , _Pic4   ];  lbSetPictureColor   [1575, 3 ,[0.738,0.714,0.417,1 ]];
_index14 =lbAdd   [1575,"US (Army 2010)  M113A3 (WD)                              Price:   $1,600,000.00"]; _Pic5= getText( configFile  >> "CfgVehicles">> "rhsusf_m113_usarmy">> "picture");  lbSetPicture    [1575, 4    , _Pic5   ];  lbSetPictureColor   [1575, 4 ,[0.738,0.714,0.417,1 ]];
_index15 =lbAdd   [1575,"US (Army 2010)  M113A3 (D)                               Price:   $1,600,000.00"]; _Pic6= getText( configFile  >> "CfgVehicles">> "rhsusf_m113d_usarmy">> "picture"); lbSetPicture    [1575, 5    , _Pic6   ];  lbSetPictureColor   [1575, 5,[0.738,0.714,0.417,1 ]];
_index16 =lbAdd   [1575,"USA (Army 2010)  M1A1AIM                                 Price:   $8,580,000.00"]; _Pic7= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a1aimwd_usarmy">> "picture"); lbSetPicture    [1575, 6    , _Pic7   ];  lbSetPictureColor   [1575, 6 ,[0.738,0.714,0.417,1 ]];
_index17 =lbAdd   [1575,"USA (Army 2010)  M1A1AIM (TUSK I)(WD)                    Price:   $8,950,000.00"]; _Pic8= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a1aim_tuski_wd">> "picture"); lbSetPicture    [1575, 7    , _Pic8   ];  lbSetPictureColor   [1575, 7 ,[0.738,0.714,0.417,1 ]];
_index18 =lbAdd   [1575,"USA (USMC 2010)  M1A1FEP  (WD)                           Price:   $9,110,000.00"]; _Pic9= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a1fep_wd">> "picture");   lbSetPicture    [1575, 8    , _Pic9   ];  lbSetPictureColor   [1575, 8 ,[0.738,0.714,0.417,1 ]];
_index19 =lbAdd   [1575,"USA (USMC 2010)  M1A1FEP (Olive) (WD)                    Price:   $9,110,000.00"]; _Pic10= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a1fep_od">> "picture");   lbSetPicture    [1575, 9    , _Pic10  ];  lbSetPictureColor   [1575, 9 ,[0.738,0.714,0.417,1 ]];
_index20 =lbAdd   [1575,"USA (Army 2010)  M1A1AIM  (D)                            Price:   $8,580,000.00"]; _Pic11= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a1aimd_usarmy">> "picture");  lbSetPicture    [1575, 10   , _Pic11  ];  lbSetPictureColor   [1575, 10,[0.738,0.714,0.417,1 ]];
_index21 =lbAdd   [1575,"USA (Army 2010)  M1A1AIM (TUSK I)(D)                     Price:   $8,950,000.00"]; _Pic12= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a1aim_tuski_d">> "picture");  lbSetPicture    [1575, 11   , _Pic12  ];  lbSetPictureColor   [1575, 11,[0.738,0.714,0.417,1 ]];
_index22 =lbAdd   [1575,"USA (USMC 2010)  M1A1FEP (D)                             Price:   $9,110,000.00"]; _Pic13= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a1fep_d">> "picture");    lbSetPicture    [1575, 12   , _Pic13  ];  lbSetPictureColor   [1575, 12,[0.738,0.714,0.417,1 ]];
_index23 =lbAdd   [1575,"USA (Army 2014)  M1A2SEPv1 (WD)                          Price:   $9,150,000.00"]; _Pic14= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a2sep1wd_usarmy">> "picture");    lbSetPicture    [1575, 13   , _Pic14  ];  lbSetPictureColor   [1575, 13,[0.738,0.714,0.417,1 ]];
_index24 =lbAdd   [1575,"USA (Army 2014)  M1A2SEPv1 (Tusk I)(WD)                  Price:   $8,600,000.00"]; _Pic15= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a2sep1tuskiwd_usarmy">> "picture");   lbSetPicture    [1575, 14   , _Pic15  ];  lbSetPictureColor   [1575, 14,[0.738,0.714,0.417,1 ]];
_index25 =lbAdd   [1575,"USA (Army 2014)  M1A2SEPv1 (D)                           Price:   $9,000,000.00"]; _Pic16= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a2sep1d_usarmy">> "picture"); lbSetPicture    [1575, 15   , _Pic16  ];  lbSetPictureColor   [1575, 15,[0.738,0.714,0.417,1 ]];
_index26 =lbAdd   [1575,"USA (Army 2014)  M1A2SEPv1 (Tusk I)(D)                   Price:   $9,250,000.00"]; _Pic17= getText( configFile  >> "CfgVehicles">> "rhsusf_m1a2sep1tuskid_usarmy">> "picture");    lbSetPicture    [1575, 16   , _Pic17  ];  lbSetPictureColor   [1575, 16,[0.738,0.714,0.417,1 ]];
_index27 =lbAdd   [1575,"USA (Army 2010)  M2A2ODS (WD)                            Price:   $3,166,000.00"]; _Pic18= getText( configFile  >> "CfgVehicles">> "rhs_m2a2_wd">> "picture"); lbSetPicture    [1575, 17   , _Pic18  ];  lbSetPictureColor   [1575, 17,[0.738,0.714,0.417,1 ]];
_index28 =lbAdd   [1575,"USA (Army 2010)  M2A2ODS (BUSK I)(WD)                    Price:   $3,500,000.00"]; _Pic19= getText( configFile  >> "CfgVehicles">> "rhs_m2a2_buski_wd">> "picture");   lbSetPicture    [1575, 18   , _Pic19  ];  lbSetPictureColor   [1575, 18,[0.738,0.714,0.417,1 ]];
_index29 =lbAdd   [1575,"USA (Army 2010)  M2A2ODS (D)                             Price:   $3,166,000.00"]; _Pic20= getText( configFile  >> "CfgVehicles">> "rhs_m2a2">> "picture");    lbSetPicture    [1575, 19   , _Pic20  ];  lbSetPictureColor   [1575, 19,[0.738,0.714,0.417,1 ]];
_index30 =lbAdd   [1575,"USA (Army 2010)  M2A2ODS (BUSK I)(WD)                    Price:   $3,500,000.00"]; _Pic21= getText( configFile  >> "CfgVehicles">> "rhs_m2a2_buski">> "picture");  lbSetPicture    [1575, 20   , _Pic21  ];  lbSetPictureColor   [1575, 20,[0.738,0.714,0.417,1 ]];
_index31 =lbAdd   [1575,"USA (Army 2014)  M2A3 (WD)                               Price:   $3,566,000.00"]; _Pic22= getText( configFile  >> "CfgVehicles">> "RHS_M2A3_wd">> "picture"); lbSetPicture    [1575, 21   , _Pic22  ];  lbSetPictureColor   [1575, 21,[0.738,0.714,0.417,1 ]];
_index32 =lbAdd   [1575,"USA (Army 2014)  M2A3 (BUSK I) (WD)                      Price:   $4,000,000.00"]; _Pic23= getText( configFile  >> "CfgVehicles">> "RHS_M2A3_BUSKI_wd">> "picture");   lbSetPicture    [1575, 22   , _Pic23  ];  lbSetPictureColor   [1575, 22,[0.738,0.714,0.417,1 ]];
_index33 =lbAdd   [1575,"USA (Army 2014)  M2A3 (BUSK III) (WD)                    Price:   $4,500,000.00"]; _Pic24= getText( configFile  >> "CfgVehicles">> "RHS_M2A3_BUSKIII_wd">> "picture"); lbSetPicture    [1575, 23   , _Pic24  ];  lbSetPictureColor   [1575, 23,[0.738,0.714,0.417,1 ]];
_index34 =lbAdd   [1575,"USA (Army 2014)  M2A3 (D)                                Price:   $3,566,000.00"]; _Pic25= getText( configFile  >> "CfgVehicles">> "RHS_M2A3">> "picture");    lbSetPicture    [1575, 24   , _Pic25  ];  lbSetPictureColor   [1575, 24,[0.738,0.714,0.417,1 ]];
_index35 =lbAdd   [1575,"USA (Army 2014)  M2A3 (BUSK I)(D)                        Price:   $4,000,000.00"]; _Pic26= getText( configFile  >> "CfgVehicles">> "RHS_M2A3_BUSKI">> "picture");  lbSetPicture    [1575, 25   , _Pic26  ];  lbSetPictureColor   [1575, 25,[0.738,0.714,0.417,1 ]];
_index36 =lbAdd   [1575,"USA (Army 2014)  M2A3 (BUSK III)(D)                      Price:   $4,500,000.00"]; _Pic27= getText( configFile  >> "CfgVehicles">> "RHS_M2A3_BUSKIII">> "picture");    lbSetPicture    [1575, 26   , _Pic27  ];  lbSetPictureColor   [1575, 26,[0.738,0.714,0.417,1 ]];
_index37 =lbAdd   [1575,"USA (Army 2010)  M6 (WD)                                 Price:   $3,850,000.00"]; _Pic28= getText( configFile  >> "CfgVehicles">> "rhs_m6_wd_10">> "picture");    lbSetPicture    [1575, 27   , _Pic28  ];  lbSetPictureColor   [1575, 27,[0.738,0.714,0.417,1 ]];
_index38 =lbAdd   [1575,"USA (Army 2014)  M6 (WD)                                 Price:   $4,200,000.00"]; _Pic29= getText( configFile  >> "CfgVehicles">> "rhs_m6_wd">> "picture");   lbSetPicture    [1575, 28   , _Pic29  ];  lbSetPictureColor   [1575, 28,[0.738,0.714,0.417,1 ]];
_index39 =lbAdd   [1575,"USA (Army 2010)  M6 (D)                                  Price:   $3,850,000.00"]; _Pic30= getText( configFile  >> "CfgVehicles">> "rhs_m6_10">> "picture");   lbSetPicture    [1575, 29   , _Pic30  ];  lbSetPictureColor   [1575, 29,[0.738,0.714,0.417,1 ]];
_index40 =lbAdd   [1575,"USA (Army 2014)  M6 (D)                                  Price:   $4,200,000.00"]; _Pic31= getText( configFile  >> "CfgVehicles">> "rhs_m6">> "picture");  lbSetPicture    [1575, 30   , _Pic31  ];  lbSetPictureColor   [1575, 30,[0.738,0.714,0.417,1 ]];
_index41 =lbAdd   [1575,"RUS 2S25                                                 Price:     $945,000.00"]; _Pic32= getText( configFile  >> "CfgVehicles">> "rhs_sprut_vdv">> "picture");   lbSetPicture    [1575, 31   , _Pic32  ];  lbSetPictureColor   [1575, 31,[0.738,0.714,0.417,1 ]];
_index42 =lbAdd   [1575,"RUS 2S3M                                                 Price:   $4,300,500.00"]; _Pic33= getText( configFile  >> "CfgVehicles">> "rhs_2s3_tv">> "picture");  lbSetPicture    [1575, 32   , _Pic33  ];  lbSetPictureColor   [1575, 32,[0.738,0.714,0.417,1 ]];
_index43 =lbAdd   [1575,"RUS BM-21                                                Price:   $7,580,000.00"]; _Pic34= getText( configFile  >> "CfgVehicles">> "RHS_BM21_MSV_01">> "picture"); lbSetPicture    [1575, 33   , _Pic34  ];  lbSetPictureColor   [1575, 33,[0.738,0.714,0.417,1 ]];
_index44 =lbAdd   [1575,"RUS BMD-1                                                Price:   $1,350,000.00"]; _Pic35= getText( configFile  >> "CfgVehicles">> "rhs_bmd1">> "picture");    lbSetPicture    [1575, 34   , _Pic35  ];  lbSetPictureColor   [1575, 34,[0.738,0.714,0.417,1 ]];
_index45 =lbAdd   [1575,"RUS BMD-1K                                               Price:   $1,375,000.00"]; _Pic36= getText( configFile  >> "CfgVehicles">> "rhs_bmd1k">> "picture");   lbSetPicture    [1575, 35   , _Pic36  ];  lbSetPictureColor   [1575, 35,[0.738,0.714,0.417,1 ]];
_index46 =lbAdd   [1575,"RUS BMD-1P                                               Price:   $1,450,000.00"]; _Pic37= getText( configFile  >> "CfgVehicles">> "rhs_bmd1p">> "picture");   lbSetPicture    [1575, 36   , _Pic37  ];  lbSetPictureColor   [1575, 36,[0.738,0.714,0.417,1 ]];
_index47 =lbAdd   [1575,"RUS BMD-1PK                                              Price:   $1,525,000.00"]; _Pic38= getText( configFile  >> "CfgVehicles">> "rhs_bmd1pk">> "picture");  lbSetPicture    [1575, 37   , _Pic38  ];  lbSetPictureColor   [1575, 37,[0.738,0.714,0.417,1 ]];
_index48 =lbAdd   [1575,"RUS BMD-1R                                               Price:   $1,450,000.00"]; _Pic39= getText( configFile  >> "CfgVehicles">> "rhs_bmd1r">> "picture");   lbSetPicture    [1575, 38   , _Pic39  ];  lbSetPictureColor   [1575, 38,[0.738,0.714,0.417,1 ]];
_index49 =lbAdd   [1575,"RUS BMD-2                                                Price:   $1,650,000.00"]; _Pic40= getText( configFile  >> "CfgVehicles">> "rhs_bmd2">> "picture");    lbSetPicture    [1575, 39   , _Pic40  ];  lbSetPictureColor   [1575, 39,[0.738,0.714,0.417,1 ]];
_index50 =lbAdd   [1575,"RUS BMD-2K                                               Price:   $1,850,000.00"]; _Pic41= getText( configFile  >> "CfgVehicles">> "rhs_bmd2k">> "picture");   lbSetPicture    [1575, 40   , _Pic41  ];  lbSetPictureColor   [1575, 40,[0.738,0.714,0.417,1 ]];
_index51 =lbAdd   [1575,"RUS BMD-2M                                               Price:   $1,875,000.00"]; _Pic42= getText( configFile  >> "CfgVehicles">> "rhs_bmd2m">> "picture");   lbSetPicture    [1575, 41   , _Pic42  ];  lbSetPictureColor   [1575, 41,[0.738,0.714,0.417,1 ]];
_index52 =lbAdd   [1575,"RUS BDM-4                                                Price:   $2,210,000.00"]; _Pic43= getText( configFile  >> "CfgVehicles">> "rhs_bmd4_vdv">> "picture");    lbSetPicture    [1575, 42   , _Pic43  ];  lbSetPictureColor   [1575, 42,[0.738,0.714,0.417,1 ]];
_index53 =lbAdd   [1575,"RUS BDM-4M                                               Price:   $2,225,000.00"]; _Pic44= getText( configFile  >> "CfgVehicles">> "rhs_bmd4m_vdv">> "picture");   lbSetPicture    [1575, 43   , _Pic44  ];  lbSetPictureColor   [1575, 43,[0.738,0.714,0.417,1 ]];
_index54 =lbAdd   [1575,"RUS BDM-4M (A)                                           Price:   $2,275,000.00"]; _Pic45= getText( configFile  >> "CfgVehicles">> "rhs_bmd4ma_vdv">> "picture");  lbSetPicture    [1575, 44   , _Pic45  ];  lbSetPictureColor   [1575, 44,[0.738,0.714,0.417,1 ]];
_index55 =lbAdd   [1575,"RUS BMP-1                                                Price:   $2,500,000.00"]; _Pic46= getText( configFile  >> "CfgVehicles">> "rhs_bmp1_VDV">> "picture");    lbSetPicture    [1575, 45   , _Pic46  ];  lbSetPictureColor   [1575, 45,[0.738,0.714,0.417,1 ]];
_index56 =lbAdd   [1575,"RUS BMP-1P                                               Price:   $2,575,000.00"]; _Pic47= getText( configFile  >> "CfgVehicles">> "rhs_bmp1p_VDV">> "picture");   lbSetPicture    [1575, 46   , _Pic47  ];  lbSetPictureColor   [1575, 46,[0.738,0.714,0.417,1 ]];
_index57 =lbAdd   [1575,"RUS BMP-1K                                               Price:   $2,625,000.00"]; _Pic48= getText( configFile  >> "CfgVehicles">> "rhs_bmp1k_VDV">> "picture");   lbSetPicture    [1575, 47   , _Pic48  ];  lbSetPictureColor   [1575, 47,[0.738,0.714,0.417,1 ]];
_index58 =lbAdd   [1575,"RUS BMP-1D                                               Price:   $2,650,000.00"]; _Pic49= getText( configFile  >> "CfgVehicles">> "rhs_bmp1d_VDV">> "picture");   lbSetPicture    [1575, 48   , _Pic49  ];  lbSetPictureColor   [1575, 48,[0.738,0.714,0.417,1 ]];
_index59 =lbAdd   [1575,"RUS BMP-2 (E)                                            Price:   $2,655,000.00"]; _Pic50= getText( configFile  >> "CfgVehicles">> "rhs_bmp2e_VDV">> "picture");   lbSetPicture    [1575, 49   , _Pic50  ];  lbSetPictureColor   [1575, 49,[0.738,0.714,0.417,1 ]];
_index60 =lbAdd   [1575,"RUS BMP-2                                                Price:   $2,675,000.00"]; _Pic51= getText( configFile  >> "CfgVehicles">> "rhs_bmp2_VDV">> "picture");    lbSetPicture    [1575, 50   , _Pic51  ];  lbSetPictureColor   [1575, 50,[0.738,0.714,0.417,1 ]];
_index61 =lbAdd   [1575,"RUS BMP-2K                                               Price:   $2,710,000.00"]; _Pic52= getText( configFile  >> "CfgVehicles">> "rhs_bmp2k_VDV">> "picture");   lbSetPicture    [1575, 51   , _Pic52  ];  lbSetPictureColor   [1575, 51,[0.738,0.714,0.417,1 ]];
_index62 =lbAdd   [1575,"RUS BMP-2D                                               Price:   $2,745,000.00"]; _Pic53= getText( configFile  >> "CfgVehicles">> "rhs_bmp2d_VDV">> "picture");   lbSetPicture    [1575, 52   , _Pic53  ];  lbSetPictureColor   [1575, 52,[0.738,0.714,0.417,1 ]];
_index63 =lbAdd   [1575,"RUS BRM-1K                                               Price:   $2,847,650.00"]; _Pic54= getText( configFile  >> "CfgVehicles">> "rhs_brm1k_msv">> "picture");   lbSetPicture    [1575, 53   , _Pic54  ];  lbSetPictureColor   [1575, 53,[0.738,0.714,0.417,1 ]];
_index64 =lbAdd   [1575,"RUS BTR-60                                               Price:   $2,500,000.00"]; _Pic55= getText( configFile  >> "CfgVehicles">> "rhs_btr60_msv">> "picture");   lbSetPicture    [1575, 54   , _Pic55  ];  lbSetPictureColor   [1575, 54,[0.738,0.714,0.417,1 ]];
_index65 =lbAdd   [1575,"RUS BTR-70                                               Price:   $2,750,000.00"]; _Pic56= getText( configFile  >> "CfgVehicles">> "rhs_btr70_msv">> "picture");   lbSetPicture    [1575, 55   , _Pic56  ];  lbSetPictureColor   [1575, 55,[0.738,0.714,0.417,1 ]];
_index66 =lbAdd   [1575,"RUS BTR-80                                               Price:   $3,000,000.00"]; _Pic57= getText( configFile  >> "CfgVehicles">> "rhs_btr80_msv">> "picture");   lbSetPicture    [1575, 56   , _Pic57  ];  lbSetPictureColor   [1575, 56,[0.738,0.714,0.417,1 ]];
_index67 =lbAdd   [1575,"RUS BTR-80A                                              Price:   $3,110,000.00"]; _Pic58= getText( configFile  >> "CfgVehicles">> "rhs_btr80a_msv">> "picture");  lbSetPicture    [1575, 57   , _Pic58  ];  lbSetPictureColor   [1575, 57,[0.738,0.714,0.417,1 ]];
_index68 =lbAdd   [1575,"RUS PRP-3                                                Price:   $1,525,375.00"]; _Pic59= getText( configFile  >> "CfgVehicles">> "rhs_prp3_msv">> "picture");    lbSetPicture    [1575, 58   , _Pic59  ];  lbSetPictureColor   [1575, 58,[0.738,0.714,0.417,1 ]];
_index69 =lbAdd   [1575,"RUS T-72B (obr. 1984g.)                                  Price:   $4,250,000.00"]; _Pic60= getText( configFile  >> "CfgVehicles">> "rhs_t72ba_tv">> "picture");    lbSetPicture    [1575, 59   , _Pic60  ];  lbSetPictureColor   [1575, 59,[0.738,0.714,0.417,1 ]];
_index70 =lbAdd   [1575,"RUS T-72B (obr. 1985g.)                                  Price:   $4,550,000.00"]; _Pic61= getText( configFile  >> "CfgVehicles">> "rhs_t72bb_tv">> "picture");    lbSetPicture    [1575, 60   , _Pic61  ];  lbSetPictureColor   [1575, 60,[0.738,0.714,0.417,1 ]];
_index71 =lbAdd   [1575,"RUS T-72B (obr. 1989g.                                   Price:   $4,725,000.00"]; _Pic62= getText( configFile  >> "CfgVehicles">> "rhs_t72bc_tv">> "picture");    lbSetPicture    [1575, 61   , _Pic62  ];  lbSetPictureColor   [1575, 61,[0.738,0.714,0.417,1 ]];
_index72 =lbAdd   [1575,"RUS T-72B3 (obr. 2012g.)                                 Price:   $7,850,000.00"]; _Pic63= getText( configFile  >> "CfgVehicles">> "rhs_t72bd_tv">> "picture");    lbSetPicture    [1575, 62   , _Pic63  ];  lbSetPictureColor   [1575, 62,[0.738,0.714,0.417,1 ]];
_index73 =lbAdd   [1575,"RUS T-80                                                 Price:   $6,250,450.00"]; _Pic64= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture"); lbSetPicture    [1575, 63   , _Pic64  ];  lbSetPictureColor   [1575, 63,[0.738,0.714,0.417,1 ]];
_index74 =lbAdd   [1575,"RUS T-80A                                                Price:   $6,300,500.00"]; _Pic65= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture");    lbSetPicture    [1575, 64   , _Pic65  ];  lbSetPictureColor   [1575, 64,[0.738,0.714,0.417,1 ]];
_index75 =lbAdd   [1575,"RUS T-80B                                                Price:   $6,400,000.00"]; _Pic66= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture");    lbSetPicture    [1575, 65   , _Pic66  ];  lbSetPictureColor   [1575, 65,[0.738,0.714,0.417,1 ]];
_index76 =lbAdd   [1575,"RUS T-80BK                                               Price:   $6,410,000.00"]; _Pic67= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture");   lbSetPicture    [1575, 66   , _Pic67  ];  lbSetPictureColor   [1575, 66,[0.738,0.714,0.417,1 ]];
_index77 =lbAdd   [1575,"RUS T-80BV                                               Price:   $6,450,000.00"]; _Pic68= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture");   lbSetPicture    [1575, 67   , _Pic68  ];  lbSetPictureColor   [1575, 67,[0.738,0.714,0.417,1 ]];
_index78 =lbAdd   [1575,"RUS T-80BVK                                              Price:   $6,500,000.00"]; _Pic69= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture");  lbSetPicture    [1575, 68   , _Pic69  ];  lbSetPictureColor   [1575, 68,[0.738,0.714,0.417,1 ]];
_index79 =lbAdd   [1575,"RUS T-80U                                                Price:   $6,525,000.00"]; _Pic70= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture");    lbSetPicture    [1575, 69   , _Pic70  ];  lbSetPictureColor   [1575, 69,[0.738,0.714,0.417,1 ]];
_index80 =lbAdd   [1575,"RUS T-80UE1                                              Price:   $6,550,000.00"]; _Pic71= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture");  lbSetPicture    [1575, 70   , _Pic71  ];  lbSetPictureColor   [1575, 70,[0.738,0.714,0.417,1 ]];
_index81 =lbAdd   [1575,"RUS T-80U45M                                             Price:   $6,575,000.00"]; _Pic72= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture"); lbSetPicture    [1575, 71   , _Pic72  ];  lbSetPictureColor   [1575, 71,[0.738,0.714,0.417,1 ]];
_index82 =lbAdd   [1575,"RUS T-80UM                                               Price:   $6,600,000.00"]; _Pic73= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture");   lbSetPicture    [1575, 72   , _Pic73  ];  lbSetPictureColor   [1575, 72,[0.738,0.714,0.417,1 ]];
_index83 =lbAdd   [1575,"RUS ZSU-23-4 (TV)                                        Price:   $6,500,000.00"]; _Pic74= getText( configFile  >> "CfgVehicles">> "rhs_t80">> "picture");   lbSetPicture    [1575, 73   , _Pic74  ];  lbSetPictureColor   [1575, 73,[0.738,0.714,0.417,1 ]];

}; 
};

DoAddRobotics = {
wheelson = 0;
wingson = 0;
helion = 0;
armoredon = 0;
RoboticsOn = 1; 
SupportOn = 0; 
UpgradesOn = 0; 
lbClear 1575;

	if (Apex_Enabled == 1) then {
		_index0 =   lbAdd   [1575,"Apex Drakon                                                                  Price:   $15,000,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "UAV_Drakon">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
		} else {
			if (RHS_Support_Enabled == 1) then { 
			_index0 =   lbAdd   [1575,"RHS RQ-11 A Blanket                                                          Price:   $232,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "rq11_zerlegt">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
			_index1 =   lbAdd   [1575,"RHS RQ-11 B Blanket                                                          Price:   $232,000.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "rq11b_zerlegt">> "picture"); lbSetPicture    [1575, 1    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];
			_index2 =   lbAdd   [1575,"RQ-11 A Camera Package                                                       Price:   $8,400.00"]; _Pic3= getText( configFile  >> "CfgVehicles">> "rq11_camera">> "picture"); lbSetPicture    [1575, 2    , _Pic3   ];  lbSetPictureColor   [1575, 2 ,[0.738,0.714,0.417,1 ]];
			_index3 =   lbAdd   [1575,"RQ-11 B Camera Package                                                       Price:   $8,400.00"]; _Pic4= getText( configFile  >> "CfgVehicles">> "rq11b_camera">> "picture");    lbSetPicture    [1575, 3    , _Pic4   ];  lbSetPictureColor   [1575, 3 ,[0.738,0.714,0.417,1 ]];
				} else {
					_index0 =   lbAdd   [1575,"AR-2 Darter                                                                         Price:   $369.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "B_UAV_01_F">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
					_index1 =   lbAdd   [1575,"UGV Stomper                                                                         Price:   $3,210,526.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "B_UGV_01_F">> "picture"); lbSetPicture    [1575, 1    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];
					_index2 =   lbAdd   [1575,"UGV Stomper RCWS                                                                    Price:   $3,225,550.00"]; _Pic3= getText( configFile  >> "CfgVehicles">> "B_UGV_01_rcws_F">> "picture"); lbSetPicture    [1575, 2    , _Pic3   ];  lbSetPictureColor   [1575, 2 ,[0.738,0.714,0.417,1 ]];
					_index3 =   lbAdd   [1575,"Yabhon R3                                                                           Price:   $16,900,000.00"]; _Pic4= getText( configFile  >> "CfgVehicles">> "B_UAV_02_F">> "picture");    lbSetPicture    [1575, 3    , _Pic4   ];  lbSetPictureColor   [1575, 3 ,[0.738,0.714,0.417,1 ]];
					_index4 =   lbAdd   [1575,"Yabhon R3 (CAS)                                                                     Price:   $17,300,000.00"]; _Pic5= getText( configFile  >> "CfgVehicles">> "B_UAV_02_CAS_F">> "picture");  lbSetPicture    [1575, 4    , _Pic5   ];  lbSetPictureColor   [1575, 4 ,[0.738,0.714,0.417,1 ]];
				};
	
			};


};

DoAddSupport = {
wheelson = 0;
wingson = 0;
helion = 0;
armoredon = 0;
RoboticsOn = 0; 
SupportOn = 1; 
UpgradesOn = 0; 
lbClear 1575;

	if (Ace3_Enabled == 1) then {
		_index0 =   lbAdd   [1575,"Replacement Wheel                                                                                                      Price:   $525.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "ACE_Wheel">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
		_index1 =   lbAdd   [1575,"Replacement Track                                                                                                      Price:   $175.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "ACE_Track">> "picture"); lbSetPicture    [1575, 1    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];
		_index2 =   lbAdd   [1575,"Match Grade Ammo Crate (Small Ammo Shipment)                                                                           Price:   $392,378.00"]; _Pic3= getText( configFile  >> "CfgVehicles">> "ACE_Box_Ammo">> "picture"); lbSetPicture    [1575, 2    , _Pic3   ];  lbSetPictureColor   [1575, 2 ,[0.738,0.714,0.417,1 ]];
		_index3 =   lbAdd   [1575,"Medical Supply Shipment                                                                                                Price:   $9,895.00"]; _Pic4= getText( configFile  >> "CfgVehicles">> "ACE_medicalSupplyCrate_advanced">> "picture");    lbSetPicture    [1575, 3    , _Pic4   ];  lbSetPictureColor   [1575, 3 ,[0.738,0.714,0.417,1 ]];
		_index4 =   lbAdd   [1575,"Empty Sandbag                                                                                                          Price:   $1.00"]; _Pic5= getText( configFile  >> "CfgVehicles">> "ACE_Item_Sandbag_empty">> "picture");  lbSetPicture    [1575, 4    , _Pic5   ];  lbSetPictureColor   [1575, 4 ,[0.738,0.714,0.417,1 ]];
		} else {
			if (Iowa_Enabled == 1) then { 
			_index0 =   lbAdd   [1575,"Iowa Class Battleship                                                                                              Price:   $100,000,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "USS_Iowa_Battleship">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
				} else {
					if (SMA_Enabled == 1) then { 
						_index0 =   lbAdd   [1575,"120 + Assorted Weapons, Ammo, Accessories (SMA)                                                        Price:   $2,185,995.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "SMA_Weapon_Box">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];					
						} else {
							if (HLC_Enabled == 1) then { 
							_index0 =   lbAdd   [1575,"180 HK MP5 Submachineguns, Accessories, Ammo (HLC)                                                 Price:   $6,340,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "HLC_MP5_ammobox">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];					
								} else {
									if (RHS_Support_Enabled == 1) then { 
										_index0 =   lbAdd   [1575,"330 Assorted Russian Weapons / Ammunition                                               Price:   $2,106,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "rhs_weapon_crate">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
										_index1 =   lbAdd   [1575,"460 Assorted U.S. Weapons / Ammunition                                                  Price:   $6,900,000.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "rhsusf_weapon_crate">> "picture"); lbSetPicture    [1575, 1    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];	
										} else {
											_index0 =   lbAdd   [1575,"HEMTT A4 M978A4 Fuel Servicing Truck (Tanker)                                       Price:   $1,200,000.00"]; _Pic1= getText( configFile  >> "CfgVehicles">> "B_Truck_01_fuel_F">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
											_index1 =   lbAdd   [1575,"Assorted Small Ammo Shipment (NATO)                                                 Price:   $6,720.00"]; _Pic2= getText( configFile  >> "CfgVehicles">> "Box_NATO_Ammo_F">> "picture"); lbSetPicture    [1575, 1    , _Pic2   ];  lbSetPictureColor   [1575, 1 ,[0.738,0.714,0.417,1 ]];
											_index2 =   lbAdd   [1575,"Assorted Small Weapons Shipment (NATO)                                              Price:   $91,800.00"]; _Pic3= getText( configFile  >> "CfgVehicles">> "Box_NATO_Wps_F">> "picture"); lbSetPicture    [1575, 2    , _Pic3   ];  lbSetPictureColor   [1575, 2 ,[0.738,0.714,0.417,1 ]];
											_index3 =   lbAdd   [1575,"Patrol Boat w/ Minigun                                                              Price:   $1,275,000.00"]; _Pic4= getText( configFile  >> "CfgVehicles">> "B_Boat_Armed_01_minigun_F">> "picture");    lbSetPicture    [1575, 3    , _Pic4   ];  lbSetPictureColor   [1575, 3 ,[0.738,0.714,0.417,1 ]];
											_index4 =   lbAdd   [1575,"RHIB Boat                                                                           Price:   $1,275.00"]; _Pic5= getText( configFile  >> "CfgVehicles">> "B_Boat_Transport_01_F">> "picture");  lbSetPicture    [1575, 4    , _Pic5   ];  lbSetPictureColor   [1575, 4 ,[0.738,0.714,0.417,1 ]];
											_index5 =   lbAdd   [1575,"SDV (NATO)                                                                          Price:   $1,200,000.00"]; _Pic6= getText( configFile  >> "CfgVehicles">> "B_SDV_01_F">> "picture");  lbSetPicture    [1575, 5    , _Pic6   ];  lbSetPictureColor   [1575, 5 ,[0.738,0.714,0.417,1 ]];
										}; 
				
								};
						};
	
				};


		};

}; 
		
DoAddUpgrades = {
wheelson = 0;
wingson = 0;
helion = 0;
armoredon = 0;
RoboticsOn = 0; 
SupportOn = 0; 
UpgradesOn = 1; 
lbClear 1575;

_index0 =   lbAdd   [1575,"Base Upgrades Coming Soon! "]; _Pic1= getText( configFile  >> "CfgVehicles">> "Replace_me">> "picture"); lbSetPicture    [1575, 0    , _Pic1   ];  lbSetPictureColor   [1575, 0 ,[0.738,0.714,0.417,1 ]];
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Handle the menu clicks (Parent class)
A3M_fnc_VhandleClick = {
TheSelection = _this select 1;
hint "You have made a selection. Click *Purchase* button to buy.";
}; 

A3M_Fnc_VBuyButton = {

if (IsNil"TheSelection") then {hint"Nothing was selected to purchase!"} else {
//hint format ["Handle Click Activated. Variable passed was %1", TheSelection];
if (wheelson == 1) then {_this call A3M_fnc_wheeled;};
if (wingson == 1) then {_this call A3M_fnc_winged;};
if (helion == 1) then {_this call A3M_fnc_heli;};
if (armoredon == 1) then {_this call A3M_fnc_Armor};
if (RoboticsOn == 1) then {_this call A3M_Fnc_Robotics};
if (SupportOn == 1) then {_this call A3M_Fnc_Support};
if (UpgradesOn == 1) then {_this call A3M_Fnc_Upgrades};
};

}; 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Handle Mod Menu Clicks
A3M_fnc_handleModClick= {
ModSelection = _this select 1;
//hint format ["Handle Mod Click Activated. Variable passed was %1", ModSelection];
switch (ModSelection) do {
case 0: {
hint"No mods are required to access this content. Official DLCs may be required in some cases.";
RHS_Support_Enabled = 0;
Ace3_Enabled = 0;
Apex_Enabled = 0;
Iowa_Enabled = 0;
SMA_Enabled = 0;
HLC_Enabled = 0;
lbClear 1575;
_Msg1 = lbAdd [1575,"Stock A3 - Select a Category" ]; 
};
case 1: {
hint"Use of this selection requires a mod to be installed. Please be sure the selected mod is installed prior to purchase";
RHS_Support_Enabled = 1;
Ace3_Enabled = 0;
Apex_Enabled = 0;
Iowa_Enabled = 0;
SMA_Enabled = 0;
HLC_Enabled = 0;
lbClear 1575;
_Msg2 = lbAdd [1575,"RHS: Escalation - Select a Category" ]; 
};

case 2: {
hint "Use of this content may require a mod to be installed. Please be sure the selected mod is installed prior to purchase";
RHS_Support_Enabled = 0;
Apex_Enabled = 0;
Iowa_Enabled = 0;
SMA_Enabled = 0;
HLC_Enabled = 0;
Ace3_Enabled = 1;
lbClear 1575;
_Msg3 = lbAdd [1575,"Ace 3 - Select Support Category." ]; 
};

case 3: {
hint "Use of this content may require a mod to be installed. Please be sure the selected mod is installed prior to purchase";
RHS_Support_Enabled = 0;
Ace3_Enabled = 0;
Iowa_Enabled = 0;
SMA_Enabled = 0;
HLC_Enabled = 0;
Apex_Enabled = 1;
lbClear 1575;
_Msg4 = lbAdd [1575,"Apex Drakon - Select Robotics Category." ]; 
};

case 4: {
hint "Use of this content may require a mod to be installed. Please be sure the selected mod is installed prior to purchase";
RHS_Support_Enabled = 0;
Ace3_Enabled = 0;
Apex_Enabled = 0;
Iowa_Enabled = 1;
SMA_Enabled = 0;
HLC_Enabled = 0;
lbClear 1575;
_Msg5 = lbAdd [1575,"U.S.S. Iowa- Select Support Category." ]; 
};

case 5: {
hint "Use of this content may require a mod to be installed. Please be sure the selected mod is installed prior to purchase";
RHS_Support_Enabled = 0;
Ace3_Enabled = 0;
Apex_Enabled = 0;
Iowa_Enabled = 0;
HLC_Enabled = 0;
SMA_Enabled = 1;
lbClear 1575;
_Msg5 = lbAdd [1575,"Specialist Military Arms - Select Support Category." ]; 
};


case 6: {
hint "Use of this content may require a mod to be installed. Please be sure the selected mod is installed prior to purchase";
HLC_Enabled = 1;
RHS_Support_Enabled = 0;
Ace3_Enabled = 0;
Apex_Enabled = 0;
Iowa_Enabled = 0;
SMA_Enabled = 0;
lbClear 1575;
_Msg5 = lbAdd [1575,"HLC / Toadie2k - Select Support Category." ]; 
};

// End HandleModClick
};
};
//////////////////////////////////////////////////////////////////////
//Handle Winged
A3M_fnc_winged= {
switch (TheSelection) do {

Case 0:{_prat = Rank Player; if ((B_defensebudget<B_Plane_CAS_01_F) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Plane_CAS_01_F]
            } else{
                _MATV="B_Plane_CAS_01_F"createVehicle (getMarkerPos"airspawn"); 
                B_defensebudget= (B_defensebudget-B_Plane_CAS_01_F);    
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+B_Plane_CAS_01_F); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) A-164 Wipeout Anti-Tank Aircraft for $%1, your aircraft will be delivered to the Molos Airfield.", B_Plane_CAS_01_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 1:{_prat = Rank Player; if ((B_defensebudget<O_Plane_CAS_02_F) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_Plane_CAS_02_F]
            } else{
                _MATV="O_Plane_CAS_02_F"createVehicle (getMarkerPos"airspawn"); 
                B_defensebudget= (B_defensebudget-O_Plane_CAS_02_F);    
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+O_Plane_CAS_02_F); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) To-199 Neophronfor $%1, your aircraft will be delivered to the Molos Airfield.", O_Plane_CAS_02_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 2:{_prat = Rank Player; if ((B_defensebudget<RHS_Su25SM_vvs ) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Su25SM_vvs ]
            } else{
                _MATV="RHS_Su25SM_vvs"createVehicle (getMarkerPos"airspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Su25SM_vvs );    
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+RHS_Su25SM_vvs ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) RUS (VVS grey)  Su-25SMfor $%1, your aircraft will be delivered to the Molos Airfield.", RHS_Su25SM_vvs ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 3:{_prat = Rank Player; if ((B_defensebudget<RHS_Su25SM_vvsc ) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Su25SM_vvsc ]
            } else{
                _MATV="RHS_Su25SM_vvsc"createVehicle (getMarkerPos"airspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Su25SM_vvsc );   
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Su25SM_vvsc ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) RUS (VVS camo)  Su-25SMfor $%1, your aircraft will be delivered to the Molos Airfield.", RHS_Su25SM_vvsc ];

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 4:{_prat = Rank Player; if ((B_defensebudget<rhs_a10 ) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_a10 ]
            } else{
                _MATV="rhs_a10"createVehicle (getMarkerPos"airspawn"); 
                B_defensebudget= (B_defensebudget-rhs_a10 );    
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+rhs_a10 ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) A-10A Thunderbolt IIfor $%1, your aircraft will be delivered to the Molos Airfield.", rhs_a10 ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 5:{_prat = Rank Player; if ((B_defensebudget<RHS_C130J ) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_C130J ]
            } else{
                _MATV="RHS_C130J"createVehicle (getMarkerPos"airspawn"); 
                B_defensebudget= (B_defensebudget-RHS_C130J );    
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+RHS_C130J ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) Hercules C-130Jfor $%1, your aircraft will be delivered to the Molos Airfield.", RHS_C130J ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                };
            }; 

default { hint"Something went wrong...Couldn't find case for selection!" };
//Last Bracket for Winged Case
};
};
//////////////////////////////////////////////////////////////////////
//Handle Heli
A3M_fnc_heli= {
switch (TheSelection) do {

Case 0:{_prat = Rank Player;if ((B_defensebudget<B_Heli_Attack_01_F) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Heli_Attack_01_F]
            } else {
                _MATV="B_Heli_Attack_01_F"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-B_Heli_Attack_01_F);  
                publicVariable"B_defensebudget";
                B_totalcost= (B_totalcost+B_Heli_Attack_01_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) AH-99 Blackfoot Attack Helicopter for $%1, your aircraft will be delivered to the Molos Airfield.",B_Heli_Attack_01_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 1:{_prat = Rank Player;if ((B_defensebudget<B_Heli_Transport_01_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Heli_Transport_01_F]
            } else {
                _MATV="B_Heli_Transport_01_F"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-B_Heli_Transport_01_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_Heli_Transport_01_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) UH-80 Ghosthawk Combat Transport Helicopter for $%1, your aircraft will be delivered to the Molos Airfield.",B_Heli_Transport_01_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 2:{_prat = Rank Player;if ((B_defensebudget<B_Heli_Light_01_armed_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Heli_Light_01_armed_F]
            } else {
                _MATV="B_Heli_Light_01_armed_F"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-B_Heli_Light_01_armed_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_Heli_Light_01_armed_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) AH-9 Pawnee Combat Support Helicopter for $%1, your aircraft will be delivered to the Molos Airfield.",B_Heli_Light_01_armed_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 3:{_prat = Rank Player;if ((B_defensebudget<B_Heli_Light_01_F) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Heli_Light_01_F]
            } else {
                _MATV="B_Heli_Light_01_F"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-B_Heli_Light_01_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_Heli_Light_01_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) MH-9 Hummingbird Light Transport Helicopter for $%1, your aircraft will be delivered to the Molos Airfield.",B_Heli_Light_01_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 4:{_prat = Rank Player;if ((B_defensebudget<O_Heli_Light_02_unarmed_F) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_Heli_Light_02_unarmed_F]
            } else {
                _MATV="O_Heli_Light_02_unarmed_F"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-O_Heli_Light_02_unarmed_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_Heli_Light_02_unarmed_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) PO-30 Orca (Black) for $%1, your aircraft will be delivered to the Molos Airfield.",O_Heli_Light_02_unarmed_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 5:{_prat = Rank Player;if ((B_defensebudget<O_Heli_Light_02_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_Heli_Light_02_F]
            } else {
                _MATV="O_Heli_Light_02_F"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-O_Heli_Light_02_F); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_Heli_Light_02_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) PO-30 Orca for $%1, your aircraft will be delivered to the Molos Airfield.",O_Heli_Light_02_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                }; 
        }; 
        
Case 6:{_prat = Rank Player;if ((B_defensebudget<O_Heli_Attack_02_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_Heli_Attack_02_F]
            } else {
                _MATV="O_Heli_Attack_02_F"createVehicle (getMarkerPos"chspawn");
                B_defensebudget= (B_defensebudget-O_Heli_Attack_02_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_Heli_Attack_02_F);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) Mi-48 Kajman for $%1, your aircraft will be delivered to the Molos Airfield.",O_Heli_Attack_02_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
            
Case 7:{_prat = Rank Player;if ((B_defensebudget<O_Heli_Attack_02_black_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_Heli_Attack_02_black_F]
            } else {
                _MATV="O_Heli_Attack_02_black_F"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-O_Heli_Attack_02_black_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_Heli_Attack_02_black_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) Mi-48 Kajman (Black) for $%1, your aircraft will be delivered to the Molos Airfield.",O_Heli_Attack_02_black_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 8:{_prat = Rank Player;if ((B_defensebudget<rhs_ah1z_wd_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah1z_wd_10]
            } else {
                _MATV="rhs_ah1z_wd_10"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ah1z_wd_10);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ah1z_wd_10); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (USMC 2010) AH-1Z (Multi-Role) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah1z_wd_10]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 9:{_prat = Rank Player;if ((B_defensebudget<rhs_ah1z_wd_gs_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah1z_wd_gs_10]
            } else {
                _MATV="rhs_ah1z_wd_gs_10"createVehicle (getMarkerPos"chspawn");
                B_defensebudget= (B_defensebudget-rhs_ah1z_wd_gs_10);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ah1z_wd_gs_10);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (USMC 2010) AH-1Z (Ground-Suppression) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah1z_wd_gs_10]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 10:{_prat = Rank Player;if ((B_defensebudget<rhs_ah1z_wd_cs_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah1z_wd_cs_10]
            } else {
                _MATV="rhs_ah1z_wd_cs_10"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ah1z_wd_cs_10); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ah1z_wd_cs_10); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (USMC 2010) AH-1Z (Close-Support) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah1z_wd_cs_10];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 11:{_prat = Rank Player;if ((B_defensebudget<rhs_ah1z_wd) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah1z_wd]
            } else {
                _MATV="rhs_ah1z_wd"createVehicle (getMarkerPos"chspawn");
                B_defensebudget= (B_defensebudget-rhs_ah1z_wd); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ah1z_wd);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (USMC 2014) AH-1Z (Multi-Role) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah1z_wd]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 12:{_prat = Rank Player;if ((B_defensebudget<rhs_ah1z_wd_gs) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah1z_wd_gs]
            } else {
                _MATV="rhs_ah1z_wd_gs"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ah1z_wd_gs);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ah1z_wd_gs); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (USMC 2014) AH-1Z (Ground-Suppression) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah1z_wd_gs]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 13:{_prat = Rank Player;if ((B_defensebudget<rhs_ah1z_wd_cs) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah1z_wd_cs]
            } else {
                _MATV="rhs_ah1z_wd_cs"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ah1z_wd_cs);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ah1z_wd_cs); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (USMC 2014) AH-1Z (Close-Support) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah1z_wd_cs]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 14:{_prat = Rank Player;if ((B_defensebudget<rhs_ah64dgrey) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah64dgrey]
            } else {
                _MATV="rhs_ah64dgrey"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ah64dgrey); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ah64dgrey); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2010) AH-64D (grey) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah64dgrey];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 15:{_prat = Rank Player;if ((B_defensebudget<rhs_ah64d_wd) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah64d_wd]
            } else {
                _MATV="rhs_ah64d_wd"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ah64d_wd);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ah64d_wd); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2014) AH-64D (Multi-Role) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah64d_wd]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 16:{_prat = Rank Player;if ((B_defensebudget<rhs_ah64d_wd_gs) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah64d_wd_gs]
            } else {
                _MATV="rhs_ah64d_wd_gs"createVehicle (getMarkerPos"chspawn");
                B_defensebudget= (B_defensebudget-rhs_ah64d_wd_gs);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ah64d_wd_gs); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2014) AH-64D (Ground-Suppression) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah64d_wd_gs];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 17:{_prat = Rank Player;if ((B_defensebudget<rhs_ah64d_wd_cs) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah64d_wd_cs]} else {
            _MATV="rhs_ah64d_wd_cs"createVehicle (getMarkerPos"chspawn"); 
            B_defensebudget= (B_defensebudget-rhs_ah64d_wd_cs); 
            publicVariable"B_defensebudget"; 
            B_totalcost= (B_totalcost+rhs_ah64d_wd_cs); 
            publicVariable"B_totalcost";
            hint format ["You have purchased (a/an) USA (Army 2014) AH-64D (Close-Support) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah64d_wd_cs];

            [] call doBudget; 
            [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            
        }; 
    }; 
    
Case 18:{_prat = Rank Player;if ((B_defensebudget<rhs_ah64d_wd_aa) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ah64d_wd_aa]
            } else {
                _MATV="rhs_ah64d_wd_aa"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ah64d_wd_aa);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ah64d_wd_aa);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2014) AH-64D (AA) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ah64d_wd_aa]; 
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 19:{_prat = Rank Player;if ((B_defensebudget<rhs_ch_47f_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ch_47f_10]
            } else {
                _MATV="rhs_ch_47f_10"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ch_47f_10);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ch_47f_10);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2010) CH-47 for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ch_47f_10]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 20:{_prat = Rank Player;if ((B_defensebudget<rhs_ch_47f_light_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ch_47f_light_10]
            } else {
                _MATV="rhs_ch_47f_light_10"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ch_47f_light_10);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ch_47f_light_10);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2010) CH-47 (D) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ch_47f_light_10]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 21:{_prat = Rank Player;if ((B_defensebudget<rhs_ch_47f) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ch_47f]
            } else {
                _MATV="rhs_ch_47f"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ch_47f);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ch_47f); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2014) CH-47 for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ch_47f]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 22:{_prat = Rank Player;if ((B_defensebudget<rhs_ch_47f_light) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ch_47f_light]
            } else {
                _MATV="rhs_ch_47f_light"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ch_47f_light);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ch_47f_light);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2014) CH-47 (D) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ch_47f_light]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 23:{_prat = Rank Player;if ((B_defensebudget<rhs_uh1y) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_uh1y]
            } else {
                _MATV="rhs_uh1y"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_uh1y);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_uh1y); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (USMC 2010) UH-1Y (FFAR/MG) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_uh1y];

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 24:{_prat = Rank Player;if ((B_defensebudget<rhs_uh1y_ffar) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_uh1y_ffar]
            } else {
                _MATV="rhs_uh1y_ffar"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_uh1y_ffar);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_uh1y_ffar); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (USMC 2010) UH-1Y (FFAR) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_uh1y_ffar]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 25:{_prat = Rank Player;if ((B_defensebudget<rhs_uh1y_unarmed) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_uh1y_unarmed]
            } else {
                _MATV="rhs_uh1y_unarmed"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_uh1y_unarmed);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_uh1y_unarmed); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (USMC 2010) UH-1Y (Unarmed) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_uh1y_unarmed]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 26:{_prat = Rank Player;if ((B_defensebudget<rhs_uh60m) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_uh60m]
            } else {
                _MATV="rhs_uh60m"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_uh60m); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_uh60m); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2014) UH-60M for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_uh60m]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 27:{_prat = Rank Player;if ((B_defensebudget<rhs_uh60m_mev2) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_uh60m_mev2]
            } else {
                _MATV="rhs_uh60m_mev2"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_uh60m_mev2); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_uh60m_mev2); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2014) UH-60M MEV for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_uh60m_mev2]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 28:{_prat = Rank Player;if ((B_defensebudget<rhs_uh60m_mev) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_uh60m_mev]
            } else {
                _MATV="rhs_uh60m_mev"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_uh60m_mev);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_uh60m_mev); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) USA (Army 2014) UH-60M MEV (ESSS)for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_uh60m_mev]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 29:{_prat = Rank Player;if ((B_defensebudget<RHS_Ka52_vvs) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Ka52_vvs]
            } else {
                _MATV="RHS_Ka52_vvs"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Ka52_vvs);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Ka52_vvs); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Ka-52 (Grey) for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Ka52_vvs]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 30:{_prat = Rank Player;if ((B_defensebudget<RHS_Ka52_vvsc) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Ka52_vvsc]
            } else {
                _MATV="RHS_Ka52_vvsc"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Ka52_vvsc);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Ka52_vvsc); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Ka-52 (Camo) for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Ka52_vvsc]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 31:{_prat = Rank Player;if ((B_defensebudget<rhs_ka60_grey) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ka60_grey]} else {
            _MATV="rhs_ka60_grey"createVehicle (getMarkerPos"chspawn"); 
            B_defensebudget= (B_defensebudget-rhs_ka60_grey); 
            publicVariable"B_defensebudget"; 
            B_totalcost= (B_totalcost+rhs_ka60_grey); 
            publicVariable"B_totalcost";
            hint format ["You have purchased (a/an) RUS Ka-60 (Grey) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ka60_grey]; 
            
            [] call doBudget; 
            [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            
        }; 
    }; 
    
Case 32:{_prat = Rank Player;if ((B_defensebudget<rhs_ka60_c) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ka60_c]
            } else {
                _MATV="rhs_ka60_c"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-rhs_ka60_c);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_ka60_c);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Ka-60 (Camo) for $%1, your aircraft will be delivered to the Molos Airfield.",rhs_ka60_c]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 33:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi24P_vdv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi24P_vdv]
            } else {
                _MATV="RHS_Mi24P_vdv"createVehicle (getMarkerPos"chspawn");
                B_defensebudget= (B_defensebudget-RHS_Mi24P_vdv); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi24P_vdv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-24P for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi24P_vdv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 34:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi24V_vdv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi24V_vdv]
            } else {
                _MATV="RHS_Mi24V_vdv"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi24V_vdv); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi24V_vdv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-24V for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi24V_vdv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 35:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi24P_vvs) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi24P_vvs]
            } else {
                _MATV="RHS_Mi24P_vvs"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi24P_vvs);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi24P_vvs); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-24P (Grey) for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi24P_vvs];

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 36:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi24V_vvs) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi24V_vvs]
            } else {
                _MATV="RHS_Mi24V_vvs"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi24V_vvs);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi24V_vvs); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-24V (Grey) for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi24V_vvs]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 37:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi24P_vvsc) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi24P_vvsc]
            } else {
                _MATV="RHS_Mi24P_vvsc"createVehicle (getMarkerPos"chspawn");
                B_defensebudget= (B_defensebudget-RHS_Mi24P_vvsc);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi24P_vvsc); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-24P (Camo)for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi24P_vvsc]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 38:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi24V_vvsc) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi24V_vvsc]
            } else {
                _MATV="RHS_Mi24V_vvsc"createVehicle (getMarkerPos"chspawn");
                B_defensebudget= (B_defensebudget-RHS_Mi24V_vvsc);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi24V_vvsc);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-24V (Camo)for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi24V_vvsc]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 39:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8AMT_vdv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8AMT_vdv]
            } else {
                _MATV="RHS_Mi8AMT_vdv"createVehicle (getMarkerPos"chspawn");
                B_defensebudget= (B_defensebudget-RHS_Mi8AMT_vdv); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8AMT_vdv);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8AMT for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8AMT_vdv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 40:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8AMTSh_vdv) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8AMTSh_vdv]
            } else {
                _MATV="RHS_Mi8AMTSh_vdv"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi8AMTSh_vdv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8AMTSh_vdv);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8AMTSh for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8AMTSh_vdv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 41:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8AMT_vvs) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8AMT_vvs]
            } else {
                _MATV="RHS_Mi8AMT_vvs"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi8AMT_vvs); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8AMT_vvs);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8AMT (Grey)for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8AMT_vvs];
                 
                 [] call doBudget; 
                 [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 42:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8AMTSh_vvs) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8AMTSh_vvs]
            } else {
                _MATV="RHS_Mi8AMTSh_vvs"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi8AMTSh_vvs);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8AMTSh_vvs); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8AMTSh (Grey) for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8AMTSh_vvs]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 43:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8AMT_vvsc) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8AMT_vvsc]
            } else {
                _MATV="RHS_Mi8AMT_vvsc"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi8AMT_vvsc);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8AMT_vvsc); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8AMT (Camo) for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8AMT_vvsc]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 44:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8AMTSh_vvsc) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8AMTSh_vvsc]
            } else {
                _MATV="RHS_Mi8AMTSh_vvsc"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi8AMTSh_vvsc);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8AMTSh_vvsc); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8AMTSh (Camo) for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8AMTSh_vvsc]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 45:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8mt_vdv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8mt_vdv]
            } else {
                _MATV="RHS_Mi8mt_vdv"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi8mt_vdv); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8mt_vdv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8MT for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8mt_vdv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 46:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8MTV3_vdv) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8MTV3_vdv]
            } else {
                _MATV="RHS_Mi8MTV3_vdv"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi8MTV3_vdv); 
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+RHS_Mi8MTV3_vdv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8MTV-3for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8MTV3_vdv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 47:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8mt_vvs) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8mt_vvs]
            } else {
                _MATV="RHS_Mi8mt_vvs"createVehicle (getMarkerPos"chspawn");
                B_defensebudget= (B_defensebudget-RHS_Mi8mt_vvs);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8mt_vvs); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)  RUS Mi-8MT (Grey)for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8mt_vvs]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 48:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8MTV3_vvs) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8MTV3_vvs]
            } else {
                _MATV="RHS_Mi8MTV3_vvs"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi8MTV3_vvs);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8MTV3_vvs); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8MTV-3 (Grey) for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8MTV3_vvs]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 49:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8mt_vvsc) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8mt_vvsc]
            } else {
                _MATV="RHS_Mi8mt_vvsc"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi8mt_vvsc);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8mt_vvsc); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8MT (Camo)for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8mt_vvsc]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 50:{_prat = Rank Player;if ((B_defensebudget<RHS_Mi8MTV3_vvsc) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_Mi8MTV3_vvsc]
            } else {
                _MATV="RHS_Mi8MTV3_vvsc"createVehicle (getMarkerPos"chspawn"); 
                B_defensebudget= (B_defensebudget-RHS_Mi8MTV3_vvsc); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_Mi8MTV3_vvsc);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an) RUS Mi-8MTV-3 (Camo) for $%1, your aircraft will be delivered to the Molos Airfield.",RHS_Mi8MTV3_vvsc];

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 

default { hint"Something went wrong...Couldn't find case for selection!" };
};
};
//////////////////////////////////////////////////////////////////////
//Handle Armor
A3M_fnc_armor= {
switch (TheSelection) do {
Case 0:{_prat = Rank Player;if ((B_defensebudget<B_MBT_01_cannon_F) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_MBT_01_cannon_F]
            } else {
                _MATV="B_MBT_01_cannon_F"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-B_MBT_01_cannon_F); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_MBT_01_cannon_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)M2A1 Slammer Battle Tankfor $%1",B_MBT_01_cannon_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 1:{_prat = Rank Player;if ((B_defensebudget<B_MBT_01_mlrs_F) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_MBT_01_mlrs_F]
            } else {
                _MATV="B_MBT_01_mlrs_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-B_MBT_01_mlrs_F); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_MBT_01_mlrs_F);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)M5 Sandstorm MLRSfor $%1",B_MBT_01_mlrs_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 2:{_prat = Rank Player;if ((B_defensebudget<B_APC_Wheeled_01_cannon_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_APC_Wheeled_01_cannon_F]
            } else {
                _MATV="B_APC_Wheeled_01_cannon_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-B_APC_Wheeled_01_cannon_F);
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_APC_Wheeled_01_cannon_F);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)AMV-7 Amphibious APCfor $%1",B_APC_Wheeled_01_cannon_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 3:{_prat = Rank Player;if ((B_defensebudget<B_APC_Tracked_01_rcws_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_APC_Tracked_01_rcws_F]
            } else {
                _MATV="B_APC_Tracked_01_rcws_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-B_APC_Tracked_01_rcws_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_APC_Tracked_01_rcws_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)IFV-6c Panther APCfor $%1",B_APC_Tracked_01_rcws_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 4:{_prat = Rank Player;if ((B_defensebudget<B_APC_Tracked_01_AA_F) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_APC_Tracked_01_AA_F]
            } else {
                _MATV="B_APC_Tracked_01_AA_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-B_APC_Tracked_01_AA_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_APC_Tracked_01_AA_F);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)IFV-6a Cheetah AA Tankfor $%1",B_APC_Tracked_01_AA_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 5:{_prat = Rank Player;if ((B_defensebudget<O_MBT_02_cannon_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_MBT_02_cannon_F]
            } else {
                _MATV="O_MBT_02_cannon_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-O_MBT_02_cannon_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_MBT_02_cannon_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)T-100 Varsuk Battle Tankfor $%1",O_MBT_02_cannon_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 6:{_prat = Rank Player;if ((B_defensebudget<O_MBT_02_arty_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_MBT_02_arty_F]
            } else {
                _MATV="O_MBT_02_arty_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-O_MBT_02_arty_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_MBT_02_arty_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)2S9 Sochor Artilleryfor $%1",O_MBT_02_arty_F]; 
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 7:{_prat = Rank Player;if ((B_defensebudget<O_APC_Tracked_02_cannon_F) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_APC_Tracked_02_cannon_F]
            } else {
                _MATV="O_APC_Tracked_02_cannon_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-O_APC_Tracked_02_cannon_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_APC_Tracked_02_cannon_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)BTR-K Kamysh Amphibious APCfor $%1",O_APC_Tracked_02_cannon_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 8:{_prat = Rank Player;if ((B_defensebudget<O_APC_Wheeled_02_rcws_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_APC_Wheeled_02_rcws_F]
            } else {
                _MATV="O_APC_Wheeled_02_rcws_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-O_APC_Wheeled_02_rcws_F);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_APC_Wheeled_02_rcws_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)MSE-3 Marid APCfor $%1",O_APC_Wheeled_02_rcws_F];

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 9:{_prat = Rank Player;if ((B_defensebudget<O_APC_Tracked_02_AA_F) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_APC_Tracked_02_AA_F]
            } else {
                _MATV="O_APC_Tracked_02_AA_F"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-O_APC_Tracked_02_AA_F); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_APC_Tracked_02_AA_F); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)ZSU-39 Tigris AA Tankfor $%1",O_APC_Tracked_02_AA_F]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 10:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m109_usarmy_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m109_usarmy_10]
            } else {
                _MATV="rhsusf_m109_usarmy_10"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m109_usarmy_10);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m109_usarmy_10); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)US (Army 2010)M109A6 (WD)for $%1",rhsusf_m109_usarmy_10]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };          
        }; 
        
Case 11:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m109d_usarmy_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m109d_usarmy_10]
            } else {
                _MATV="rhsusf_m109d_usarmy_10"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m109d_usarmy_10); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m109d_usarmy_10); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)US (Army 2010)M109A6 (D)for $%1",rhsusf_m109d_usarmy_10];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 12:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m109_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m109_usarmy]
            } else {
                _MATV="rhsusf_m109_usarmy"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m109_usarmy); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m109_usarmy); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)US (Army 2014)M109A6 (WD)for $%1",rhsusf_m109_usarmy];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 13:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m109d_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m109d_usarmy]
            } else {
                _MATV="rhsusf_m109d_usarmy"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m109d_usarmy); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m109d_usarmy); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)US (Army 2014)M109A6 (D)for $%1",rhsusf_m109d_usarmy]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 14:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m113_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m113_usarmy]
            } else {
                _MATV="rhsusf_m113_usarmy"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhsusf_m113_usarmy);  
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+rhsusf_m113_usarmy); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)US (Army 2010)M113A3 (WD)for $%1",rhsusf_m113_usarmy]; 
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 15:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m113d_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m113d_usarmy]
            } else {
                _MATV="rhsusf_m113d_usarmy"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhsusf_m113d_usarmy); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m113d_usarmy);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)US (Army 2010)M113A3 (D)for $%1",rhsusf_m113d_usarmy]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 16:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a1aimwd_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a1aimwd_usarmy]
            } else {
                _MATV="rhsusf_m1a1aimwd_usarmy"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m1a1aimwd_usarmy);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1a1aimwd_usarmy); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2010) M1A1AIMfor $%1",rhsusf_m1a1aimwd_usarmy]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 17:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a1aim_tuski_wd) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a1aim_tuski_wd]
            } else {
                _MATV="rhsusf_m1a1aim_tuski_wd"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m1a1aim_tuski_wd);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1a1aim_tuski_wd); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2010) M1A1AIM (TUSK I)(WD)for $%1",rhsusf_m1a1aim_tuski_wd]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 18:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a1fep_wd) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a1fep_wd]
            } else {_MATV="rhsusf_m1a1fep_wd"createVehicle (getMarkerPos"vehspawn");
            B_defensebudget= (B_defensebudget-rhsusf_m1a1fep_wd);  
            publicVariable"B_defensebudget";  
            B_totalcost= (B_totalcost+rhsusf_m1a1fep_wd);
            publicVariable"B_totalcost";
            hint format ["You have purchased (a/an)USA (USMC 2010) M1A1FEP  (WD)for $%1",rhsusf_m1a1fep_wd]; 
            
            [] call doBudget; 
            [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
        }; 
    }; 
    
Case 19:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a1fep_od) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a1fep_od]
            } else {
                _MATV="rhsusf_m1a1fep_od"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhsusf_m1a1fep_od);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1a1fep_od); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC 2010) M1A1FEP (Olive) (WD)for $%1",rhsusf_m1a1fep_od];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 20:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a1aimd_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a1aimd_usarmy]
            } else {
                _MATV="rhsusf_m1a1aimd_usarmy"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m1a1aimd_usarmy);
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1a1aimd_usarmy);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2010) M1A1AIM  (D)for $%1",rhsusf_m1a1aimd_usarmy]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 21:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a1aim_tuski_d) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a1aim_tuski_d]
            } else {
                _MATV="rhsusf_m1a1aim_tuski_d"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m1a1aim_tuski_d);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1a1aim_tuski_d);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2010) M1A1AIM (TUSK I)(D)for $%1",rhsusf_m1a1aim_tuski_d]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 22:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a1fep_d) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a1fep_d]
            } else {
                _MATV="rhsusf_m1a1fep_d"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m1a1fep_d); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1a1fep_d); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC 2010) M1A1FEP (D)for $%1",rhsusf_m1a1fep_d];

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 23:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a2sep1wd_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a2sep1wd_usarmy]
            } else {
                _MATV="rhsusf_m1a2sep1wd_usarmy"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m1a2sep1wd_usarmy); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1a2sep1wd_usarmy); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M1A2SEPv1 (WD)for $%1",rhsusf_m1a2sep1wd_usarmy]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 24:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a2sep1tuskiwd_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a2sep1tuskiwd_usarmy]
            } else {
                _MATV="rhsusf_m1a2sep1tuskiwd_usarmy"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m1a2sep1tuskiwd_usarmy);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1a2sep1tuskiwd_usarmy);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M1A2SEPv1 (Tusk I)(WD)for $%1",rhsusf_m1a2sep1tuskiwd_usarmy]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 25:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a2sep1d_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a2sep1d_usarmy]
            } else {
                _MATV="rhsusf_m1a2sep1d_usarmy"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m1a2sep1d_usarmy);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1a2sep1d_usarmy); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M1A2SEPv1 (D)for $%1",rhsusf_m1a2sep1d_usarmy]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 26:{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1a2sep1tuskid_usarmy) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1a2sep1tuskid_usarmy]
            } else {
                _MATV="rhsusf_m1a2sep1tuskid_usarmy"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhsusf_m1a2sep1tuskid_usarmy); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1a2sep1tuskid_usarmy); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M1A2SEPv1 (Tusk I)(D)for $%1",rhsusf_m1a2sep1tuskid_usarmy]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 27:{_prat = Rank Player;if ((B_defensebudget<rhs_m2a2_wd) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_m2a2_wd]
            } else {
                _MATV="rhs_m2a2_wd"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_m2a2_wd); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_m2a2_wd);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2010) M2A2ODS (WD)for $%1",rhs_m2a2_wd]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 28:{_prat = Rank Player;if ((B_defensebudget<rhs_m2a2_buski_wd) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_m2a2_buski_wd]
            } else {
                _MATV="rhs_m2a2_buski_wd"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_m2a2_buski_wd);  
                publicVariable"B_defensebudget";
                B_totalcost= (B_totalcost+rhs_m2a2_buski_wd);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2010) M2A2ODS (BUSK I)(WD)for $%1",rhs_m2a2_buski_wd]; 
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 29:{_prat = Rank Player;if ((B_defensebudget<rhs_m2a2) OR ( _prat != B_Maxrank)) then { 
    hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_m2a2]
        } else {
            _MATV="rhs_m2a2"createVehicle (getMarkerPos"vehspawn"); 
            B_defensebudget= (B_defensebudget-rhs_m2a2);  
            publicVariable"B_defensebudget"; 
            B_totalcost= (B_totalcost+rhs_m2a2); 
            publicVariable"B_totalcost";
            hint format ["You have purchased (a/an)USA (Army 2010) M2A2ODS (D)for $%1",rhs_m2a2]; 
            
            [] call doBudget; 
            [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
        }; 
    }; 
    
Case 30:{_prat = Rank Player;if ((B_defensebudget<rhs_m2a2_buski) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_m2a2_buski]
            } else {
                _MATV="rhs_m2a2_buski"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_m2a2_buski);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_m2a2_buski);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2010) M2A2ODS (BUSK I)(WD)for $%1",rhs_m2a2_buski]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 31:{_prat = Rank Player;if ((B_defensebudget<RHS_M2A3_wd) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_M2A3_wd]
            } else {
                _MATV="RHS_M2A3_wd"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-RHS_M2A3_wd);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_M2A3_wd); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M2A3 (WD)for $%1",RHS_M2A3_wd];

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 32:{_prat = Rank Player;if ((B_defensebudget<RHS_M2A3_BUSKI_wd) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_M2A3_BUSKI_wd]
            } else {
                _MATV="RHS_M2A3_BUSKI_wd"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-RHS_M2A3_BUSKI_wd); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_M2A3_BUSKI_wd); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M2A3 (BUSK I) (WD)for $%1",RHS_M2A3_BUSKI_wd]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 33:{_prat = Rank Player;if ((B_defensebudget<RHS_M2A3_BUSKIII_wd) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_M2A3_BUSKIII_wd]
            } else {
                _MATV="RHS_M2A3_BUSKIII_wd"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-RHS_M2A3_BUSKIII_wd);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_M2A3_BUSKIII_wd); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M2A3 (BUSK III) (WD)for $%1",RHS_M2A3_BUSKIII_wd]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 34:{_prat = Rank Player;if ((B_defensebudget<RHS_M2A3) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_M2A3]
    } else {
        _MATV="RHS_M2A3"createVehicle (getMarkerPos"vehspawn"); 
        B_defensebudget= (B_defensebudget-RHS_M2A3);  
        publicVariable"B_defensebudget"; 
        B_totalcost= (B_totalcost+RHS_M2A3); 
        publicVariable"B_totalcost";
        hint format ["You have purchased (a/an)USA (Army 2014) M2A3 (D)for $%1",RHS_M2A3]; 
        
        [] call doBudget; 
        [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
    }; 
}; 
Case 35:{_prat = Rank Player;if ((B_defensebudget<RHS_M2A3_BUSKI) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_M2A3_BUSKI]
            } else {
                _MATV="RHS_M2A3_BUSKI"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-RHS_M2A3_BUSKI);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_M2A3_BUSKI); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M2A3 (BUSK I)(D)for $%1",RHS_M2A3_BUSKI]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 36:{_prat = Rank Player;if ((B_defensebudget<RHS_M2A3_BUSKIII) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_M2A3_BUSKIII]
            } else {
                _MATV="RHS_M2A3_BUSKIII"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-RHS_M2A3_BUSKIII);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_M2A3_BUSKIII); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M2A3 (BUSK III)(D)for $%1",RHS_M2A3_BUSKIII]; 
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 37:{_prat = Rank Player;if ((B_defensebudget<rhs_m6_wd_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_m6_wd_10]
            } else {
                _MATV="rhs_m6_wd_10"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_m6_wd_10);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_m6_wd_10); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2010) M6 (WD)for $%1",rhs_m6_wd_10]; 
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 38:{_prat = Rank Player;if ((B_defensebudget<rhs_m6_wd) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_m6_wd]
            } else {
                _MATV="rhs_m6_wd"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_m6_wd);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_m6_wd); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M6 (WD)for $%1",rhs_m6_wd]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                
            }; 
        }; 
        
Case 39:{_prat = Rank Player;if ((B_defensebudget<rhs_m6_10) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_m6_10]
            } else {
                _MATV="rhs_m6_10"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_m6_10);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_m6_10); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2010) M6 (D)for $%1",rhs_m6_10]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                
            };
        }; 
        
Case 40:{_prat = Rank Player;if ((B_defensebudget<rhs_m6) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_m6]
            } else {
                _MATV="rhs_m6"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_m6);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_m6); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M6 (D)for $%1",rhs_m6]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 41:{_prat = Rank Player;if ((B_defensebudget<rhs_sprut_vdv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_sprut_vdv]
            } else {
                _MATV="rhs_sprut_vdv"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_sprut_vdv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_sprut_vdv);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS 2S25for $%1",rhs_sprut_vdv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 42:{_prat = Rank Player;if ((B_defensebudget<rhs_2s3_tv) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_2s3_tv]
            } else {
                _MATV="rhs_2s3_tv"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_2s3_tv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_2s3_tv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS 2S3Mfor $%1",rhs_2s3_tv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 43:{_prat = Rank Player;if ((B_defensebudget<RHS_BM21_MSV_01) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,RHS_BM21_MSV_01]
            } else {
                _MATV="RHS_BM21_MSV_01"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-RHS_BM21_MSV_01);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+RHS_BM21_MSV_01); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BM-21for $%1",RHS_BM21_MSV_01]; 
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 44:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd1) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd1]
            } else {
                _MATV="rhs_bmd1"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmd1);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd1); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMD-1for $%1",rhs_bmd1]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 45:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd1k) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd1k]
            } else {
                _MATV="rhs_bmd1k"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmd1k);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd1k); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMD-1Kfor $%1",rhs_bmd1k]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 46:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd1p) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd1p]
            } else {
                _MATV="rhs_bmd1p"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmd1p);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd1p); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMD-1Pfor $%1",rhs_bmd1p]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 47:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd1pk) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd1pk]
            } else {
                _MATV="rhs_bmd1pk"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_bmd1pk);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd1pk);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMD-1PKfor $%1",rhs_bmd1pk]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 48:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd1r) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd1r]
            } else {
                _MATV="rhs_bmd1r"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_bmd1r);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd1r); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMD-1Rfor $%1",rhs_bmd1r]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 49:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd2) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd2]
            } else {
                _MATV="rhs_bmd2"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmd2);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd2); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMD-2for $%1",rhs_bmd2]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 50:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd2k) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd2k]
            } else {
                _MATV="rhs_bmd2k"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmd2k);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd2k); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMD-2Kfor $%1",rhs_bmd2k]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 51:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd2m) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd2m]
            } else {
                _MATV="rhs_bmd2m"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmd2m);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd2m); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMD-2Mfor $%1",rhs_bmd2m]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 52:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd4_vdv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd4_vdv]
            } else {
                _MATV="rhs_bmd4_vdv"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_bmd4_vdv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd4_vdv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BDM-4for $%1",rhs_bmd4_vdv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 53:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd4m_vdv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd4m_vdv]
            } else {
                _MATV="rhs_bmd4m_vdv"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmd4m_vdv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd4m_vdv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BDM-4Mfor $%1",rhs_bmd4m_vdv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 54:{_prat = Rank Player;if ((B_defensebudget<rhs_bmd4ma_vdv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmd4ma_vdv]
            } else {
                _MATV="rhs_bmd4ma_vdv"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_bmd4ma_vdv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmd4ma_vdv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BDM-4M (A)for $%1",rhs_bmd4ma_vdv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                
            }; 
        }; 
        
Case 55:{_prat = Rank Player;if ((B_defensebudget<rhs_bmp1_VDV) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmp1_VDV]
            } else {
                _MATV="rhs_bmp1_VDV"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmp1_VDV);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmp1_VDV); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMP-1for $%1",rhs_bmp1_VDV]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 56:{_prat = Rank Player;if ((B_defensebudget<rhs_bmp1p_VDV) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmp1p_VDV]
            } else {
                _MATV="rhs_bmp1p_VDV"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmp1p_VDV);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmp1p_VDV); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMP-1Pfor $%1",rhs_bmp1p_VDV]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                
            };
        }; 
        
Case 57:{_prat = Rank Player;if ((B_defensebudget<rhs_bmp1k_VDV) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmp1k_VDV]
            } else {
                _MATV="rhs_bmp1k_VDV"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmp1k_VDV);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmp1k_VDV); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMP-1Kfor $%1",rhs_bmp1k_VDV]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 58:{_prat = Rank Player;if ((B_defensebudget<rhs_bmp1d_VDV) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmp1d_VDV]
            } else {
                _MATV="rhs_bmp1d_VDV"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmp1d_VDV);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmp1d_VDV); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMP-1Dfor $%1",rhs_bmp1d_VDV]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 59:{_prat = Rank Player;if ((B_defensebudget<rhs_bmp2e_VDV) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmp2e_VDV]
            } else {
                _MATV="rhs_bmp2e_VDV"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmp2e_VDV);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmp2e_VDV); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMP-2 (E)for $%1",rhs_bmp2e_VDV]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 60:{_prat = Rank Player;if ((B_defensebudget<rhs_bmp2_VDV) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmp2_VDV]
            } else {
                _MATV="rhs_bmp2_VDV"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmp2_VDV);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmp2_VDV); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMP-2for $%1",rhs_bmp2_VDV]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 61:{_prat = Rank Player;if ((B_defensebudget<rhs_bmp2k_VDV) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmp2k_VDV]
            } else {
                _MATV="rhs_bmp2k_VDV"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmp2k_VDV);  
                publicVariable"B_defensebudget";
                B_totalcost= (B_totalcost+rhs_bmp2k_VDV); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMP-2Kfor $%1",rhs_bmp2k_VDV]; 
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 62:{_prat = Rank Player;if ((B_defensebudget<rhs_bmp2d_VDV) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_bmp2d_VDV]
            } else {
                _MATV="rhs_bmp2d_VDV"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_bmp2d_VDV);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_bmp2d_VDV); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BMP-2Dfor $%1",rhs_bmp2d_VDV]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 63:{_prat = Rank Player;if ((B_defensebudget<rhs_brm1k_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_brm1k_msv]
            } else {
                _MATV="rhs_brm1k_msv"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_brm1k_msv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_brm1k_msv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BRM-1Kfor $%1",rhs_brm1k_msv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 64:{_prat = Rank Player;if ((B_defensebudget<rhs_btr60_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_btr60_msv]
            } else {
                _MATV="rhs_btr60_msv"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_btr60_msv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_btr60_msv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BTR-60for $%1",rhs_btr60_msv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 65:{_prat = Rank Player;if ((B_defensebudget<rhs_btr70_msv) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_btr70_msv]
            } else {
                _MATV="rhs_btr70_msv"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_btr70_msv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_btr70_msv);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BTR-70for $%1",rhs_btr70_msv]; 
                
                [] call doBudget; 
                
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
                
            }; 
        }; 
        
Case 66:{_prat = Rank Player;if ((B_defensebudget<rhs_btr80_msv) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_btr80_msv]
            } else {
                _MATV="rhs_btr80_msv"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_btr80_msv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_btr80_msv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BTR-80for $%1",rhs_btr80_msv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 67:{_prat = Rank Player;if ((B_defensebudget<rhs_btr80a_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_btr80a_msv]
            } else {
                _MATV="rhs_btr80a_msv"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_btr80a_msv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_btr80a_msv);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS BTR-80Afor $%1",rhs_btr80a_msv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 68:{_prat = Rank Player;if ((B_defensebudget<rhs_prp3_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_prp3_msv]
            } else {
                _MATV="rhs_prp3_msv"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_prp3_msv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_prp3_msv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS PRP-3for $%1",rhs_prp3_msv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 69:{_prat = Rank Player;if ((B_defensebudget<rhs_t72ba_tv) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t72ba_tv]
            } else {
                _MATV="rhs_t72ba_tv"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_t72ba_tv); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t72ba_tv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-72B (obr. 1984g.)for $%1",rhs_t72ba_tv];

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 70:{_prat = Rank Player;if ((B_defensebudget<rhs_t72bb_tv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t72bb_tv]
            } else {
                _MATV="rhs_t72bb_tv"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t72bb_tv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t72bb_tv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-72B (obr. 1985g.)for $%1",rhs_t72bb_tv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 71:{_prat = Rank Player;if ((B_defensebudget<rhs_t72bc_tv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t72bc_tv]
            } else {
                _MATV="rhs_t72bc_tv"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t72bc_tv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t72bc_tv);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-72B (obr. 1989g.for $%1",rhs_t72bc_tv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 72:{_prat = Rank Player;if ((B_defensebudget<rhs_t72bd_tv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t72bd_tv]
            } else {
                _MATV="rhs_t72bd_tv"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_t72bd_tv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t72bd_tv);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-72B3 (obr. 2012g.)for $%1",rhs_t72bd_tv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 73:{_prat = Rank Player;if ((B_defensebudget<rhs_t80) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t80]
            } else {
                _MATV="rhs_t80"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t80);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t80); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-80for $%1",rhs_t80];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 74:{_prat = Rank Player;if ((B_defensebudget<rhs_t80a) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t80a]
            } else {
                _MATV="rhs_t80a"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t80a);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t80a); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-80Afor $%1",rhs_t80a];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 75:{_prat = Rank Player;if ((B_defensebudget<rhs_t80b) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t80b]
            } else {
                _MATV="rhs_t80b"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t80b);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t80b);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-80Bfor $%1",rhs_t80b]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 76:{_prat = Rank Player;if ((B_defensebudget<rhs_t80bk) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t80bk]
            } else {
                _MATV="rhs_t80bk"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t80bk);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t80bk); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-80BKfor $%1",rhs_t80bk]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 77:{_prat = Rank Player;if ((B_defensebudget<rhs_t80bv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t80bv]
            } else {
                _MATV="rhs_t80bv"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t80bv);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t80bv); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-80BVfor $%1",rhs_t80bv]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        }; 
        
Case 78:{_prat = Rank Player;if ((B_defensebudget<rhs_t80bvk) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t80bvk]
            } else {
                _MATV="rhs_t80bvk"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget-rhs_t80bvk);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t80bvk); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-80BVKfor $%1",rhs_t80bvk]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 79:{_prat = Rank Player;if ((B_defensebudget<rhs_t80u) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t80u]
            } else {
                _MATV="rhs_t80u"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t80u);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t80u); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-80Ufor $%1",rhs_t80u]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 80:{_prat = Rank Player;if ((B_defensebudget<rhs_t80ue1) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t80ue1]
            } else {
                _MATV="rhs_t80ue1"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t80ue1);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t80ue1); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-80UE1for $%1",rhs_t80ue1]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 81:{_prat = Rank Player;if ((B_defensebudget<rhs_t80u45m) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t80u45m]
            } else {
                _MATV="rhs_t80u45m"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t80u45m); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t80u45m); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-80U45Mfor $%1",rhs_t80u45m]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 82:{_prat = Rank Player;if ((B_defensebudget<rhs_t80um) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_t80um]
            } else {
                _MATV="rhs_t80um"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_t80um);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_t80um); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS T-80UMfor $%1",rhs_t80um];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
Case 83:{_prat = Rank Player;if ((B_defensebudget<rhs_zsu234_aa) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_zsu234_aa]
            } else {
                _MATV="rhs_zsu234_aa"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget-rhs_zsu234_aa);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_zsu234_aa); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)RUS ZSU-23-4 (TV)for $%1",rhs_zsu234_aa];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        }; 
        
default { hint"Something went wrong...Couldn't find case for selection!" };
// End of Armor Block
};
};
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Handle Wheeled Vehicles
A3M_fnc_wheeled= {
switch (TheSelection) do {
Case 0:{_prat = Rank Player;if ((B_defensebudget<B_MRAP_01_F ) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_MRAP_01_F ]
            } else {
                _MATV="B_MRAP_01_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- B_MRAP_01_F );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_MRAP_01_F );
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)MAT-V Unarmed Vehiclefor $%1",B_MRAP_01_F ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        };
        
Case 1:{_prat = Rank Player;if ((B_defensebudget<B_MRAP_01_hmg_F ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_MRAP_01_hmg_F ]
            } else {
                _MATV="B_MRAP_01_hmg_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- B_MRAP_01_hmg_F );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_MRAP_01_hmg_F ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)MAT-V Armed (.50 HMG)for $%1",B_MRAP_01_hmg_F ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        };
        
Case 2:{_prat = Rank Player;if ((B_defensebudget<B_MRAP_01_gmg_F ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_MRAP_01_gmg_F ]
            } else {
                _MATV="B_MRAP_01_gmg_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- B_MRAP_01_gmg_F );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_MRAP_01_gmg_F ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)MAT-V Armed (40mm GMG)for $%1",B_MRAP_01_gmg_F ]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 3:{_prat = Rank Player;if ((B_defensebudget<B_Truck_01_covered_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Truck_01_covered_F]
            } else {
                _MATV="B_Truck_01_covered_F" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- B_Truck_01_covered_F );   
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+ B_Truck_01_covered_F );
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) HEMTT Troop Transport - Covered for $%1", B_Truck_01_covered_F ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 4:{_prat = Rank Player;if ((B_defensebudget<B_Truck_01_transport_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Truck_01_transport_F]
            } else {
                _MATV="B_Truck_01_transport_F" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- B_Truck_01_transport_F  ); 
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+  B_Truck_01_transport_F  ); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) HEMTT Troop Transport - Open for $%1", B_Truck_01_transport_F ];
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 5:{_prat = Rank Player;if ((B_defensebudget<B_Quadbike_01_F ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Quadbike_01_F ]
            } else {
                _MATV="B_Quadbike_01_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- B_Quadbike_01_F );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+B_Quadbike_01_F ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)ATV for $%1",B_Quadbike_01_F ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 6:{_prat = Rank Player;if ((B_defensebudget<O_MRAP_02_F ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_MRAP_02_F ]
            } else {
                _MATV="O_MRAP_02_F"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- O_MRAP_02_F ); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_MRAP_02_F ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)Ifrit Unarmed Vehiclefor $%1",O_MRAP_02_F ];

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 7:{_prat = Rank Player;if ((B_defensebudget<O_MRAP_02_hmg_F ) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_MRAP_02_hmg_F ]
            } else {
                _MATV="O_MRAP_02_hmg_F"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- O_MRAP_02_hmg_F );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_MRAP_02_hmg_F ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)Ifrit Armed (.50 HMG)for $%1",O_MRAP_02_hmg_F ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        };
        
Case 8:{_prat = Rank Player;if ((B_defensebudget<O_MRAP_02_gmg_F ) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_MRAP_02_gmg_F ]
            } else {
                _MATV="O_MRAP_02_gmg_F"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- O_MRAP_02_gmg_F );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+O_MRAP_02_gmg_F ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)Ifrit Armed (40mm GMG)for $%1",O_MRAP_02_gmg_F ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 9:{_prat = Rank Player;if ((B_defensebudget<O_Truck_02_covered_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_Truck_02_covered_F]
            } else {
                _MATV="O_Truck_02_covered_F" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- O_Truck_02_covered_F );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+ O_Truck_02_covered_F ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) Zamak Troop Transport - Covered for $%1", O_Truck_02_covered_F ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 10 :{_prat = Rank Player;if ((B_defensebudget<O_Truck_02_transport_F) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,O_Truck_02_transport_F]
            } else {
                _MATV="O_Truck_02_transport_F" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- O_Truck_02_transport_F ); 
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+  O_Truck_02_transport_F  ); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) Zamak Troop Transport - Open for $%1", O_Truck_02_transport_F];
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
    };
    
Case 11 :{_prat = Rank Player;if ((B_defensebudget<rhs_tigr_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_tigr_msv]
            } else {
                _MATV="rhs_tigr_msv" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhs_tigr_msv   ); 
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+rhs_tigr_msv);
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) Gaz 233011 Tigr for $%1", rhs_tigr_msv];
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 12 :{_prat = Rank Player;if ((B_defensebudget<rhs_gaz66_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_gaz66_msv]
            } else {
                _MATV="rhs_gaz66_msv" createVehicle (getMarkerPos"vehspawn");   
                B_defensebudget= (B_defensebudget- rhs_gaz66_msv);
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_gaz66_msv); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an) GAZ-66 for $%1", rhs_gaz66_msv];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 13 :{_prat = Rank Player;if ((B_defensebudget<rhs_gaz66o_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_gaz66o_msv]
            } else {
                _MATV="rhs_gaz66o_msv" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhs_gaz66o_msv); 
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+ rhs_gaz66o_msv); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) GAZ-66 (Open) for $%1", rhs_gaz66o_msv];
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 14 :{_prat = Rank Player;if ((B_defensebudget<rhs_gaz66_r142_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_gaz66_r142_msv]
            } else {
                _MATV="rhs_gaz66_r142_msv" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhs_gaz66_r142_msv); 
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+rhs_gaz66_r142_msv); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) GAZ-66 (R-142N) for $%1", rhs_gaz66_r142_msv];
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        };
        
Case 15 :{_prat = Rank Player;if ((B_defensebudget<rhs_gaz66_ap2_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_gaz66_ap2_msv]
            } else {
                _MATV="rhs_gaz66_ap2_msv"  createVehicle (getMarkerPos"vehspawn");   
                B_defensebudget= (B_defensebudget- rhs_gaz66_ap2_msv  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+rhs_gaz66_ap2_msv);
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) GAZ-66 (AP-2) for $%1", rhs_gaz66_ap2_msv];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 16 :{_prat = Rank Player;if ((B_defensebudget<rhs_gaz66_repair_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_gaz66_repair_msv]
            } else {
                _MATV="rhs_gaz66_repair_msv" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhs_gaz66_repair_msv );   
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+ rhs_gaz66_repair_msv); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) GAZ-66 (ESB-8IM) for $%1", rhs_gaz66_repair_msv ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 17 :{_prat = Rank Player;if ((B_defensebudget<rhs_typhoon_vdv ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_typhoon_vdv ]
            } else {
                _MATV="rhs_typhoon_vdv" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhs_typhoon_vdv );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_typhoon_vdv ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)Kamaz-63968for $%1",rhs_typhoon_vdv ]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 18 :{_prat = Rank Player;if ((B_defensebudget<rhs_uaz_msv ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_uaz_msv ]
            } else {
                _MATV="rhs_uaz_vdv" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhs_uaz_msv );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhs_uaz_msv ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)UAZ-469 for $%1",rhs_uaz_msv ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 19 :{_prat = Rank Player;if ((B_defensebudget<rhs_ural_msv) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ural_msv]
            } else {
                _MATV="rhs_ural_msv" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhs_ural_msv );   
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+ rhs_ural_msv ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) URAL-4320 for $%1", rhs_ural_msv ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            
            }; 
        };
        
Case 20 :{_prat = Rank Player;if ((B_defensebudget<rhs_ural_open_msv) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_ural_open_msv]
            } else {
                _MATV="rhs_ural_open_msv" createVehicle (getMarkerPos"vehspawn");   
                B_defensebudget= (B_defensebudget- rhs_ural_open_msv  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+rhs_ural_open_msv); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an) URAL-4320 (Open) for $%1",  rhs_ural_open_msv  ];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 21 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1025_w) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1025_w]
            } else {
                _MATV="rhsusf_m1025_w" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_m1025_w); 
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+rhsusf_m1025_w); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) USA (Army - Woodland )  M1025A2 (Unarmed) for $%1", rhsusf_m1025_w];
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 22 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1025_d) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1025_d]
            } else {
                _MATV="rhsusf_m1025_d" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_m1025_d  );
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+  rhsusf_m1025_d  ); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) USA (Army - Desert ) M1025A2 (Unarmed) for $%1", rhsusf_m1025_d  ];
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 23 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1025_w_s) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1025_w_s]
            } else {
                _MATV="rhsusf_m1025_w_s" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_m1025_w_s );   
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+ rhsusf_m1025_w_s ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) USA (USMC - Woodland ) M1025A2 (Unarmed/Snorkel) for $%1", rhsusf_m1025_w_s ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 24 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1025_w_s) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1025_w_s]
            } else {
                _MATV="rhsusf_m1025_w_s" createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_m1025_w_s );   
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+ rhsusf_m1025_w_s ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) USA (USMC - Desert) M1025A2 (Unarmed/Snorkel) for $%1", rhsusf_m1025_w_s ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            
            }; 
        };
        
Case 25 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1025_w_m2) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1025_w_m2]
            } else {
                _MATV="rhsusf_m1025_w_m2" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_m1025_w_m2  );
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+  rhsusf_m1025_w_m2); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an) USA (Army - Woodland) M1025A2 (M2) for $%1", rhsusf_m1025_w_m2];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 26 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1025_d_m2) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1025_d_m2]
            } else {
                _MATV="rhsusf_m1025_d_m2" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_m1025_d_m2);
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+  rhsusf_m1025_d_m2  ); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an)  USA (Army - Desert )M1025A2 (M2)  for $%1",  rhsusf_m1025_d_m2  ];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 27 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1025_w_s_m2) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1025_w_s_m2]
            } else {
                _MATV="rhsusf_m1025_w_s_m2"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_m1025_w_s_m2);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1025_w_s_m2);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Woodland )M1025A2 (M2/Snorkel)for $%1",rhsusf_m1025_w_s_m2]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        };
        
Case 28 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m1025_d_s_m2) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m1025_d_s_m2]
            } else {
                _MATV="rhsusf_m1025_d_s_m2"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_m1025_d_s_m2);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m1025_d_s_m2); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Desert )  M1025A2 (M2/Snorkel)for $%1",rhsusf_m1025_d_s_m2]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
                
            }; 
        }
        ;
Case 29 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1078A1P2_wd_fmtv_usarmy) OR ( _prat != B_Maxrank)) then {

        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1078A1P2_wd_fmtv_usarmy]
        } else {
            _MATV="rhsusf_M1078A1P2_wd_fmtv_usarmy"createVehicle (getMarkerPos"vehspawn");
            B_defensebudget= (B_defensebudget-rhsusf_M1078A1P2_wd_fmtv_usarmy); 
            publicVariable"B_defensebudget"; 
            B_totalcost= (B_totalcost+rhsusf_M1078A1P2_wd_fmtv_usarmy);
            publicVariable"B_totalcost";
            hint format ["You have purchased (a/an)USA (Army 2014) M1078A1P2for $%1",rhsusf_M1078A1P2_wd_fmtv_usarmy]; 
            
            [] call doBudget; 
            [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
        }; 
    };
    
Case 30 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1078A1P2_wd_open_fmtv_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1078A1P2_wd_open_fmtv_usarmy]
            } else {
                _MATV="rhsusf_M1078A1P2_wd_open_fmtv_usarmy" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_M1078A1P2_wd_open_fmtv_usarmy );   
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+ rhsusf_M1078A1P2_wd_open_fmtv_usarmy );
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) USA (Army 2014) M1078A1P2 (Open) for $%1", rhsusf_M1078A1P2_wd_open_fmtv_usarmy ];  
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 31 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy]
            } else {
                _MATV="rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2014) M1078A1P2 (Flatbed)for $%1",rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 32 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1078A1P2_B_wd_fmtv_usarmy) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1078A1P2_B_wd_fmtv_usarmy]
            } else {
                _MATV="rhsusf_M1078A1P2_B_wd_fmtv_usarmy"  createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_M1078A1P2_B_wd_fmtv_usarmy  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+  rhsusf_M1078A1P2_B_wd_fmtv_usarmy  ); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an)  USA (Army 2014)  M1078A1P2-B  for $%1",  rhsusf_M1078A1P2_B_wd_fmtv_usarmy  ];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        };
        
Case 33 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy]
            } else {
                _MATV="rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy  );
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) USA (Army 2014)M1078A1P2-B (Open) for $%1", rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy  ];
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        };
        
Case 34 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy]
            } else {
                _MATV="rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy"  createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy );
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+  rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy  ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) USA (Army 2014)  M1078A1P2-B (Flatbed) for $%1",  rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy  ];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 35 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy]
            } else {
                _MATV="rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy );   
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+ rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) USA (Army 2014)  M1078A1P2-B (M2) for $%1", rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 36 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy]
            } else {
                _MATV="rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy"  createVehicle (getMarkerPos"vehspawn");   
                B_defensebudget= (B_defensebudget- rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+  rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy  ); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an)  USA (Army 2014)  M1078A1P2-B (M2/Open) for $%1", rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 37 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy]
            } else {
                _MATV="rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy ); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+ rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) USA (Army 2014) M1078A1P2-B (M2/Flatbed) for $%1", rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 38 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1083A1P2_wd_fmtv_usarmy_10) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1083A1P2_wd_fmtv_usarmy_10]
            } else {
                _MATV="rhsusf_M1083A1P2_wd_fmtv_usarmy_10" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_M1083A1P2_wd_fmtv_usarmy_10  ); 
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+  rhsusf_M1083A1P2_wd_fmtv_usarmy_10); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) USA (Army 2010)M1083A1P2 for $%1", rhsusf_M1083A1P2_wd_fmtv_usarmy_10 ];
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 39 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1083A1P2_wd_open_fmtv_usarmy_10 ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1083A1P2_wd_open_fmtv_usarmy_10 ]
            } else {
                _MATV=" rhsusf_M1083A1P2_wd_open_fmtv_usarmy_10" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_M1083A1P2_wd_open_fmtv_usarmy_10 );  
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+ rhsusf_M1083A1P2_wd_open_fmtv_usarmy_10 ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) USA (Army 2010)  M1083A1P2 (Open) for $%1", rhsusf_M1083A1P2_wd_open_fmtv_usarmy_10 ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 40 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy_10) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy_10]
            } else {
                _MATV="rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy_10" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy_10  );
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+  rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy_10  ); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) USA (Army 2010)M1083A1P2 (Flatbed) for $%1", rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy_10  ];
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 41 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1083A1P2_B_wd_fmtv_usarmy_10) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1083A1P2_B_wd_fmtv_usarmy_10]
            } else {
                _MATV="rhsusf_M1083A1P2_B_wd_fmtv_usarmy_10" createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_M1083A1P2_B_wd_fmtv_usarmy_10 );   
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+ rhsusf_M1083A1P2_B_wd_fmtv_usarmy_10 ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) USA (Army 2010) M1083A1P2-B for $%1", rhsusf_M1083A1P2_B_wd_fmtv_usarmy_10 ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 42 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy_10]
            } else {
                _MATV="rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy_10" createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy_10  );
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy_10);
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an)  USA (Army 2010)  M1083A1P2-B (Open) for $%1", rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy_10];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 43 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy_10]
            } else {
                _MATV="rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy_10" createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy_10 );   
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+ rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy_10 ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) USA (Army 2010) M1083A1P2-B (Flatbed) for $%1", rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy_10 ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        };
        
Case 44 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy_10 ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy_10 ]
                } else {
                    _MATV="rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy_10"createVehicle (getMarkerPos"vehspawn"); 
                    B_defensebudget= (B_defensebudget- rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy_10 );  
                    publicVariable"B_defensebudget"; 
                    B_totalcost= (B_totalcost+rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy_10 ); 
                    publicVariable"B_totalcost";
                    hint format ["You have purchased (a/an)USA (Army 2010) M1083A1P2-B (M2)for $%1",rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy_10 ]; 
                    
                    [] call doBudget;
                    [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
                }; 
            };
            
Case 45 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy_10) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy_10]
            } else {
                _MATV="rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy_10" createVehicle (getMarkerPos"vehspawn");  
                    B_defensebudget= (B_defensebudget- rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy_10 );   
                    publicVariable"B_defensebudget";  
                    B_totalcost= (B_totalcost+ rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy_10 ); 
                    publicVariable"B_totalcost"; 
                    hint format ["You have purchased (a/an) USA (Army 2010) M1083A1P2-B (M2/Open) for $%1", rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy_10 ];  
                    
                    [] call doBudget; 
                    [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
                }; 
            };
            
Case 46 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy_10) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy_10]
            } else {
                _MATV="rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy_10" createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy_10);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy_10); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (Army 2010) M1083A1P2-B (M2/Flatbed)for $%1",rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy_10]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        };
        
Case 47 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_w_4dr) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_w_4dr]
            } else {
                _MATV="rhsusf_m998_w_4dr"  createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_m998_w_4dr  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+  rhsusf_m998_w_4dr  ); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an)  USA (Army - Woodland )  M1097A2 , 2dr cgo/trp carr, open  for $%1",  rhsusf_m998_w_4dr  ]; 

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 48 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_d_4dr) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_d_4dr]
            } else {
                _MATV="rhsusf_m998_d_4dr" createVehicle (getMarkerPos"vehspawn");   
                B_defensebudget= (B_defensebudget- rhsusf_m998_d_4dr  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+  rhsusf_m998_d_4dr  ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an)  USA (Army - Desert )M1097A2 , 2dr cgo/trp carr, open  for $%1",  rhsusf_m998_d_4dr  ];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 49 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_w_4dr_halftop) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_w_4dr_halftop]
            } else {
                _MATV="rhsusf_m998_w_4dr_halftop" createVehicle (getMarkerPos"vehspawn");   
                B_defensebudget= (B_defensebudget- rhsusf_m998_w_4dr_halftop  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+  rhsusf_m998_w_4dr_halftop  );
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an)  USA (Army - Woodland )  M1097A2 , 2dr cgo/trp carr, halfsoftop  for $%1",  rhsusf_m998_w_4dr_halftop  ];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 50 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_d_4dr_halftop) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_d_4dr_halftop]
            } else {
                _MATV="rhsusf_m998_d_4dr_halftop"  createVehicle (getMarkerPos"vehspawn");  
                B_defensebudget= (B_defensebudget- rhsusf_m998_d_4dr_halftop  );
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+rhsusf_m998_d_4dr_halftop); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an) USA (Army - Desert )M1097A2, 2dr cgo/trp carr, halfsoftop  for $%1",  rhsusf_m998_d_4dr_halftop];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 51 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_w_4dr_fulltop) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_w_4dr_fulltop]
            } else {
                _MATV="rhsusf_m998_w_4dr_fulltop"  createVehicle (getMarkerPos"vehspawn");   
                B_defensebudget= (B_defensebudget- rhsusf_m998_w_4dr_fulltop  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+  rhsusf_m998_w_4dr_fulltop  ); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an) USA (Army - Woodland ) M1097A2, 2dr cgo/trp carr, softop for $%1",  rhsusf_m998_w_4dr_fulltop];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 52 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_d_4dr_fulltop) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_d_4dr_fulltop]
            } else {
                _MATV="rhsusf_m998_d_4dr_fulltop" createVehicle (getMarkerPos"vehspawn");   
                B_defensebudget= (B_defensebudget- rhsusf_m998_d_4dr_fulltop  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+  rhsusf_m998_d_4dr_fulltop  ); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an)  USA (Army - Desert )M1097A2 , 2dr cgo/trp carr, softop  for $%1",  rhsusf_m998_d_4dr_fulltop  ];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        };
        
Case 53 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_w_s_2dr) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_w_s_2dr]
            } else {
                _MATV="rhsusf_m998_w_s_2dr"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_m998_w_s_2dr);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_w_s_2dr); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Woodland )M1123, 2dr cgo/trp carr, open w/ snorkelfor $%1",rhsusf_m998_w_s_2dr]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 54 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_d_s_2dr ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_d_s_2dr ]
            } else {
                _MATV="rhsusf_m998_d_s_2dr"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_m998_d_s_2dr );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_d_s_2dr ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Desert )  M1123, 2dr cgo/trp carr, open w/ snorkelfor $%1",rhsusf_m998_d_s_2dr ]; 
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 55 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_w_s_2dr_halftop) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_w_s_2dr_halftop]
            } else {
                _MATV="rhsusf_m998_w_s_2dr_halftop"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_m998_w_s_2dr_halftop);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_w_s_2dr_halftop); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Woodland )M1123, 2dr cgo/trp carr, halfsoftop w/ snorkelfor $%1",rhsusf_m998_w_s_2dr_halftop]; 
                
                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            
            }; 
        };
        
Case 56 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_d_s_2dr_halftop) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_d_s_2dr_halftop]
            } else {
                _MATV="rhsusf_m998_d_s_2dr_halftop"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_m998_d_s_2dr_halftop); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_d_s_2dr_halftop); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Desert )  M1123, 2dr cgo/trp carr, halfsoftop w/ snorkelfor $%1",rhsusf_m998_d_s_2dr_halftop];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 57 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_w_s_2dr_fulltop ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_w_s_2dr_fulltop ]
            } else {
                _MATV="rhsusf_m998_w_s_2dr_fulltop"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_m998_w_s_2dr_fulltop );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_w_s_2dr_fulltop ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Woodland )M1123, 2dr cgo/trp carr, softop w/ snorkelfor $%1",rhsusf_m998_w_s_2dr_fulltop ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            };
        };
        
Case 58 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_d_s_2dr_fulltop) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_d_s_2dr_fulltop]
            } else {
                _MATV="rhsusf_m998_d_s_2dr_fulltop"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_m998_d_s_2dr_fulltop); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_d_s_2dr_fulltop);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Desert )  M1123, 2dr cgo/trp carr, softop w/ snorkelfor $%1",rhsusf_m998_d_s_2dr_fulltop];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 59 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_w_s_4dr) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_w_s_4dr]
            } else {
                _MATV="rhsusf_m998_w_s_4dr"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_m998_w_s_4dr);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_w_s_4dr); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Woodland )M1123, 4dr cgo/trp carr, open w/ snorkelfor $%1",rhsusf_m998_w_s_4dr];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        };
        
Case 60 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_d_s_4dr ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_d_s_4dr ]
            } else {
                _MATV="rhsusf_m998_d_s_4dr"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_m998_d_s_4dr );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_d_s_4dr ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Desert ) M1123, 4dr cgo/trp carr, open w/ snorkelfor $%1",rhsusf_m998_d_s_4dr ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 61 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_w_s_4dr_halftop) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_w_s_4dr_halftop]
            } else {
                _MATV="rhsusf_m998_w_s_4dr_halftop"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_m998_w_s_4dr_halftop);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_w_s_4dr_halftop); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Woodland )M1123, 4dr cgo/trp carr, halfsoftop w/ snorkelfor $%1",rhsusf_m998_w_s_4dr_halftop];

                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 62 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_d_s_4dr_halftop) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_d_s_4dr_halftop]
            } else {
                _MATV="rhsusf_m998_d_s_4dr_halftop"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_m998_d_s_4dr_halftop);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_d_s_4dr_halftop); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Desert ) M1123, 4dr cgo/trp carr, halfsoftop w/ snorkelfor $%1",rhsusf_m998_d_s_4dr_halftop]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 63 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_w_s_4dr_fulltop) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_w_s_4dr_fulltop]
            } else {
                _MATV="rhsusf_m998_w_s_4dr_fulltop"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_m998_w_s_4dr_fulltop);  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_w_s_4dr_fulltop);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Woodland )M1123, 4dr cgo/trp carr, softop w/ snorkelfor $%1",rhsusf_m998_w_s_4dr_fulltop];

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        };
        
Case 64 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_m998_d_s_4dr_fulltop) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_m998_d_s_4dr_fulltop]
            } else {
                _MATV="rhsusf_m998_d_s_4dr_fulltop"createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_m998_d_s_4dr_fulltop); 
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+rhsusf_m998_d_s_4dr_fulltop);
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC - Desert )  M1123, 4dr cgo/trp carr, softop w/ snorkelfor $%1",rhsusf_m998_d_s_4dr_fulltop]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            }; 
        };
        
Case 65 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_rg33_wd) OR ( _prat != B_Maxrank)) then {
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_rg33_wd]
            } else {
                _MATV="rhsusf_rg33_wd" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_rg33_wd  ); 
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+  rhsusf_rg33_wd  );
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) USA (Army 2010)Woodland RG-33 (Unarmed) for $%1", rhsusf_rg33_wd  ];
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 66 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_rg33_m2_wd) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_rg33_m2_wd]
            } else {
                _MATV="rhsusf_rg33_m2_wd"  createVehicle (getMarkerPos"vehspawn");   
                B_defensebudget= (B_defensebudget- rhsusf_rg33_m2_wd  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+rhsusf_rg33_m2_wd  ); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an)  USA (Army 2010) Woodland RG-33 (M2) for $%1",  rhsusf_rg33_m2_wd  ];  

                [] call doBudget;
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 67 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_rg33_usmc_wd ) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_rg33_usmc_wd ]
            } else {
                _MATV="rhsusf_rg33_usmc_wd"createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_rg33_usmc_wd );  
                publicVariable"B_defensebudget";
                B_totalcost= (B_totalcost+rhsusf_rg33_usmc_wd ); 
                publicVariable"B_totalcost";
                hint format ["You have purchased (a/an)USA (USMC 2010) Woodland RG-33 (Unarmed)for $%1",rhsusf_rg33_usmc_wd ]; 
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV; 
            };
        };
        
Case 68 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_rg33_m2_usmc_wd) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_rg33_m2_usmc_wd]
            } else {
                _MATV="rhsusf_rg33_m2_usmc_wd" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_rg33_m2_usmc_wd );
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+ rhsusf_rg33_m2_usmc_wd); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) USA (USMC 2010)Woodland RG-33 (M2) for $%1", rhsusf_rg33_m2_usmc_wd];
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;          }; 
        };
        
Case 69 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_rg33_usmc_d) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_rg33_d]
            } else {
                _MATV="rhsusf_rg33_d" createVehicle (getMarkerPos"vehspawn");   
                B_defensebudget= (B_defensebudget- rhsusf_rg33_d  );
                publicVariable"B_defensebudget";   
                B_totalcost= (B_totalcost+ rhsusf_rg33_d); 
                publicVariable"B_totalcost";  
                hint format ["You have purchased (a/an) USA (Army 2010) RG-33 (Unarmed) for $%1", rhsusf_rg33_d];   
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 70 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_rg33_m2_usmc_d) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_rg33_m2_d]
        } else {
            _MATV="rhsusf_rg33_m2_d" createVehicle (getMarkerPos"vehspawn"); 
            B_defensebudget= (B_defensebudget- rhsusf_rg33_m2_d );   
            publicVariable"B_defensebudget";  
            B_totalcost= (B_totalcost+ rhsusf_rg33_m2_d );
            publicVariable"B_totalcost"; 
            hint format ["You have purchased (a/an) USA (Army 2010)  RG-33 (M2) for $%1", rhsusf_rg33_m2_d ]; 

            [] call doBudget;
            [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
        }; 
    };
    
Case 71 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_rg33_usmc_d) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_rg33_usmc_d]
            } else {
                _MATV="rhsusf_rg33_usmc_d" createVehicle (getMarkerPos"vehspawn");
                B_defensebudget= (B_defensebudget- rhsusf_rg33_usmc_d); 
                publicVariable"B_defensebudget";    
                B_totalcost= (B_totalcost+  rhsusf_rg33_usmc_d); 
                publicVariable"B_totalcost";   
                hint format ["You have purchased (a/an) USA (USMC 2010) RG-33 (Unarmed) for $%1" , rhsusf_rg33_usmc_d  ];
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
Case 72 :{_prat = Rank Player;if ((B_defensebudget<rhsusf_rg33_m2_usmc_d) OR ( _prat != B_Maxrank)) then { 
        hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_rg33_m2_usmc_d]
            } else {
                _MATV="rhsusf_rg33_m2_usmc_d" createVehicle (getMarkerPos"vehspawn"); 
                B_defensebudget= (B_defensebudget- rhsusf_rg33_m2_usmc_d );   
                publicVariable"B_defensebudget";  
                B_totalcost= (B_totalcost+ rhsusf_rg33_m2_usmc_d ); 
                publicVariable"B_totalcost"; 
                hint format ["You have purchased (a/an) USA (USMC 2010) RG-33 (M2) for $%1", rhsusf_rg33_m2_usmc_d ];  
                
                [] call doBudget; 
                [] call DoTotal; clearWeaponCargoGlobal _MATV; clearMagazineCargoGlobal _MATV;  
            }; 
        };
        
default { hint "Something went wrong...Couldn't find case for selection!" };
// Last Bracket For Wheeled Case
};
};

A3M_Fnc_Robotics = {

	if (Apex_Enabled == 1) then {
		switch (TheSelection) do {
			Case 0: {
			_prat = Rank Player;
			
			if ((B_defensebudget<UAV_Drakon ) OR ( _prat != B_Maxrank)) then {
			hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,UAV_Drakon ]
            } else {
                RoboGroup = createGroup west; 
				Robo = createVehicle ['UAV_Drakon',getMarkerPos "AAutSpwn", [], 0, 'CAN_COLLIDE']; 
				createVehicleCrew Robo; 
				(crew Robo) join RoboGroup; 
				
				Deliveries AddItemCargoGlobal["B_UavTerminal", 1];
				
                B_defensebudget= (B_defensebudget- UAV_Drakon );  
                publicVariable"B_defensebudget"; 
                B_totalcost= (B_totalcost+UAV_Drakon );
                publicVariable"B_totalcost";
                hint format ["You have purchased an APEX Drakon UAV for $%1",UAV_Drakon ]; 
                
					[] call doBudget; 
					[] call DoTotal; 
				}; 
			};
			
			}; 
	} else { 
	
			if ( RHS_Support_Enabled == 1) then {
				
				switch (TheSelection) do {
				
				Case 0: {
						_prat = Rank Player;
			
						if ((B_defensebudget<rq11_zerlegt ) OR ( _prat != B_Maxrank)) then {
						hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rq11_zerlegt ]
						} else {
							Robo = createVehicle ['rq11_zerlegt',getMarkerPos "SGAutSpwn", [], 0, 'CAN_COLLIDE']; 
							Deliveries AddItemCargoGlobal["B_UavTerminal", 1];
							
							B_defensebudget= (B_defensebudget- rq11_zerlegt );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+rq11_zerlegt );
							publicVariable"B_totalcost";
							hint format ["You have purchased an RHS RQ-11 A Blanket for $%1",rq11_zerlegt ]; 
                
								[] call doBudget; 
								[] call DoTotal; 
							}; 
						};
						
					
						Case 1: {
						_prat = Rank Player;
			
						if ((B_defensebudget<rq11b_zerlegt ) OR ( _prat != B_Maxrank)) then {
						hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rq11b_zerlegt ]
						} else {
							Robo = createVehicle ['rq11b_zerlegt',getMarkerPos "SGAutSpwn", [], 0, 'CAN_COLLIDE']; 
							Deliveries AddItemCargoGlobal["B_UavTerminal", 1];
							
							B_defensebudget= (B_defensebudget- rq11b_zerlegt );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+rq11b_zerlegt );
							publicVariable"B_totalcost";
							hint format ["You have purchased an RHS RQ-11 B Blanket  for $%1",rq11b_zerlegt ]; 
                
								[] call doBudget; 
								[] call DoTotal; 
							}; 
						};
						
					
						Case 2: {
						_prat = Rank Player;
			
						if ((B_defensebudget<rq11_camera ) OR ( _prat != B_Maxrank)) then {
						hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rq11_camera ]
						} else {
							Robo = createVehicle ['rq11_camera',getMarkerPos "SGAutSpwn", [], 0, 'CAN_COLLIDE'];  
							Deliveries AddItemCargoGlobal["B_UavTerminal", 1];
							
							B_defensebudget= (B_defensebudget- rq11_camera );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+rq11_camera );
							publicVariable"B_totalcost";
							hint format ["You have purchased an RQ-11 A Camera Package for $%1",rq11_camera ]; 
                
								[] call doBudget; 
								[] call DoTotal; 
							}; 
						}; 
						
						Case 3: {
						_prat = Rank Player;
			
						if ((B_defensebudget<rq11b_camera ) OR ( _prat != B_Maxrank)) then {
						hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rq11b_camera ]
						} else {
							Robo = createVehicle ['rq11b_camera',getMarkerPos "SGAutSpwn", [], 0, 'CAN_COLLIDE']; 
							Deliveries AddItemCargoGlobal["B_UavTerminal", 1];
							
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+rq11b_camera );
							publicVariable"B_totalcost";
							hint format ["You have purchased an RQ-11 B Camera Package for $%1",rq11b_camera ]; 
                
								[] call doBudget; 
								[] call DoTotal; 
							}; 
						};

				}; 
				
			} else {
					switch (TheSelection) do {
						
						Case 0: {
						_prat = Rank Player;
			
						if ((B_defensebudget<B_UAV_01_F ) OR ( _prat != B_Maxrank)) then {
						hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_UAV_01_F ]
						} else {
							RoboGroup = createGroup west; 
							Robo = createVehicle ['B_UAV_01_F',getMarkerPos "SGAutSpwn", [], 0, 'CAN_COLLIDE']; 
							createVehicleCrew Robo; 
							(crew Robo) join RoboGroup; 

							Deliveries AddItemCargoGlobal["B_UavTerminal", 1];
							
							B_defensebudget= (B_defensebudget- B_UAV_01_F );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+B_UAV_01_F );
							publicVariable"B_totalcost";
							hint format ["You have purchased an AR-2 Darter for $%1",B_UAV_01_F ]; 
                
								[] call doBudget; 
								[] call DoTotal; 
							}; 
						};
						
					
						Case 1: {
						_prat = Rank Player;
			
						if ((B_defensebudget<B_UGV_01_F ) OR ( _prat != B_Maxrank)) then {
						hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_UGV_01_F ]
						} else {
							RoboGroup = createGroup west; 
							Robo = createVehicle ['B_UGV_01_F',getMarkerPos "GAutSpwn", [], 0, 'CAN_COLLIDE']; 
							createVehicleCrew Robo; 
							(crew Robo) join RoboGroup; 
							
							Deliveries AddItemCargoGlobal["B_UavTerminal", 1];
							
							B_defensebudget= (B_defensebudget- B_UGV_01_F );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+B_UGV_01_F );
							publicVariable"B_totalcost";
							hint format ["You have purchased a UGV Stomper for $%1",B_UGV_01_F ]; 
                
								[] call doBudget; 
								[] call DoTotal; 
							}; 
						};
						
					
						Case 2: {
						_prat = Rank Player;
			
						if ((B_defensebudget<B_UGV_01_rcws_F ) OR ( _prat != B_Maxrank)) then {
						hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_UGV_01_rcws_F ]
						} else {
							RoboGroup = createGroup west; 
							Robo = createVehicle ['B_UGV_01_rcws_F',getMarkerPos "GAutSpwn", [], 0, 'CAN_COLLIDE']; 
							createVehicleCrew Robo; 
							(crew Robo) join RoboGroup; 
							
							Deliveries AddItemCargoGlobal["B_UavTerminal", 1];
							
							B_defensebudget= (B_defensebudget- B_UGV_01_rcws_F );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+B_UGV_01_rcws_F );
							publicVariable"B_totalcost";
							hint format ["You have purchased a UGV Stomper RCWS for $%1",B_UGV_01_rcws_F ]; 
                
								[] call doBudget; 
								[] call DoTotal; 
							}; 
						}; 
						
						Case 3: {
						_prat = Rank Player;
			
						if ((B_defensebudget<B_UAV_02_F ) OR ( _prat != B_Maxrank)) then {
						hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_UAV_02_F ]
						} else {
							RoboGroup = createGroup west; 
							Robo = createVehicle ['B_UAV_02_F',getMarkerPos "AAutSpwn", [], 0, 'CAN_COLLIDE']; 
							createVehicleCrew Robo; 
							(crew Robo) join RoboGroup; 
							; 
							Deliveries AddItemCargoGlobal["B_UavTerminal", 1];
							
							
							B_defensebudget= (B_defensebudget- B_UAV_02_F );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+B_UAV_02_F );
							publicVariable"B_totalcost";
							hint format ["You have purchased a Yabhon R3 for $%1",B_UAV_02_F ]; 
                
								[] call doBudget; 
								[] call DoTotal; 
							}; 
						};
						
						Case 4: {
						_prat = Rank Player;
			
						if ((B_defensebudget<B_UAV_02_CAS_F ) OR ( _prat != B_Maxrank)) then {
						hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_UAV_02_CAS_F ]
						} else {
							RoboGroup = createGroup west; 
							Robo = createVehicle ['B_UAV_02_CAS_F',getMarkerPos "AAutSpwn", [], 0, 'CAN_COLLIDE']; 
							createVehicleCrew Robo; 
							(crew Robo) join RoboGroup; 
							
							Deliveries AddItemCargoGlobal["B_UavTerminal", 1];
							
							B_defensebudget= (B_defensebudget- B_UAV_02_CAS_F );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+B_UAV_02_CAS_F );
							publicVariable"B_totalcost";
							hint format ["You have purchased a Yabhon R3 (CAS) for $%1",B_UAV_02_CAS_F ]; 
                
								[] call doBudget; 
								[] call DoTotal; 
							}; 
						};
					}; 
				};
		};
}; 
	
A3M_Fnc_Support = {

if (Ace3_Enabled == 1) then {
			switch (TheSelection) do {
				Case 0: {
					if (B_defensebudget < ACE_Wheel) then {
						hint format ["Your company does not have sufficient money (Costs $%) to do this.", ACE_Wheel];
							} else {
							_SpareTire= "ACE_Wheel" createVehicle (getMarkerPos "SvcSpwn"); 
							B_defensebudget= (B_defensebudget- ACE_Wheel);  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+ACE_Wheel);
							publicVariable"B_totalcost";
							hint format ["You have purchased a Spare Wheel for $%1 \n \n It will be delivered to the Vehicle Service Location at the C-12 Facility. ",ACE_Wheel ]; 
                
						[] call doBudget; 
						[] call DoTotal; 
						}; 
				}; 
				Case 1: {
					if (B_defensebudget < ACE_Track) then {
						hint format ["Your company does not have sufficient money (Costs $%) to do this.", ACE_Track];
							} else {
							_SpareTrack= "ACE_Track" createVehicle (getMarkerPos "SvcSpwn"); 
							B_defensebudget= (B_defensebudget-ACE_Track);  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+ACE_Track);
							publicVariable"B_totalcost";
							hint format ["You have purchased a Spare Track for $%1 \n \n It will be delivered to the Vehicle Service Location at the C-12 Facility. ",ACE_Track ]; 
                
						[] call doBudget; 
						[] call DoTotal; 
						}; 
				
				};
				
				Case 2: {
					if (B_defensebudget < ACE_Box_Ammo) then {
						hint format ["Your company does not have sufficient money (Costs $%) to do this.", ACE_Box_Ammo];
							} else {
							_SpareTrack= "ACE_Box_Ammo" createVehicle (getMarkerPos "ArmrySpwn"); 
							B_defensebudget= (B_defensebudget- ACE_Box_Ammo );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+ACE_Box_Ammo);
							publicVariable"B_totalcost";
							hint format ["You have purchased a Spare Track for $%1 \n \n It will be delivered to the Vehicle Service Location at the C-12 Facility. ",ACE_Box_Ammo ]; 
                
						[] call doBudget; 
						[] call DoTotal; 
						}; 
				
				};
				
				Case 3: {
					if (B_defensebudget < ACE_medicalSupplyCrate_advanced) then {
						hint format ["Your company does not have sufficient money (Costs $%) to do this.", ACE_medicalSupplyCrate_advanced];
							} else {
							_SpareTrack= "ACE_medicalSupplyCrate_advanced" createVehicle (getMarkerPos "ArmrySpwn"); 
							B_defensebudget= (B_defensebudget- ACE_medicalSupplyCrate_advanced );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+ACE_medicalSupplyCrate_advanced );
							publicVariable"B_totalcost";
							hint format ["You have purchased a Spare Track for $%1 \n \n It will be delivered to the Vehicle Service Location at the C-12 Facility. ",ACE_medicalSupplyCrate_advanced ]; 
                
						[] call doBudget; 
						[] call DoTotal; 
						}; 
				
				};
				
				Case 4: {
					if (B_defensebudget < ACE_Item_Sandbag_empty) then {
						hint format ["Your company does not have sufficient money (Costs $%) to do this.", ACE_Item_Sandbag_empty];
							} else {
							_SpareTrack= "ACE_Item_Sandbag_empty" createVehicle (getMarkerPos "ArmrySpwn"); 
							B_defensebudget= (B_defensebudget- ACE_Item_Sandbag_empty );  
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+ACE_Item_Sandbag_empty );
							publicVariable"B_totalcost";
							hint format ["You have purchased a Spare Track for $%1 \n \n It will be delivered to the Vehicle Service Location at the C-12 Facility. ",ACE_Item_Sandbag_empty ]; 
                
						[] call doBudget; 
						[] call DoTotal; 
						}; 
				
				};
			}; 

		} else {
			if (Iowa_Enabled == 1) then { 
				switch (TheSelection) do {
				
				Case 0: {
				_prat = Rank Player;
				if ((B_defensebudget < USS_Iowa_Battleship) OR ( _prat != B_Maxrank)) then {
					hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,USS_Iowa_Battleship];
						} else {
							_MATV="USS_Iowa_Battleship"createVehicle (getMarkerPos"ShipSpawn");
							B_defensebudget= (B_defensebudget-USS_Iowa_Battleship); 
							publicVariable"B_defensebudget"; 
							B_totalcost= (B_totalcost+USS_Iowa_Battleship); 
							publicVariable"B_totalcost";
							hint format ["You have purchased an Iowa Class Battleship for $%1 \n \n It will be delivered to the Pefkas Bay.",USS_Iowa_Battleship]; 
							
								[] call doBudget; 
								[] call DoTotal;
						}; 
				
					};
				}; 
			} else {
					if (SMA_Enabled == 1) then { 
					switch (TheSelection) do {
						Case 0: {
							_prat = Rank Player;
							if ((B_defensebudget < SMA_Weapon_Box) OR ( _prat != B_Maxrank)) then {
							hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,SMA_Weapon_Box]
								} else {
									_SMABox = "SMA_Weapon_Box" createVehicle (getMarkerPos "ArmrySpwn");
									B_defensebudget= (B_defensebudget-SMA_Weapon_Box); 
									publicVariable "B_defensebudget"; 
									B_totalcost= (B_totalcost+SMA_Weapon_Box); 
									publicVariable "B_totalcost";
									hint format ["You have purchased a shipment of 120 Assorted Specialist Military Arms for $%1 \n \n It will be delivered to the Tactical Readiness Area at the C-12 Facility.",SMA_Weapon_Box]; 
						
										[] call doBudget; 
										[] call DoTotal;
							};
						}; 
					}; 	
				} else {
						if (HLC_Enabled == 1) then { 
								switch (TheSelection) do {
									Case 0: {	
										_prat = Rank Player;
										if ((B_defensebudget<HLC_MP5_ammobox) OR ( _prat != B_Maxrank)) then {
										hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,HLC_MP5_ammobox]
											} else {								
												_SMABox = "HLC_MP5_ammobox" createVehicle (getMarkerPos "ArmrySpwn");
												B_defensebudget= (B_defensebudget-HLC_MP5_ammobox); 
												publicVariable "B_defensebudget"; 
												B_totalcost= (B_totalcost+HLC_MP5_ammobox); 
												publicVariable "B_totalcost";
												hint format ["You have purchased a shipment of 180 Assorted Heckler and Koch MP-5 Submachinesguns for $%1 \n \n It will be delivered to the Tactical Readiness Area at the C-12 Facility.",SMA_Weapon_Box]; 
						
													[] call doBudget; 
													[] call DoTotal;
											};
									}; 
								};
							} else {
									if (RHS_Support_Enabled == 1) then {
										switch (TheSelection) do {
											Case 0: {
												_prat = Rank Player;
												if ((B_defensebudget<rhs_weapon_crate) OR ( _prat != B_Maxrank)) then {
												hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhs_weapon_crate]
													} else {	
													_SMABox = "rhs_weapon_crate" createVehicle (getMarkerPos "ArmrySpwn");
													B_defensebudget= (B_defensebudget-rhs_weapon_crate); 
													publicVariable "B_defensebudget"; 
													B_totalcost= (B_totalcost+rhs_weapon_crate); 
													publicVariable "B_totalcost";
													hint format ["You have purchased a shipment of 330 Assorted Russian Military Arms for $%1 \n \n It will be delivered to the Tactical Readiness Area at the C-12 Facility.",SMA_Weapon_Box]; 
							
														[] call doBudget; 
														[] call DoTotal;
											};
										}; 	
											Case 1: {
											_prat = Rank Player;
											if ((B_defensebudget<rhsusf_weapon_crate) OR ( _prat != B_Maxrank)) then {
											hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,rhsusf_weapon_crate]
											} else {	
												_SMABox = "rhsusf_weapon_crate" createVehicle (getMarkerPos"ArmrySpwn");
												B_defensebudget= (B_defensebudget-rhsusf_weapon_crate); 
												publicVariable "B_defensebudget"; 
												B_totalcost= (B_totalcost+rhsusf_weapon_crate); 
												publicVariable "B_totalcost";
												hint format ["You have purchased a shipment of 460 Assorted U.S. Military Arms for $%1 \n \n It will be delivered to the Tactical Readiness Area at the C-12 Facility.",SMA_Weapon_Box]; 
						
													[] call doBudget; 
													[] call DoTotal;
												};
											}; 	
										}; 		
									} else {
										switch (TheSelection) do {
											Case 0: {
												_prat = Rank Player;
													if ((B_defensebudget<B_Truck_01_fuel_F) OR ( _prat != B_Maxrank)) then {
													hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Truck_01_fuel_F]
														} else {	
															_SMABox = "B_Truck_01_fuel_F" createVehicle (getMarkerPos "VehSpawn");
															B_defensebudget= (B_defensebudget-B_Truck_01_fuel_F); 
															publicVariable "B_defensebudget"; 
															B_totalcost= (B_totalcost+B_Truck_01_fuel_F); 
															publicVariable "B_totalcost";
															hint format ["You have purchased a Military Fuel Truck for $%1 \n \n It will be delivered to the Fleet Delivery Area at the C-12 Facility.",B_Truck_01_fuel_F]; 
						
																[] call doBudget; 
																[] call DoTotal;
													};
												}; 	
													Case 1: {
													_prat = Rank Player;
													if ((B_defensebudget<Box_NATO_Ammo_F) OR ( _prat != B_Maxrank)) then {
													hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,Box_NATO_Ammo_F]
														} else {	
														_SMABox = "Box_NATO_Ammo_F" createVehicle (getMarkerPos "ArmrySpwn");
														B_defensebudget= (B_defensebudget-Box_NATO_Ammo_F); 
														publicVariable "B_defensebudget"; 
														B_totalcost= (B_totalcost+Box_NATO_Ammo_F); 
														publicVariable "B_totalcost";
														hint format ["You have purchased a small shipment of Ammo for $%1 \n \n It will be delivered to the Tactical Readiness Area at the C-12 Facility.",Box_NATO_Ammo_F]; 
									
														[] call doBudget; 
														[] call DoTotal;
													};
												}; 	
													Case 2: {
													_prat = Rank Player;
													if ((B_defensebudget<Box_NATO_Wps_F) OR ( _prat != B_Maxrank)) then {
													hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,Box_NATO_Wps_F]
														} else {	
														_SMABox = "Box_NATO_Wps_F" createVehicle (getMarkerPos "ArmrySpwn");
														B_defensebudget= (B_defensebudget-Box_NATO_Wps_F); 
														publicVariable "B_defensebudget"; 
														B_totalcost= (B_totalcost+Box_NATO_Wps_F); 
														publicVariable "B_totalcost";
														hint format ["You have purchased a small shipment of weapons for $%1 \n \n It will be delivered to the Tactical Readiness Area at the C-12 Facility.",Box_NATO_Wps_F]; 
									
														[] call doBudget; 
														[] call DoTotal;
													};
												}; 	
													Case 3: {
													_prat = Rank Player;
													if ((B_defensebudget<B_Boat_Armed_01_minigun_F) OR ( _prat != B_Maxrank)) then {
													hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Boat_Armed_01_minigun_F]
														} else {	
															_Boat = "B_Boat_Armed_01_minigun_F" createVehicle (getMarkerPos "SBoatSpawn");
															B_defensebudget= (B_defensebudget-B_Boat_Armed_01_minigun_F); 
															publicVariable "B_defensebudget"; 
															B_totalcost= (B_totalcost+B_Boat_Armed_01_minigun_F); 
															publicVariable "B_totalcost";
															hint format ["You have purchased an armed patrol boat (Minigun) for $%1 \n \n It will be delivered to the C-12 Facility Port.",B_Boat_Armed_01_minigun_F]; 
									
														[] call doBudget; 
														[] call DoTotal;
													};
												}; 	
													Case 4: {
													_prat = Rank Player;
													if ((B_defensebudget<B_Boat_Transport_01_F) OR ( _prat != B_Maxrank)) then {
													hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_Boat_Transport_01_F]
														} else {	
														_SBoat = "B_Boat_Transport_01_F" createVehicle (getMarkerPos "SBoatSpawn");
														B_defensebudget= (B_defensebudget-B_Boat_Transport_01_F); 
														publicVariable "B_defensebudget"; 
														B_totalcost= (B_totalcost+B_Boat_Transport_01_F); 
														publicVariable "B_totalcost";
														hint format ["You have purchased a RHIB for $%1 \n \n It will be delivered to the C-12 Facility Port.",B_Boat_Transport_01_F]; 
									
														[] call doBudget; 
														[] call DoTotal;
													};
												}; 	
													Case 5: {
													_prat = Rank Player;
													if ((B_defensebudget<B_SDV_01_F) OR ( _prat != B_Maxrank)) then {
													hint format ["You do not have sufficient rank (Min Rank %1) or money (Costs $%2) to do this.", B_maxrank,B_SDV_01_F]
														} else {	
														_Boat = "B_SDV_01_F" createVehicle (getMarkerPos "SBoatSpawn");
														B_defensebudget= (B_defensebudget-B_SDV_01_F); 
														publicVariable "B_defensebudget"; 
														B_totalcost= (B_totalcost+B_SDV_01_F); 
														publicVariable "B_totalcost";
														hint format ["You have purchased an SDV for $%1 \n \n It will be delivered to the C-12 Facility Port.",B_SDV_01_F]; 
									
														[] call doBudget; 
														[] call DoTotal;
															};
												
													}; 												
												}; 		
											}; 
				
									};
						};
	
					};


				};
}; 

A3M_Fnc_Upgrades = {
switch (TheSelection) do {


}; 
};




//EOF