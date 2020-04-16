// defensive positions (blufor) 

/*
Maybe use this as a timer system?
_defendStartTime = time;
systemChat format ["patrol defence started at %1 seconds into mission", _defendStartTime];
*/

_smoke = createVehicle ["G_40mm_smokeYELLOW", RGG_patrol_obj, [], 0, "none"];

systemChat "debug --- blufor moving into defensive positions"; 	
"MP debug --- blufor moving into defensive positions" remoteExec ["systemChat", 0, true];

sleep 3;

_bluforDefence1 = allUnits inAreaArray "Objective 1"; 

{
	// systemChat "debug - BLUEDEFEND STATE - Blue Unit Counted";
	// "MP debug - BLUEDEFEND STATE - Blue Unit Counted" remoteExec ["systemChat", 0, true];
	_dir = random 360;
	_dist = selectRandom [14, 16, 18, 20]; 
	_defendPoint = RGG_patrol_obj getPos [_dist, _dir]; // moves units into a rough 360 defensive circle
	_x setBehaviour "COMBAT";
	_x doMove _defendPoint;
	sleep 1;
} forEach _bluforDefence1;	

// then create and move enemy into attack 

// _enemyWaves = selectRandom [1,2,3]; // do this once

// systemChat format ["MSG there are %1 waves incoming", _enemyWaves];
// "MP MSG there are %1 waves incoming" remoteExec ["systemChat format", 0, true];	// this won't work!

// work out waves later - for now keep things alternating attack / defend 

systemChat "op retaliatory attackers being created - check perf";

_outcome = selectRandom [1,2,3]; 

if (_outcome == 1) then {
	ONEPOINT = true;
};
if (_outcome == 2) then {
	TWOPOINT = true;
};
if (_outcome == 3) then {
	THREEPOINT = true;
};

_rndOp1 = selectRandom [25, 30, 35, 40, 45, 50]; // RF force size

switch (true) do {	
	case (ONEPOINT): {
		systemChat "switch test ok 1";
		_pos1 = [RGG_patrol_obj, 400, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		deleteMarker "Point 1";
		deleteMarker "Point 2";
		deleteMarker "Point 3";
		_objective1 = createMarker ["Point 1", _pos1];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];

		for "_i" from 1 to _rndOp1 do 
		{						
			sleep 3;
			_grp = createGroup east;
			_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; 
			_pos = _pos1 getPos [50, _randomDir];
			_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
			_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
			sleep 0.3;
			_moveTo = RGG_patrol_obj getPos [5, _randomDir]; 
			_unit doMove _moveTo;
		}; 
		ONEPOINT = false;
	};
	case (TWOPOINT): {
		systemChat "switch test ok 2";
		_pos1 = [RGG_patrol_obj, 400, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		_pos2 = [RGG_patrol_obj, 400, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		deleteMarker "Point 3";
		deleteMarker "Point 1";
		_objective1 = createMarker ["Point 1", _pos1];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];
		deleteMarker "Point 2";
		_objective1 = createMarker ["Point 2", _pos2];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];

		for "_i" from 1 to _rndOp1 do 
		{						
			sleep 3;
			_grp = createGroup east;
			_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; 
			_posRandom = selectRandom [_pos1, _pos2];
			_pos = _posRandom getPos [50, _randomDir];
			_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
			_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
			sleep 0.3;
			_moveTo = RGG_patrol_obj getPos [5, _randomDir]; 
			_unit doMove _moveTo;
		}; 
		TWOPOINT = false;
	};
	case (THREEPOINT): {	
		systemChat "switch test ok 3";
		_pos1 = [RGG_patrol_obj, 300, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		_pos2 = [RGG_patrol_obj, 300, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		_pos3 = [RGG_patrol_obj, 300, 700] call BIS_fnc_findSafePos; // single point spawn 400-700m away from Dest
		deleteMarker "Point 1";
		_objective1 = createMarker ["Point 1", _pos1];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];
		deleteMarker "Point 2";
		_objective1 = createMarker ["Point 2", _pos2];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];
		deleteMarker "Point 3";
		_objective1 = createMarker ["Point 3", _pos3];
		_objective1 setMarkerShape "ELLIPSE";
		_objective1 setMarkerColor "ColorRed";
		_objective1 setMarkerSize [50, 50];

		for "_i" from 1 to _rndOp1 do 
		{						
			sleep 3;
			_grp = createGroup east;
			_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; 
			_posRandom = selectRandom [_pos1, _pos2, _pos3];
			_pos = _posRandom getPos [50, _randomDir];
			_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
			_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
			sleep 0.3;
			_moveTo = RGG_patrol_obj getPos [5, _randomDir]; 
			_unit doMove _moveTo;
		}; 
		THREEPOINT = false;
	};
};

[_rndOp1, _outcome] execVM "autoPatrolSystem\phase5_monitorBluforDefence.sqf"; // pass in no. of enemy units / no. of origin points / vars to inform intel message