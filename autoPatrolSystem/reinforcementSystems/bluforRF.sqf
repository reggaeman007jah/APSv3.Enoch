
_bluCount = west countSide allUnits;
// this is 18 to incorporate playable units and perma-base defences 

if ((_bluCount) < 18)  then {
	hint "REINFORCEMENTS ARE INBOUND";
	systemchat "debug --- friendly units created";
	"MP debug --- friendly units created" remoteExec ["systemChat", 0, true];
	reinforcementsCalled = reinforcementsCalled + 1;
	[RGG_initStartPos] execVM "autoPatrolSystem\createFriendlyUnits.sqf";
};

/*
Note, it is possible that a new platoon will be created and sent to the right place, but then the mission obj will change after the order is given 
So, a system is needed to ensure that if RF have been generated, that they always move in to the correct obj 
So, I guess when a new obj is created, it is important to drawn in all blufor to this new obj 
But, I want to ensure that I do not always draw down playable units from the perma-base - so I need to either exclude them from any calcs, or ensure the area i use is not overlapping the parmabase area 
And there are no auto-move orders that will cater for this issue 
So, this needs a solution. 
I think I had a solution before which was to check if there were any units in green, and then move them - this works but does not address the fact that a platoon could be walking a long way in the 
wrong direction before landing in green and then being redirected. 
So it makes sense to trigger a check after RF is called, to periodically check that their move orders reflect the correct obj 
My options are to use another inAreaArray system, or assignVar possibly 

I could True a bool on RF call, and false the bool when blufor is >10 in obj area perhaps?