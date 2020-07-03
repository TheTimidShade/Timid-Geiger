params [
	["_geigerItem", "", [""]],
	["_radSourceClass", "Sign_Sphere10cm_F", [""]]
];

GEIGER_ITEM = _geigerItem;
GEIGER_RANGE = 50;
RADSOURCE_CLASS = _radSourceClass;
GEIGER_ACTIVE = false;

{publicVariable _x;} forEach ["GEIGER_ITEM", "GEIGER_RANGE", "RADSOURCE_CLASS", "GEIGER_ACTIVE"];

if(!isNil "ace_interact_menu_fnc_createAction") then {
	_action = ["geiger_counter","Enable geiger counter","",{
		GEIGER_ACTIVE = true;
		[] spawn geiger_fnc_initGeiger;
	},{!GEIGER_ACTIVE && [] call geiger_fnc_hasGeiger},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;

	[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;

	_action = ["geiger_counter","Disable geiger counter","",{
		GEIGER_ACTIVE = false;
	},{GEIGER_ACTIVE},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;

	[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;
	
} else {
	[["Enable geiger counter", {
		GEIGER_ACTIVE = true;
		[] spawn geiger_fnc_initGeiger;
	},nil,0,false,true,"","!GEIGER_ACTIVE  && [] call geiger_fnc_hasGeiger && alive _target"]] call CBA_fnc_addPlayerAction;
	[["Disable geiger counter", {
		GEIGER_ACTIVE = false;
	},nil,0,false,true,"","GEIGER_ACTIVE"]]  call CBA_fnc_addPlayerAction;
};