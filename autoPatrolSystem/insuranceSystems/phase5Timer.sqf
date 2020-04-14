/*
April 2020 - untested
This system does two things - first it tries (twice) to push opfor openly towards the objective, thereby preventing stalemate situations (prone v prone) 
But it also ensures that if the above system does not work, the patrol will only wait 10 minutes at a point before moving onto the next point.
*/

for "_i" from 1 to 2 do {
	
	sleep 300;
	systemChat "insurance move";

	// this next bit is to ensure opfor dont get stuck somewhere and delay mission progression 
	// it used to be in a loop, now it only runs twice

	_opfor = [];
	{if ((side _x) == east) then {_opfor pushBack _x}} forEach allUnits;

	{
		_Dir = random 360;
		_Dist = selectRandom [1, 5, 10]; 
		_moveTo = RGG_patrol_obj getPos [_Dist,_Dir]; 
		_x setBehaviour "COMBAT";
		_x doMove _moveTo;
		systemChat "OPFOR insurance move orders";
		sleep 1;
	} forEach _opfor;	
};

if (monitorDefence) then {

	hint "INSURANCE PROGRESSION";
	// this system is untested! 
	systemChat "Debug - we've been here long enough, let's move out .. !!!";
	"MP debug - we've been here long enough, let's move out .. !!!" remoteExec ["systemChat", 0, true];	
	monitorDefence = false;
	patrolPointsTaken = patrolPointsTaken + 1;

	// consolidate injured?
	// [RGG_initStartPos, RGG_initStartPos] execVM "autoPatrolSystem\phase1_createObj.sqf";
	// systemchat "debug --- phase1_createObj ACTIVATED";
	// "MP debug --- phase1_createObj ACTIVATED" remoteExec ["systemChat", 0, true];
	// [RGG_patrol_obj, ] execVM "";
	[RGG_patrol_obj, RGG_patrol_obj] execVM "autoPatrolSystem\phase1_createObj.sqf";
	systemchat "debug --- phase1_createObj ACTIVATED - NOTE FROM INSURANCE POLICY";
	"MP debug --- phase1_createObj ACTIVATED - NOTE FROM INSURANCE POLICY" remoteExec ["systemChat", 0, true];

	sleep 10; 
	hint "patrol is moving out";
	_units = allUnits inAreaArray "missionOrigin";
	{
		_randomDir = selectRandom [270, 310, 00, 50, 90];
		_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
		_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
		_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
		SLEEP 2;
		_x setBehaviour "COMBAT";
		_x doMove _endPoint1;
	} forEach _units;
};


