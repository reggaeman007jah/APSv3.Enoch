
_rndOp1 = selectRandom [4, 6, 8, 10, 12];

for "_i" from 1 to _rndOp1 do {
	_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];
	_grp = createGroup east;
	_pos = [RGG_patrol_obj, 0, 200] call BIS_fnc_findSafePos;
	_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
	
	_randomDir = selectRandom [270, 290, 01, 30, 90];
	_endPoint = RGG_patrol_obj getPos [25, _randomDir];
	_unit setBehaviour "COMBAT";
	_unit doMove _endPoint;

 	sleep 1;									
	systemChat "debug --- opfor dug in defender unit created"; 	
	"MP debug --- opfor dug in defender unit created" remoteExec ["systemChat", 0, true];		
};

RFCHECK = true;

while {RFCHECK} do {
	_opforCount1 = 0;
	_blueforCount1 = 0;
	_units = allUnits inAreaArray "Objective 1";
	_unitCount1 = count _units;
	{
		switch ((side _x)) do
		{
			case EAST: {_opforCount1 = _opforCount1 + 1};
			case WEST: {_blueforCount1 = _blueforCount1 + 1};
		};
	} forEach _units;

	// hint format ["debug --- OPFOR DEFENDERS = %1", _opforCount1];

	if ((_opforCount1) <= 2)  then // this is the decider-value as to whether the second round of enemy moves in
	{
		systemChat "Debug - Initial defenders neutralised, prepare for OPFOR RF .. !!!";
		"MP debug - Initial defenders neutralised, prepare for OPFOR RF .. !!!" remoteExec ["systemChat", 0, true];	
		RFCHECK = false;
		execVM "autoPatrolSystem\phase4_createOpforRF.sqf";
		systemchat "debug --- phase4_createOpforRF ACTIVATED";
		"MP debug --- phase4_createOpforRF ACTIVATED" remoteExec ["systemChat", 0, true];

	} else {
		systemChat "zzz MSG you still have work to do in taking the objective";
		"zzz MP MSG you still have work to do in taking the objective" remoteExec ["systemChat", 0, true];	
	};
	sleep 90;
};