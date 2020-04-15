// each taken point will become a temp med centre .. all injured units will go to nearest and wait for exfil 

// _fobPos = _this select 0;

// _vUnit1 = createVehicle ["B_Truck_01_medical_F", getMarkerPos "Objective 1", [], 30, "none"]; 
// _vUnit2 = createVehicle ["B_LSV_01_armed_black_F", getMarkerPos "Objective 1", [], 30, "none"]; 

_baseBuilding1 = createVehicle ["Land_Medevac_HQ_V1_F", getMarkerPos "Objective 1", [], 30, "none"]; 
_baseBuilding1 = createVehicle ["Land_IRMaskingCover_02_F", getMarkerPos "Objective 1", [], 30, "none"]; 

// is this safe??