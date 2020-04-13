
VAA_Activate = true;

sleep 10;

// initialise APS
execVM "autoPatrolSystem\autoPatrolSystem.sqf";
systemchat "debug --- APS ACTIVATED";
sleep 0.5;

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

heliRecon addAction ["Drop Smoke", "heliDrops\dropSmoke.sqf"];	

/*
how to do garbage control better ...

having a basic timer cycle can lead to immersion break 
so, maybe at a key point you create a new marker, on the position of the old obj marker - "cleanup" 
then set a timer to enable players to leave the area, then do cleanup just in that zone ... better chance that noone will see the function happen ..

*/