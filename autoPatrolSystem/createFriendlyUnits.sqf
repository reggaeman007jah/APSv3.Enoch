
sleep 3;

_spawnPos = _this select 0;

for "_i" from 1 to 8 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_Rifleman_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

for "_i" from 1 to 4 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_MGGPMG_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

for "_i" from 1 to 2 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_LSW_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

for "_i" from 1 to 2 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_Grenadier_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

for "_i" from 1 to 2 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_Marksman_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

for "_i" from 1 to 2 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_Medic_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

for "_i" from 1 to 2 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_Sharpshooter_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

for "_i" from 1 to 1 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_Engineer_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

for "_i" from 1 to 1 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_Explosive_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

for "_i" from 1 to 1 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_Officer_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

for "_i" from 1 to 1 do {
	bluGroup = createGroup west;
	_pos = [_spawnPos, 0, 60] call BIS_fnc_findSafePos;
	_unit = bluGroup createUnit ["UK3CB_BAF_RO_MTP", _pos, [], 0.1, "none"]; 

	sleep 1;
	
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint1;
};

execVM "autoPatrolSystem\checkBluforRF.sqf";