
/*
Auto Patrol System v2 

*/

RGG_initStartPos = getPos ammo1;

// PERMA BASE - acts as blufor base area, can be used for RF/RE-UP tasks 
sleep 2;
// deleteMarker "permabase";
_base = createMarker ["permabase", RGG_initStartPos];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorBlue";
_base setMarkerSize [70, 70];
_base setMarkerAlpha 0.5;
sleep 0.1;
_base setMarkerSize [80, 80];
_base setMarkerAlpha 0.6;
sleep 0.1;
_base setMarkerSize [90, 90];
_base setMarkerAlpha 0.7;
sleep 0.1;
_base setMarkerSize [100, 100];
_base setMarkerAlpha 0.8;
sleep 0.1;
_base setMarkerSize [110, 110];
_base setMarkerAlpha 0.9;
sleep 1;

[RGG_initStartPos, RGG_initStartPos] execVM "autoPatrolSystem\phase1_createObj.sqf";
systemchat "debug --- phase1_createObj ACTIVATED";
"MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];
sleep 0.2;
[RGG_initStartPos] execVM "autoPatrolSystem\createFriendlyUnits.sqf";
systemchat "debug --- friendly units created";
"MP debug --- friendly units created" remoteExec ["systemChat", 0, true];
sleep 0.2;
[RGG_initStartPos] execVM "autoPatrolSystem\autoPatrolSystemParams.sqf";
systemchat "debug --- autoPatrolSystemParams ACTIVATED";
"MP debug --- autoPatrolSystemParams ACTIVATED" remoteExec ["systemChat", 0, true];
// sleep 0.2;
// execVM "autoPatrolSystem\autoReveal.sqf";
// systemchat "debug --- autoReveal ACTIVATED";
// "MP debug --- autoReveal ACTIVATED" remoteExec ["systemChat", 0, true]; 
// currently this messes with first wave - i need a smaller area for this to work at this stage 