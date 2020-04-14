
// create small opfor group at dest, or near dest, and send them to start, to engage patrol before they arrive at dest.. first wave 

systemChat "op first wave units being created - check perf";

_rndOp1 = selectRandom [6, 10, 14];

for "_i" from 1 to _rndOp1 do {
	_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];
	_grp = createGroup east;
	_pos = [RGG_patrol_obj, 0, 30] call BIS_fnc_findSafePos;
	_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
	
	_unit setBehaviour "COMBAT";
	_unit doMove RGG_missionOrigin; 
	sleep 1;						

	systemChat "debug --- opfor first defence wave unit created"; 	
	"MP debug --- opfor first defence wave unit created" remoteExec ["systemChat", 0, true];		
};

execVM "autoPatrolSystem\phase3_createOpforDefenders.sqf";
systemchat "debug --- phase3_createOpforDefenders ACTIVATED";
"MP debug --- phase3_createOpforDefenders ACTIVATED" remoteExec ["systemChat", 0, true];