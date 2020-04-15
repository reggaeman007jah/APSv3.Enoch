
_sentPos = _this select 0; // objective point for any new mission 
_sentOrigin = _this select 1; // starting point for any new mission

RGG_missionOrigin = _sentOrigin;

RGG_patrol_obj = [_sentPos, 600, 800] call BIS_fnc_findSafePos; // generate patrol obj between 600m and 800m away, and always over land 

// delete any existing opfor RF points 
deleteMarker "Point 1";
deleteMarker "Point 2";
deleteMarker "Point 3";

// Patrol Stage Origin 
deleteMarker "missionOrigin";
_base = createMarker ["missionOrigin", RGG_missionOrigin];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorGreen";
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

// AO - grey circle within which all calcs take place
deleteMarker "BattleArea"; 
_battleArea = createMarker ["BattleArea", RGG_patrol_obj];
_battleArea setMarkerShape "ELLIPSE";
_battleArea setMarkerColor "ColorBlack";
_battleArea setMarkerSize [1000, 1000];
_battleArea setMarkerAlpha 0.1;
sleep 0.1;
_battleArea setMarkerSize [1500, 1500];
_battleArea setMarkerAlpha 0.2;
sleep 0.1;
_battleArea setMarkerSize [2000, 2000];
_battleArea setMarkerAlpha 0.3;
sleep 0.1;
_battleArea setMarkerSize [2500, 2500];
_battleArea setMarkerAlpha 0.4;
sleep 0.1;
_battleArea setMarkerSize [3000, 3000];
_battleArea setMarkerAlpha 0.5;
sleep 0.1;
_battleArea setMarkerSize [3500, 3500];

// OBJ - patrol stage objective 
deleteMarker "Objective 1";
_objective1 = createMarker ["Objective 1", RGG_patrol_obj];
_objective1 setMarkerShape "ELLIPSE";
_objective1 setMarkerColor "ColorRed";
_objective1 setMarkerSize [100, 100];
_objective1 setMarkerAlpha 0.5;
sleep 0.1;
_objective1 setMarkerSize [120, 120];
_objective1 setMarkerAlpha 0.6;
sleep 0.1;
_objective1 setMarkerSize [130, 130];
_objective1 setMarkerAlpha 0.7;
sleep 0.1;
_objective1 setMarkerSize [140, 140];
_objective1 setMarkerAlpha 0.8;
sleep 0.1;
_objective1 setMarkerSize [150, 150];
_objective1 setMarkerAlpha 0.9;
sleep 0.1;
_objective1 setMarkerSize [250, 250];
sleep 0.1;
_objective1 setMarkerSize [450, 450];
sleep 1;

// Patrol Stage Core 
deleteMarker "missionCore";
_base = createMarker ["missionCore", RGG_patrol_obj];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorRed";
_base setMarkerSize [10, 10];
_base setMarkerAlpha 0.5;
sleep 0.1;
_base setMarkerSize [150, 15];
_base setMarkerAlpha 0.6;
sleep 0.1;
_base setMarkerSize [20, 20];
_base setMarkerAlpha 0.7;
sleep 0.1;
_base setMarkerSize [25, 25];
_base setMarkerAlpha 0.8;
sleep 0.1;
_base setMarkerSize [30, 30];
_base setMarkerAlpha 0.9;
sleep 1;

// generate defending opfor 
execVM "autoPatrolSystem\phase2_createOpforWave1.sqf";
systemchat "debug --- phase2_createOpforWave1 ACTIVATED";
"MP debug --- phase2_createOpforWave1 ACTIVATED" remoteExec ["systemChat", 0, true];

