
/*
This script checks how well the defence of the objective is going. If the enemy is destroyed, the team can progress to the next stage of the mission.
An issue occurs when - for whatever reason - enemy do not engage. This could be due to being spawned in rocks, prevented from engaging due to a building or wall etc.
Without an insurance policy, this lack of engagement could draw the mission to a standstill. So, a secondary system is needed to ensure that things always progress as a certain time regardless of engagement.

*/

systemChat "debug --- phase 5 - defence"; 	
"MP debug --- phase 5 - defence" remoteExec ["systemChat", 0, true];	

// HERE WE CHECK IF BLUFOR NEED RF 
execVM "autoPatrolSystem\reinforcementSystems\bloforRF.sqf";
systemchat "debug --- checking for blufor RF";
"MP debug --- checking for blufor RF" remoteExec ["systemChat", 0, true];

_numberOfAttackers = _this select 0;
_numberOfAttackPoints = _this select 1;

monitorDefence = true;
_RGG_reinforcementTrigger = 10;

systemChat format ["Intel suggests %1 enemy units are advancing from %2 key position(s) in your immediate area", _numberOfAttackers, _numberOfAttackPoints];

execVM "autoPatrolSystem\insuranceSystems\phase5Timer.sqf";

while {monitorDefence} do {

	_units1 = allUnits inAreaArray "BattleArea";
	_unitCount = count _units1;

	// _opfor = (side _x == opfor) inAreaArray "BattleArea";
	// hint str _opfor;
			
	// this next bit is to ensure opfor dont get stuck somewhere and delay mission progression - if works, put in separate script to run occasionally 		
	_opfor = [];
	{if ((side _x) == east) then {_opfor pushBack _x}} forEach allUnits;

	{
		_Dir = random 360;
		_Dist = selectRandom [1, 5, 10]; 
		_moveTo = RGG_patrol_obj getPos [_Dist,_Dir]; 
		_x setBehaviour "COMBAT";
		_x doMove _moveTo;
		systemChat "mooovin";
		sleep 1;
	} forEach _opfor;	

	_opforCount = 0;
	_blueforCount = 0;
	{
		switch ((side _x)) do
		{
			case EAST: {_opforCount = _opforCount + 1};
			case WEST: {_blueforCount = _blueforCount + 1};
		};
	} forEach _units1;

	if (_blueforCount >= _RGG_reinforcementTrigger)  then 
	{
		systemChat "Patrol is at good strength, hold the line .. !!!";
		"MP - Patrol is at good strength, hold the line .. !!!" remoteExec ["systemChat", 0, true];
		
		// "Patrol is at good strength, hold the line .. !!!" remoteExec ["systemChat", 0, true]; // learn this
	};

	if (_blueforCount < _RGG_reinforcementTrigger)  then 
	{
		systemChat (format ["The Patrol has been compromised, with %1 units left in the fight. Reinforcements are inbound.. ", _blueforCount]);
		"Patrol has been compromised. Reinforcements are inbound.. " remoteExec ["systemChat", 0, true]; // make this better
		// [RGG_patrol_obj, RGG_missionOrigin] execVM "autoPatrolSystem\callRF.sqf"; // send RF units into area 
		// PARADOP UNITS HERE!!!
	};

	if (_blueforCount <= 3)  then 
	{
		systemChat "The Patrol has been Lost - Mission Failed.. ";
		"The Patrol has been Lost - mission Failed..  " remoteExec ["systemChat", 0, true]; // make this better // MAYBE -1 PLATOON SCORE
		// monitorDefence = false;
		// end state FAIL - what happens here???
	};

	if (_opforCount <= 3) then {// loop ends when opfor is reduced to this number
	
		systemChat "debug --- PATROL HAS CLEARED THE AREA - TIME FOR STATS";
		"debug --- PATROL HAS CLEARED THE AREA - TIME FOR STATS" remoteExec ["systemChat", 0, true];
		monitorDefence = false;
		// do stats?
		// consolidate injured?
		// [RGG_initStartPos, RGG_initStartPos] execVM "autoPatrolSystem\phase1_createObj.sqf";
		// systemchat "debug --- phase1_createObj ACTIVATED";
		// "MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];
		// [RGG_patrol_obj, ] execVM "";
		[RGG_patrol_obj, RGG_patrol_obj] execVM "autoPatrolSystem\phase1_createObj.sqf";
		systemchat "debug --- phase1_createObj ACTIVATED";
		"MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];

		sleep 10; 
		hint "Well done, the patrol has held the position successfully and is now moving to the next point";
		_units = allUnits inAreaArray "missionOrigin";
		{
			_randomDir = selectRandom [270, 310, 00, 50, 90];
			_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
			_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
			_endPoint1 = _unitDest getPos [_randomDist,_randomDir];

			_x setBehaviour "COMBAT";
			_x doMove _endPoint1;
		} forEach _units;
	};

	sleep 30;
};
