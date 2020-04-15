// RFCHECK

sleep 180;

for "_i" from 1 to 3 do {
	
	sleep 300;
	systemChat "insurance blu move check";
	hint "insurance blu move check";

	if (RFCHECK) then {

		sleep 2;
		hint "BLU INSURANCE PROGRESSION";
		// this system is untested! 
		systemChat "Debug - patrol is in the wrong place .. sending them to live point !!!";
		"MP debug - patrol is in the wrong place .. sending them to live point !!!" remoteExec ["systemChat", 0, true];	

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
};



