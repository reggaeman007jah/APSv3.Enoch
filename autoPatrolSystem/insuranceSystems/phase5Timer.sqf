
sleep 600;
// er is this right????
if (monitorDefence) then {

	systemChat "Debug - we've been here long enough, let's move out .. !!!";
	"MP debug - we've been here long enough, let's move out .. !!!" remoteExec ["systemChat", 0, true];	
	monitorDefence = false;

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

		_x setBehaviour "COMBAT";
		_x doMove _endPoint1;
	} forEach _units;

};


