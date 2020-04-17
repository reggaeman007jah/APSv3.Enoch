
VAA_Activate = true;

sleep 10;

// initialise APS
execVM "autoPatrolSystem\autoPatrolSystem.sqf";
systemchat "debug --- APS ACTIVATED";
sleep 0.5;

// initialise Heli Systems
execVM "autoPatrolSystem\heliSystems\heliSystemsInit.sqf";
systemchat "debug --- Heli Systems ACTIVATED";
sleep 0.5;

// initialise debug UAV
execVM "autoPatrolSystem\UAV\uav.sqf";
systemchat "debug --- UAV Systems ACTIVATED";
sleep 0.5;

sleep 60;

hint "SP DEBUGGER ON";
// sp debugger 
while {true} do {

	sleep 15;

	_totalWest = west countSide allUnits;
	_totalWest = _totalWest -2;
	_totalEast = east countSide allUnits;
	_totalUnits = _totalWest + _totalEast;
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
	systemChat format [".................................................................. ", _totalUnits, _totalWest, _totalEast]; 
	systemChat format ["................. TOTAL UNITS: %1 / TOTAL WEST: %2 / TOTAL EAST: %3", _totalUnits, _totalWest, _totalEast]; 
	systemChat format ["................. REDZONE BLUFOR %1", _blueforCount1]; 
	systemChat format ["................. REDZONE OPFOR %1", _opforCount1]; 
	systemChat format [".................................................................. ", _totalUnits, _totalWest, _totalEast]; 

	if ((_totalWest <10) && (_blueforCount1 <10)) then {
		hint "RF called in now from initServer";
		systemChat "............ CALLING IN RF NOW ....................";
		// execVM "autoPatrolSystem\reinforcementSystems\bluforRF.sqf";
		sleep 5;
				hint "REINFORCEMENTS ARE INBOUND";
		systemchat "debug --- friendly units created";
		"MP debug --- friendly units created" remoteExec ["systemChat", 0, true];
		reinforcementsCalled = reinforcementsCalled + 1;
		[RGG_initStartPos] execVM "autoPatrolSystem\createFriendlyUnits.sqf";
		sleep 10;
	};

};


// SF Manager
//player addAction ["Pick up SF", "autoPatrolSystem\callSF.sqf"];	
// player setVariable ["isBusy", 111]; // i.e. not busy and needs a task
// execVM "autoPatrolSystem\checkSF.sqf";
// execVM "autoPatrolSystem\checkRF.sqf";
// execVM "autoPatrolSystem\motion.sqf";
// sleep 0.5;

// AI Behaviour Management
// player addAction ["Change Behaviour to Combat", "Modes\combatMode.sqf"];	
// player addAction ["Change Behaviour to Safe", "Modes\safeMode.sqf"];	
// player addAction ["Change Behaviour to Stealth", "Modes\stealthMode.sqf"];	
// player addAction ["Change Behaviour to Aware", "Modes\awareMode.sqf"];	

// heli drops
// player addAction ["Drop Smoke", "heliDrops\dropSmoke.sqf"];	
// player addAction ["Drop Flare", "heliDrops\dropFlare.sqf"];	
// heli2 addAction ["Drop Smoke", "heliDrops\dropSmoke.sqf"];	
// heli2 addAction ["Drop Flare", "heliDrops\dropFlare.sqf"];	

// Land Check Test Output
// player addAction ["Test findSafeSpot output", "landCheck\landCheck.sqf"];

// garbage collection - this needs to be mission-based
// while {true} do {
// 	sleep 600;
// 	// systemChat "cleanup";
// 	{ deleteVehicle _x } forEach allDead;
// };

/*
how to do garbage control better ...

having a basic timer cycle can lead to immersion break 
so, maybe at a key point you create a new marker, on the position of the old obj marker - "cleanup" 
then set a timer to enable players to leave the area, then do cleanup just in that zone ... better chance that noone will see the function happen ..

*/