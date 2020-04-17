/*
This creates a group of opfor defenders who will head to the patrol obj and await the blufor patrol as they head in to take the point 
Then this triggers bluforRF script - this runs a check to see if RF should be called in 
Then runs an RFCHECK loop to assess if the patrol has taken the point 
If opfor is 3 or less in the red zone, it is considered taken and the mission progresses 
As this is all about the 'attack', and considering that sometimes you can have a deadzone if the blufor attackers do not spot hidden opfor defenders ..
a solution is needed to ensure that blufor essentially search and destroy in and around the objective 
I need to write a function or script that does an 'Insurance Move' for all blufor in the area but only while RFCHECK is true 
I tried this before and failed - find out why it failed!
When defenders are wiped out, next phase is called 
*/

systemChat "op defenders being created - check perf";

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

systemChat "op defenders spawn complete";

// HERE WE CHECK IF BLUFOR NEED RF 
// execVM "autoPatrolSystem\reinforcementSystems\bluforRF.sqf";
// systemchat "debug --- checking for blufor RF";
// "MP debug --- checking for blufor RF" remoteExec ["systemChat", 0, true];
// this is one of two points where patrol reinforcements are considered - previously this was every 90 seconds, now it is more lean and cheap

// redirects any units incorrectly send to the old point 
execVM "autoPatrolSystem\insuranceSystems\phase3Timer.sqf";
// I think this caused issues, so I removed it - so far so good 

RFCHECK = true; 

while {RFCHECK} do {

	systemChat "RFCHECK perf check here";
	// confirms side numbers on the red zone 
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

	if ((_opforCount1) <= 3)  then // this is the decider-value as to whether the second round of enemy moves in
	{
		systemChat "Debug - Initial defenders neutralised, prepare for OPFOR RF .. !!!";
		"MP debug - Initial defenders neutralised, prepare for OPFOR RF .. !!!" remoteExec ["systemChat", 0, true];	
		RFCHECK = false;
		sleep 1;
		execVM "autoPatrolSystem\phase4_createOpforRF.sqf";
		systemchat "debug --- phase4_createOpforRF ACTIVATED";
		"MP debug --- phase4_createOpforRF ACTIVATED" remoteExec ["systemChat", 0, true];

	} else {
		systemChat "Patrol Point has not yet been cleared";
		"MP Patrol Point has not yet been cleared" remoteExec ["systemChat", 0, true];	
	};
	sleep 90;
};