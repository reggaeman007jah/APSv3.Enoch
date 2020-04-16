
// DECIDE = false; // I think this is the only var i need to declare, as the motion.sqf relys on this.

// KILL WILDLIFE 
enableEnvironment [false, true];

// execVM "missionParams.sqf";
// init VA Arty

// execVM "VAMP_initParams\vampInitParams.sqf";
// sleep 2;
// execVM "voiceActivatedArty\VAA_Init.sqf";

// sp debugger 
while {true} do {

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

	systemChat format ["................. DEBUG / OBJECTIVE / TOTAL %1", _unitCount1]; 
	systemChat format ["................. DEBUG / OBJECTIVE / BLUFOR %1", _blueforCount1]; 
	systemChat format ["................. DEBUG / OBJECTIVE / OPFOR %1", _opforCount1]; 
	// Intel suggests %1 enemy units are advancing from %2 key position(s) in your immediate area", _numberOfAttackers, _numberOfAttackPoints];




	sleep 15;
};
