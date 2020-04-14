
_bluCount = west countSide allUnits;

if ((_bluCount) < 8)  then {
	hint "REINFORCEMENTS ARE INBOUND";
	systemchat "debug --- friendly units created";
	"MP debug --- friendly units created" remoteExec ["systemChat", 0, true];
	[RGG_initStartPos] execVM "autoPatrolSystem\createFriendlyUnits.sqf";
};