// RFCHECK
// comments needed here 
// untested 

sleep 180; // no need to run this system straight away 

while {RFCHECK} do {

	hint "BLU INSURANCE MOVE";
	systemChat "Debug - redirecting all blu units to patrol obj during RFCHECK state !!!";
	"MP debug - redirecting all blu units to patrol obj during RFCHECK state !!!" remoteExec ["systemChat", 0, true];	

	_units = allUnits inAreaArray "BattleArea";
	{
		_randomDir = selectRandom [270, 310, 00, 50, 90];
		_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
		_unitDest = [RGG_patrol_obj, 5, 20] call BIS_fnc_findSafePos;
		_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
		SLEEP 2;
		_x setBehaviour "COMBAT";
		_x doMove _endPoint1;
	} forEach _units;
	sleep 180;
};

// note this must ONLY be applied to blufor units!!!
/*
_opfor = (side _x == opfor) inAreaArray "BattleArea";



	_blufor = [];
	{if ((side _x) == west) && (inAreaArray "BattleArea") then {_blufor pushBack _x}} forEach allUnits;

	{
		_Dir = random 360;
		_Dist = selectRandom [1, 5, 10]; 
		_moveTo = RGG_patrol_obj getPos [_Dist,_Dir]; 
		_x setBehaviour "COMBAT";
		_x doMove _moveTo;
		sleep 10;
	} forEach _opfor;