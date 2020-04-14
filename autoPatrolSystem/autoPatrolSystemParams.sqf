/*
This file sets up some basic mission-flow params 
one/two/threePoint relates to states I use to determine how many directions the retalliation should psawn from 

April 2020
monitorDefence is a mission state - it needs to be declared at this early stage as it is used by an Insurance System, and needs to be declared (as false)
in order to work - but check this is actually the case! Maybe try deleting ti and se if it throws an error

toDo / April 2020 / confirm why I now do not need the commented out RF trigger value below 
*/

// RGG_reinforcementTrigger = 10;

ONEPOINT = false;
TWOPOINT = false;
THREEPOINT = false;

monitorDefence = false;

//base-counter var for tracking how many missions have been completed 
patrolPointsTaken = 0;
reinforcementsCalled = 0;
lostPatrols = 0;

// you could maybe also track mission time on each 'take' to track time for each mission point?