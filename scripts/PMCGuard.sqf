PMCguard = _this select 0; 


removeAllWeapons PMCguard;
removeAllItems PMCguard;
removeAllAssignedItems PMCguard;
removeUniform PMCguard;
removeVest PMCguard;
removeBackpack PMCguard;
removeHeadgear PMCguard;
removeGoggles PMCguard;

PMCguard forceAddUniform "U_BG_Guerrilla_6_1";
for "_i" from 1 to 4 do {PMCguard addItemToUniform "30Rnd_9x21_Mag";};
PMCguard addVest "V_PlateCarrierIAGL_oli";
PMCguard addHeadgear "H_Cap_usblack";


PMCguard addWeapon "SMG_02_F";
PMCguard addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
PMCguard addPrimaryWeaponItem "optic_ACO_grn";


PMCguard linkItem "ItemCompass";
PMCguard linkItem "ItemWatch";
PMCguard linkItem "tf_anprc152_1";


PMCguard setFace "WhiteHead_11";
PMCguard setSpeaker "ACE_NoVoice";
