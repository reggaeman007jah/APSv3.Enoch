// helps to provide mission flow 

while {true} do {
	_opfor = [];
	{if ((side _x) == east) then {_opfor pushBack _x}} forEach allUnits;

	{
		_Dir = random 360;
		_Dist = selectRandom [1, 5, 10]; 
		_moveTo = RGG_patrol_obj getPos [_Dist,_Dir]; 
		_x setBehaviour "COMBAT";
		_x doMove _moveTo;
		systemChat "body mooovin";
		sleep 10;
	} forEach _opfor;

	sleep 90;
};
	